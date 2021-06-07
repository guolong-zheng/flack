import edu.mit.csail.sdg.alloy4.Err;
import locator.runall;
import locator.runone;
import org.apache.commons.cli.*;

import java.nio.file.Paths;

public class loc {

    public static void main(String args[]) throws Err{
        Options options = new Options();

        options.addOption("f", "file_path", true, "target alloy model");
        options.addOption("m", "max_insts",true, "number of instance pairs");
        options.addOption("w", "write_cvs", false, "write statistics to cvs" );
        options.addOption("a", "run_multiple", false, "run all models in the directory");

        CommandLineParser parser = new GnuParser();

        try {
            CommandLine cli = parser.parse(options, args);

            String filePath = Paths.get(cli.getOptionValue("f")).toAbsolutePath().toString();

            int maxInsts = Integer.parseInt( cli.getOptionValue("m") );

            boolean write2cvs = cli.hasOption("w");

            boolean runMulti = cli.hasOption("a");

            if(runMulti)
                runall.run(filePath, maxInsts, write2cvs);
            else
                runone.run(filePath, maxInsts, write2cvs);

        } catch (ParseException e) {
            e.printStackTrace();
        }

    }
}
