package locator;

import edu.mit.csail.sdg.alloy4.Err;
import utility.FileUtil;

import java.nio.file.Path;

public class runall {
    public static void run(String path, int max, boolean write) throws Err {
        for (Path p : FileUtil.readAllFiles(path)) {
            String modelPath = p.toString();
            Locator l = new Locator(write);
            l.localize(modelPath, max);
        }
    }

    public static void main(String args[]){
        System.out.println("hello");
    }
}

