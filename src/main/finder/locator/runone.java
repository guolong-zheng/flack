package locator;

import edu.mit.csail.sdg.alloy4.Err;

public class runone {
    public static void run(String path, int max, boolean write){
        Locator l = new Locator(write);
        try {
            l.localize(path, max);
        } catch (Err err) {
            err.printStackTrace();
        }
    }
}
