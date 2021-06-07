package locator;

import java.io.*;
import java.nio.file.Files;

public class Reportor {
    String model;
    int loc;
    double time;
    int rel;
    int val;
    int sliced;
    int total;

    static boolean first = true;

    public Reportor(String model, int loc, int rel, int val, int sliced, int total, double time){
        this.model = model;
        this.loc = loc;
        this.rel = rel;
        this.val = val;
        this.sliced = sliced;
        this.total = total;
        this.time = time;
    }

    public void writeToCSV(String path){
        if(first) {
            File f = new File(path);
            try {
                Files.deleteIfExists(f.toPath());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try(FileWriter fw = new FileWriter(path, true);
            BufferedWriter bw = new BufferedWriter(fw);
            PrintWriter out = new PrintWriter(bw);)

        {
            if(first){
                out.print("model,loc,total,sliced,rank,time\n");
                first = false;
            }
           // out.print(model + "," + loc + "," + rel + "," + val + ","+sliced+","+total+","+time+"\n");
            out.print(model + "," + loc + "," + total + "," + sliced + ", ,"+time+"\n");
        } catch (IOException e) {
            //exception handling left as an exercise for the reader
        }
    }
}
