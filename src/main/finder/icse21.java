import locator.runone;

import java.io.*;

public class icse21 {
    public static void main(String args[]){
        File file = new File("table3.txt");
        BufferedReader reader;
        try{
            reader = new BufferedReader( new FileReader(file));
            String line = reader.readLine();
            while(line != null){
                if(!line.startsWith("#")) {
                    String path = "benchmark/alloyfl/" + line + ".als";
                    runone.run(path, 5, true);
                }
                line = reader.readLine();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}