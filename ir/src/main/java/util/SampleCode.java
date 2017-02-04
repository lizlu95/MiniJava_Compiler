package util;

import java.io.File;
import java.io.FilenameFilter;
import java.util.Arrays;

/**
 * We use this class as a place to put some methods and constants to get at
 * the sample code in the sample directory.
 *
 * @author kdvolder
 */
public class
SampleCode {

    /**
     * Points to a directory containing sample code to parse.
     */
    public final static File sample_dir = new File("sample");

    /**
     * @return An array of sample files whose names end with a given suffix.
     */
    public static File[] sampleFiles(final String... suffixes) {
        FilenameFilter f = new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                for (String suffix : suffixes)
                    if (name.endsWith("." + suffix)) return true;
                return false;
            }
        };
        File[] files = sample_dir.listFiles(f);
        // Should sort the array to ensure that we produce the files in the same order
        // independent of the order in which the OS produces them.
        if (files == null || files.length == 0) {
            System.out.print("There are no sample files with suffixes:");
            for (String s : suffixes)
                System.out.print(" " + s);
            System.out.println();
            return new File[0];
        }
        Arrays.sort(files);
        return files;
    }


    /**
     * @return An array of sample .s files.
     */
    public static File[] sampleSFiles() {
        return sampleFiles("s");
    }

    /**
     * @return An array of sample .s files.
     */
    public static File[] sampleSSFiles() {
        return sampleFiles("ss");
    }

}
