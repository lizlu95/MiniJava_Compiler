package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils {
    private static String os = System.getProperty("os.name");

    public static boolean macOS() {
        return os.equals("Mac OS X");
    }

    /**
     * Fetch the entire contents of a text file, and return it in a String.
     * This style of implementation does not throw Exceptions to the caller.
     *
     * @param aFile is a file which already exists and can be read.
     * @author Unknown: code taken from here:
     * http://www.javapractices.com/topic/TopicAction.do?Id=42
     */
    static public String getContents(File aFile) {
        //...checks on aFile are elided
        StringBuilder contents = new StringBuilder();

        try {
            //use buffering, reading one line at a time
            //FileReader always assumes default encoding is OK!
            BufferedReader input = new BufferedReader(new FileReader(aFile));
            try {
                String line = null; //not declared within while loop
                /*
				 * readLine is a bit quirky :
				 * it returns the content of a line MINUS the newline.
				 * it returns null only for the END of the stream.
				 * it returns an empty String if two newlines appear in a row.
				 */
                while ((line = input.readLine()) != null) {
                    contents.append(line);
                    contents.append('\n');
                }
            } finally {
                input.close();
            }
        } catch (IOException ex) {
            contents.append("Couldn't read file " + aFile + "\n");
        }

        return contents.toString();
    }

    static public String getExpected(File aFile) {
        Matcher m = Pattern.compile("\\.[^.]+$").matcher(aFile.getPath());
        String outName = m.replaceAll(".out");
        String expected = Utils.getContents(new File(outName));
        return expected;
    }

    static public String getOtherExpected(File aFile) {
        Matcher m = Pattern.compile("\\.[^.]+$").matcher(aFile.getPath());
        String outName = m.replaceAll(".vtout");
        File f = new File(outName);
        if (f.exists()) {
            String expected = Utils.getContents(f);
            return expected;
        } else {
            return null;
        }
    }

    static public String changeSuffix(File aFile, String newSuffix) {
        Matcher m = Pattern.compile("\\.[^.]+$").matcher(aFile.getPath());
        String outName = m.replaceAll("." + newSuffix);
        return outName;
    }

    public static void setContents(File toutfile, String output) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(toutfile));
            try {
                writer.write(output);
            } finally {
                writer.close();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
