package utility;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class FileUtil {
    public static List<Path> readAllFiles(String path){
        List<Path> fileList = new ArrayList<>();
        try {
            Files.list(Paths.get(path)).sorted(new Comparator<Path>() {
                @Override
                public int compare(Path o1, Path o2) {
                    String[] part1 = o1.toString().split("(?<=\\D)(?=\\d)");
                    String[] part2 = o2.toString().split("(?<=\\D)(?=\\d)");
                    if (part1[0].compareTo(part2[0]) == 0) {
                        int p11 = 0;
                        int p12 = 0;
                        int p21 = 0;
                        int p22 = 0;
                        if (part1.length == 3) {
                            p11 = Integer.parseInt(part1[1].substring(0, part1[1].length() - 1));
                            p12 = Integer.parseInt(part1[2].substring(0, part1[2].length() - 4));
                        } else
                            p11 = Integer.parseInt(part1[1].substring(0, part1[1].length() - 4));
                        if (part2.length == 3) {
                            p21 = Integer.parseInt(part2[1].substring(0, part2[1].length() - 1));
                            p22 = Integer.parseInt(part2[2].substring(0, part2[2].length() - 4));
                        } else
                            p21 = Integer.parseInt(part2[1].substring(0, part2[1].length() - 4));

                        if (p11 == p21) {
                            return p12 - p22;
                        }
                        return p11 - p21;
                    } else
                        return part1[0].compareTo(part2[0]);
                }
            }).forEach(f -> fileList.add(f));
        } catch (IOException e) {
            e.printStackTrace();
        }
        assert fileList.size() > 0;
        return fileList;
    }
}
