package tests;

import java.io.*;

public class icse21 {
    public static void main(String args[]){
        File file = new File("benchmark/list.txt");
        BufferedReader reader;
        try {
            reader = new BufferedReader( new FileReader(file) );
            String line = reader.readLine();
            while(line != null){
                String path = "benchmark/alloy/"+line+".als";

                line = reader.readLine();
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
