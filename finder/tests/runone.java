package tests;

import edu.mit.csail.sdg.alloy4.Err;

public class runone {
    public static void main(String[] args){
      //  String path = "benchmark/taco/SinglyLinkedListCountNodes1Bug7.als";
       // String path = "benchmark/taco/sll-contains-9.als";
      // String path = "benchmark/iot/out/latest/tmp/bundle-03.QpykGs.als";
     //  String path  = "benchmark/android/permission.als";
        String path = "benchmark/alloyfl/1bug/arr4.als";
      //  String path = "benchmark/a4f/Classroom_inv9_2.als";
        Locator l = new Locator(false);
        try {
            l.localize(path, 5);
        } catch (Err err) {
            err.printStackTrace();
        }
    }
}
