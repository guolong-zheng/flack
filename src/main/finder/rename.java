import java.io.File;

public class rename {
    public static void main(String args[]){
        File folder = new File("benchmark/alloyfl/");
        for(File f : folder.listFiles()){
            if(f.getName().contains("student")){
                System.out.println("benchmark/alloyfl/ssl"+
                        f.getName().substring(7, f.getName().length()));
               f.renameTo( new File("benchmark/alloyfl/ssl"+
                       f.getName().substring(7, f.getName().length())) );
            }
        }
    }
}
