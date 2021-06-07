# AlloyParser

`AlloyParser` is an Java API built on top of
[Alloy](http://alloy.mit.edu/alloy/).  It implements a easy to use
Visitor Pattern to manipulate Alloy AST nodes.  The following tools
are built using `AlloyParser` API:

## AlloyFLCore

`AlloyFLCore` is a tool that helps localize faults in Alloy models given tests.
The tool is built on top of AlloyParser and under alloyfl package.

# Requirements:

* Supported Operating Systems
  - Linux (64 bit)
  - Mac OS X (64 bit)

* Tools
  - [Bash 4](http://tldp.org/LDP/abs/html/bashver4.html): Must be
    installed and accessible from `PATH`.
  - [Alloy 4.2](http://alloy.mit.edu/alloy/downloads/alloy4.2.jar):
    Must be in the classpath.
  - [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html):
    Must be installed and accessible from `PATH`.  JVM should support 32
    bit native library if you use minisat solver.
  - libstdc++.so.5: `sudo apt-get install libstdc++5 libstdc++5:i386`.
    Must be installed if you use minisat solver.

# Reproduce Experiment:

 * Run `./aparser.sh --build` to build the library
 * Run `./aparser.sh --prepare-all` to store real fault locations and copy
   faulty models into working directory.
 * Run `./aparser.sh --hybridfl-average-all
   experiments/test-suite/mutation-based/100 ochiai 0.4` to run AlloyFLHy with
   all (100%) tests using Ochiai formula and (0.4 * AlloyFLMu + 0.6 * AlloyFLCo)
 * Run `./aparser.sh --report-hybridfl-average-all 100 ochiai 0.4` to collect
   distance-based and top-k metrics for AlloyFLHy given the above setting

The script also allows users to run AlloyFLUn, AlloyFLCo, AlloyFLMu
independently.

The results are stored as eff.info in the experiments/ directory.

# Publications
* "Fault Localization for Declarative Models in Alloy."
    Kaiyuan Wang, Allison Sullivan, Darko Marinov, and Sarfraz Khurshid, ISSRE 2020

# License

MIT License, see `LICENSE` for more information.


for file in ./*; do
  echo "${file##*/}"
done
