package alloyfl.hybrid;

import alloyfl.coverage.util.CoverageScoreFormula;
import alloyfl.coverage.util.TestResult;
import alloyfl.coverage.util.TestRunner;
import alloyfl.hybrid.opt.AdvancedHybridFaultLocatorOpt;
import alloyfl.hybrid.visitor.DescendantCollector;
import alloyfl.metrics.visitor.NodeCountingVisitor;
import alloyfl.mutation.util.MutationScoreFormula;
import alloyfl.mutation.util.ScoreInfo;
import alloyfl.mutation.visitor.MutationBasedFaultDetector;
import com.google.common.collect.Ordering;
import com.google.common.collect.Sets;
import edu.mit.csail.sdg.parser.CompModule;
import parser.ast.nodes.*;
import parser.ast.visitor.VoidVisitorAdapter;
import parser.etc.Names;
import parser.etc.Pair;
import parser.util.AlloyUtil;
import parser.util.Codec;
import parser.util.FileUtil;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

import static parser.etc.Context.logger;
import static parser.util.AlloyUtil.countDescendantNum;
import static parser.util.StringUtil.afterSubstring;
import static parser.util.StringUtil.beforeSubstring;
import static parser.util.Util.printAdvancedHybridAverageFaultLocatorUsage;

public class AdvancedHybridAverageFaultLocator {

  private static final Map<MutationScoreFormula, CoverageScoreFormula> MUTATION_FORMULA_TO_COVERAGE_FORMULA;

  static {
    MUTATION_FORMULA_TO_COVERAGE_FORMULA = new LinkedHashMap<>();
    MUTATION_FORMULA_TO_COVERAGE_FORMULA
        .put(MutationScoreFormula.TARANTULA, CoverageScoreFormula.TARANTULA);
    MUTATION_FORMULA_TO_COVERAGE_FORMULA
        .put(MutationScoreFormula.OCHIAI, CoverageScoreFormula.OCHIAI);
    MUTATION_FORMULA_TO_COVERAGE_FORMULA.put(MutationScoreFormula.OP2, CoverageScoreFormula.OP2);
    MUTATION_FORMULA_TO_COVERAGE_FORMULA
        .put(MutationScoreFormula.BARINEL, CoverageScoreFormula.BARINEL);
    MUTATION_FORMULA_TO_COVERAGE_FORMULA
        .put(MutationScoreFormula.DSTAR, CoverageScoreFormula.DSTAR);
  }

  /**
   * Coverage + Mutation + Prioritize nodes with score of 1 suspiciousness.
   */
  public static void localize(AdvancedHybridFaultLocatorOpt opt) {
    long time = System.currentTimeMillis();

    CompModule modelModule = AlloyUtil.compileAlloyModule(opt.getModelPath());
    assert modelModule != null;
    ModelUnit modelUnit = new ModelUnit(null, modelModule);
    // Run coverage based fault localization.
    List<TestResult> testResults = TestRunner
        .runTests(modelUnit, opt.getTestSuitePath(), opt.getPSV(), opt.getOptions());
    // True means the test passes.
    List<Boolean> testBooleanResults = new ArrayList<>();
    Set<Node> nodesCoveredByFailingTests = testResults.stream()
        .filter(testResult -> {
          testBooleanResults.add(!testResult.isFailed());
          return testResult.isFailed();
        })
        .map(TestResult::getRelevantNodes)
        .flatMap(Collection::stream)
        .collect(Collectors.toSet());
    // Count descendants to break tie when ranking nodes.
    Map<Node, Integer> descNum = countDescendantNum(modelUnit);
    // We want to make sure that the SBFL and MBFL formulas are same.
    // We use Ochiai formula for now.
    List<Pair<Node, Double>> rankedResultsByCoverageFL = MUTATION_FORMULA_TO_COVERAGE_FORMULA
        .get(opt.getFormula())
        .computeNodeAndScore(testResults, descNum);
    // Keep the order of the node in descending suspiciousness order.
    Map<Node, Double> nodeToScoreByCoverageFL = new LinkedHashMap<>();
    rankedResultsByCoverageFL.stream()
        .filter(pair -> nodesCoveredByFailingTests.contains(pair.a))
        .forEach(pair -> nodeToScoreByCoverageFL.put(pair.a, pair.b));
    // Run mutation-based fault localization.
    Map<Node, Node> descendant2root = new HashMap<>();
    Set<Node> visitedNodes = new HashSet<>();
    nodeToScoreByCoverageFL.forEach((rankedNode, score) -> {
      // Collect all descendants of the ranked node.
      DescendantCollector descendantCollector = new DescendantCollector(rankedNode, visitedNodes);
      modelUnit.accept(descendantCollector, null);
      // Descendants should never overlap if we use coverage based technique, but we still use
      // visitedNodes in case if we want to switch to other techniques.
      descendantCollector.getDescendants().forEach(node -> {
        descendant2root.put(node, rankedNode);
        visitedNodes.add(node);
      });
    });
    // Mutate descendants.
    MutationBasedFaultDetector mbfd = new MutationBasedFaultDetector(testBooleanResults, opt,
        visitedNodes);
    modelUnit.accept(mbfd, null);
    Map<Node, List<ScoreInfo>> rootToDescendantScoreInfo = new HashMap<>();
    // Group score info.
    for (ScoreInfo scoreInfo : mbfd.constructScoreInfos(descNum)) {
      Node root = descendant2root.get(scoreInfo.getNode());
      assert root != null;
      if (!rootToDescendantScoreInfo.containsKey(root)) {
        rootToDescendantScoreInfo.put(root, new ArrayList<>());
      }
      rootToDescendantScoreInfo.get(root).add(scoreInfo);
    }
    // Collect unsat nodes and all descendants.
    Set<Node> unsatNodesToExclude = nodesToExcludeFromUnsatCore(modelUnit);
    Map<Node, Node> unsatDecendantToRoot = new HashMap<>();

    Set<Node> unsatRootNodes = testResults.stream()
        .filter(TestResult::isFailed)
        .filter(testResult -> testResult.getUnsatNodes() != null)
        // Collect all unsat core nodes.
        .flatMap(testResult -> testResult.getUnsatNodes().stream())
        .collect(Collectors.toSet());
    Set<Node> unsatNodesToReport = new HashSet<>(
        Sets.difference(unsatRootNodes, unsatNodesToExclude));
    Map<Node, Integer> unsatDescendantToRootSize = new HashMap<>();
    Ordering<Node> largestUnsatNodesFirst = new Ordering<Node>() {
      @Override
      public int compare(Node left, Node right) {
        return -Integer.compare(numberOfDescendants(left), numberOfDescendants(right));
      }
    };
    // We iterate over larger nodes first so that the child unsat node can override the mapping.
    largestUnsatNodesFirst.sortedCopy(unsatNodesToReport)
        .forEach(node -> {
          DescendantCollector descendantCollector = new DescendantCollector(node);
          modelUnit.accept(descendantCollector, null);
          int rootSize = descendantCollector.getDescendants().size();
          descendantCollector.getDescendants()
              .forEach(descendant -> {
                unsatDescendantToRootSize.put(descendant, rootSize);
                unsatDecendantToRoot.put(descendant, node);
              });
        });
    List<Node> reportedNodes = rankNodesByAverage(opt, nodeToScoreByCoverageFL,
        rootToDescendantScoreInfo, unsatDescendantToRootSize, unsatDecendantToRoot,
        unsatNodesToReport, descNum);
    String modelName = beforeSubstring(afterSubstring(opt.getModelPath(), Names.SLASH, true),
        Names.DOT, false);
    Codec.serialize(
            Pair.of(modelUnit, reportedNodes),
            Paths.get(opt.getResultDirPath(), modelName + Names.DOT_LST).toString());
  }

  private static int numberOfDescendants(Node node) {
    NodeCountingVisitor nodeCountingVisitor = new NodeCountingVisitor();
    node.accept(nodeCountingVisitor, null);
    return nodeCountingVisitor.getCnt();
  }

  private static List<Node> rankNodesByAverage(
      AdvancedHybridFaultLocatorOpt opt,
      Map<Node, Double> nodeToScoreByCoverageFL,
      Map<Node, List<ScoreInfo>> rootToDescendantScoreInfo,
      Map<Node, Integer> unsatDescendantToRootSize,
      Map<Node, Node> unsatDescendantToRoot,
      Set<Node> unsatNodes,
      Map<Node, Integer> descNum) {
    // Rank nodes by groups.
    List<Pair<Node, Double>> rankedNodeAndScore = new ArrayList<>();
    Set<Node> mutatedNodes = new HashSet<>();
    nodeToScoreByCoverageFL.forEach((rankedNode, scoreByCoverageFL) -> {
      if (rootToDescendantScoreInfo.containsKey(rankedNode)) {
        List<ScoreInfo> scoreInfos = rootToDescendantScoreInfo.get(rankedNode);
        scoreInfos.forEach(scoreInfo -> {
          Node node = scoreInfo.getNode();
          // Use the average suspiciousness score from both SBFL and MBFL for the node.
          double averageScore =
              (nodeToScoreByCoverageFL.get(rankedNode) + scoreInfo.getScore()) / 2.0;
//          String nodePathString = AlloyUtil
//              .computeNodePathAsString(node, new PrettyStringVisitor());
//          if (nodePathString.contains("pred AllExtObject[] {\n"
//              + "(all c: (one (Class - Object)) {\n"
//              + "(Object in ((c.ext).(^ext)))\n"
//              + "})\n"
//              + "}\n"
//              + "|\n"
//              + "{\n"
//              + "(all c: (one (Class - Object)) {\n"
//              + "(Object in ((c.ext).(^ext)))\n"
//              + "})\n"
//              + "}\n"
//              + "|\n"
//              + "(all c: (one (Class - Object)) {\n"
//              + "(Object in ((c.ext).(^ext)))\n"
//              + "})\n"
//              + "|\n"
//              + "{\n"
//              + "(Object in ((c.ext).(^ext)))\n"
//              + "}\n"
//              + "|\n"
//              + "(Object in ((c.ext).(^ext)))\n"
//              + "|\n"
//              + "((c.ext).(^ext))")
//              ||
//              nodePathString.contains("pred ObjectNoExt[] {\n"
//                  + "(all c: (one Class) {\n"
//                  + "(Object !in (c.(^ext)))\n"
//                  + "})\n"
//                  + "}\n"
//                  + "|\n"
//                  + "{\n"
//                  + "(all c: (one Class) {\n"
//                  + "(Object !in (c.(^ext)))\n"
//                  + "})\n"
//                  + "}\n"
//                  + "|\n"
//                  + "(all c: (one Class) {\n"
//                  + "(Object !in (c.(^ext)))\n"
//                  + "})\n"
//                  + "|\n"
//                  + "{\n"
//                  + "(Object !in (c.(^ext)))\n"
//                  + "}\n"
//                  + "|\n"
//                  + "(Object !in (c.(^ext)))\n"
//                  + "|\n"
//                  + "(c.(^ext))\n"
//                  + "|\n"
//                  + "(^ext)")) {
//            System.out.println("==========");
//            System.out.println(nodePathString);
//            System.out.println("CoverageFL Score: " + nodeToScoreByCoverageFL.get(rankedNode));
//            System.out.println("MutationFL Score: " + scoreInfo.getScore());
//            System.out.println(
//                "UnsatCore Adjustment Score: 1 / (" + unsatDescendantToRootSize.get(node)
//                    + " + 3)");
//            System.out.println(
//                "Final Score: " + adjustSuspiciousScore(opt, node, unsatDescendantToRootSize,
//                    unsatDescendantToRoot,
//                    unsatNodes, averageScore));
//          }
          rankedNodeAndScore
              .add(Pair.of(node,
                  adjustSuspiciousScore(opt, node, unsatDescendantToRootSize, unsatDescendantToRoot,
                      unsatNodes, averageScore)));
          mutatedNodes.add(node);
        });
      }
      if (mutatedNodes.add(rankedNode)) {
        // If the declaring paragraph node is not reported by MBFL, then we use SBFL's score.
        rankedNodeAndScore.add(Pair.of(rankedNode,
            adjustSuspiciousScore(opt, rankedNode, unsatDescendantToRootSize, unsatDescendantToRoot,
                unsatNodes, nodeToScoreByCoverageFL.get(rankedNode))));
      }
    });
    Map<Node, Double> nodeToScore = rankedNodeAndScore.stream()
        .collect(Collectors.toMap(pair -> pair.a, pair -> pair.b));
    unsatNodes.forEach(unsatNodeWithNoMutatedDescendants -> {
      // If the unsat node has no mutated descendants in MBFL, we use the score of the first mutated
      // ancestor as the base to compute the score.
      Node cur = unsatNodeWithNoMutatedDescendants;
      while (cur != null && !nodeToScore.containsKey(cur)) {
        cur = cur.getParent();
      }
      double score = opt.compute(nodeToScore.getOrDefault(cur, 0.0), unsatDescendantToRootSize
          .get(unsatNodeWithNoMutatedDescendants));
      rankedNodeAndScore.add(Pair.of(unsatNodeWithNoMutatedDescendants, score));
    });
    rankedNodeAndScore.sort((p1, p2) -> {
      int cmpRes = Double.compare(p2.b, p1.b);
      if (cmpRes != 0) {
        return cmpRes;
      }
      return Integer.compare(descNum.get(p1.a), descNum.get(p2.a));
    });
    return rankedNodeAndScore.stream().map(pair -> pair.a).collect(Collectors.toList());
  }

  private static double adjustSuspiciousScore(
      AdvancedHybridFaultLocatorOpt opt,
      Node nodeToCheck,
      Map<Node, Integer> unsatDescendantToRootSize,
      Map<Node, Node> unsatDescendantToRoot,
      Set<Node> unsatNodes,
      double score) {
    if (unsatDescendantToRootSize.containsKey(nodeToCheck)) {
      unsatNodes.remove(unsatDescendantToRoot.get(nodeToCheck));
      return opt.compute(score, unsatDescendantToRootSize.get(nodeToCheck));
    }
    return score;
  }

  private static Set<Node> nodesToExcludeFromUnsatCore(ModelUnit modelUnit) {
    VoidVisitorAdapter<Set<Node>> nodesCollector = new VoidVisitorAdapter<Set<Node>>() {
      @Override
      public void visit(SigExpr n, Set<Node> collectedNodes) {
        collectedNodes.add(n);
      }

      @Override
      public void visit(FieldExpr n, Set<Node> collectedNodes) {
        collectedNodes.add(n);
      }

      @Override
      public void visit(VarExpr n, Set<Node> collectedNodes) {
        collectedNodes.add(n);
      }
    };
    Set<Node> collectedNodes = new HashSet<>();
    modelUnit.accept(nodesCollector, collectedNodes);
    return collectedNodes;
  }

//  public static void main(String... args) {
//    if (args.length != 5) {
//      logger.error("Wrong number of arguments: " + args.length);
//      printAdvancedHybridAverageFaultLocatorUsage();
//      return;
//    }
//    String modelPath = args[0];
//    String testPath = args[1];
//    int scope = Integer.valueOf(args[2]);
//    String formula = args[3];
//    String resultDirPath = args[4];
//    if (!FileUtil.fileExists(modelPath)) {
//      logger.error("Cannot find model at " + modelPath);
//      printAdvancedHybridAverageFaultLocatorUsage();
//      return;
//    }
//    if (!FileUtil.fileExists(testPath)) {
//      logger.error("Cannot find test file at " + testPath);
//      printAdvancedHybridAverageFaultLocatorUsage();
//      return;
//    }
//    FileUtil.createDirsIfNotExist(resultDirPath);
//    AdvancedHybridFaultLocatorOpt opt = new AdvancedHybridFaultLocatorOpt(modelPath, testPath,
//        scope, formula, resultDirPath);
//    localize(opt);
//  }

  public static void main(String args[]){
    int scope = Integer.valueOf("3");
    String formula = "ochiai";
    String resultDirPath = "experiments/res/";
    List<Path> list = new ArrayList<>();
    try {
      Files.list(Paths.get("experiments/exp/realbugs")).sorted(new Comparator<Path>() {
        @Override
        public int compare(Path o1, Path o2) {
          String[] part1 = o1.toString().split("(?<=\\D)(?=\\d)");
          String[] part2 = o2.toString().split("(?<=\\D)(?=\\d)");
          if( part1[0].compareTo(part2[0]) == 0){
            int p11 = 0;
            int p12 = 0;
            int p21 = 0;
            int p22 = 0;
            if( part1.length == 3 ){
              p11 = Integer.parseInt( part1[1].substring(0, part1[1].length()-1) );
              p12 = Integer.parseInt( part1[2].substring(0, part1[2].length()-4) );
            }else
              p11 = Integer.parseInt( part1[1].substring(0, part1[1].length()-4) );
            if( part2.length == 3){
              p21 = Integer.parseInt( part2[1].substring(0, part2[1].length()-1) );
              p22 = Integer.parseInt( part2[2].substring(0, part2[2].length()-4) );
            }else
              p21 = Integer.parseInt( part2[1].substring(0, part2[1].length()-4) );

            if( p11 == p21){
              return p12 - p22;
            }
            return p11 - p21;
          }else
            return part1[0].compareTo(part2[0]);
        }
      }).forEach(f -> list.add(f) );
    } catch (IOException e) {
      e.printStackTrace();
    }

    for(Path p : list) {
      String modelPath = p.toString();
      String testPath = p.getFileName().toString();
      testPath = testPath.split("[0-9]")[0];
      if(!testPath.contains("als"))
        testPath = testPath + ".als";
      testPath = "experiments/test-suite/mutation-based/100/"+testPath;
      if (!FileUtil.fileExists(modelPath)) {
        logger.error("Cannot find model at " + modelPath);
        printAdvancedHybridAverageFaultLocatorUsage();
        return;
      }
      if (!FileUtil.fileExists(testPath)) {
        logger.error("Cannot find test file at " + testPath);
        printAdvancedHybridAverageFaultLocatorUsage();
        return;
      }
      FileUtil.createDirsIfNotExist(resultDirPath);
      AdvancedHybridFaultLocatorOpt opt = new AdvancedHybridFaultLocatorOpt(modelPath, testPath,
              scope, formula, resultDirPath);
      localize(opt);
    }
  }
}
