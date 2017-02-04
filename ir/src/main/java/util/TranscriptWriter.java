package util;

import org.junit.jupiter.api.Assertions;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

/**
 * A Writer that can be used to write test output to. It writes test output into a
 * wrapped writer and at the same times logs the output to a "transcript" logfile.
 * <p>
 * The TranscriptWriter has two modes of operation:
 * <p>
 * If the log file does not exist, then it will be created and the output will simply be
 * logged to it.
 * <p>
 * If the log file already exists, then instead of writing to the file, the TranscriptWriter
 * will verify whether the actual output matches the contents of the log file.
 * It will throw an error if the output is not identical to the contents of the existing
 * logfile.
 * <p>
 * Textual markers can be placed in the transcript to allow for "error recovery". This
 * allows the verifier to pick up checking the output of later tests at these markers
 * when some prior test failed.
 * <p>
 * The idea is to use this class to generate a test transcript. Once you have manually
 * checked the test output is as expected, you can let the TranscriptWriter ensure that
 * future runs of the tests keep reproducing the same output.
 *
 * @author kdvolder
 */
public class TranscriptWriter extends Writer {

    private static class MatchWriterWriter extends MatchWriter {

        private BufferedWriter out;

        public MatchWriterWriter(File logFile) throws IOException {
            this.out = new BufferedWriter(new FileWriter(logFile));
        }

        @Override
        public void mark(String marker) throws IOException {
            out.write(marker);
            out.write('\n');
        }

        @Override
        public void close() throws IOException {
            out.close();
        }

        @Override
        public void flush() throws IOException {
            out.flush();
        }

        @Override
        public void write(char[] cbuf, int off, int len) throws IOException {
            out.write(cbuf, off, len);
        }

    }

    private static abstract class MatchWriter extends Writer {

        public abstract void mark(String marker) throws IOException;

        public static MatchWriter make(File logFile) throws IOException {
            if (logFile.exists())
                return new MatchWriterMatcher(logFile);
            else
                return new MatchWriterWriter(logFile);
        }

    }

    /**
     * A Writer that matches what is written to it to an existing file, instead of
     * actually writing to the file.
     */
    private static class MatchWriterMatcher extends MatchWriter {

        private BufferedReader input;
        private boolean lastCharOK = true;
        StringBuffer expectedLine = new StringBuffer(), actualLine = new StringBuffer();
        int lineNumber = 1;

        // WISHER
        private boolean wasCR;

        public MatchWriterMatcher(BufferedReader expectedOutput) {
            input = expectedOutput;
        }

        public MatchWriterMatcher(File logFile) throws FileNotFoundException {
            this(new BufferedReader(new FileReader(logFile)));

            // WISHER: to make tests also pass on DOS boxes with different newline conventions
            wasCR = false;
        }

        @Override
        public void close() throws IOException {
            Assertions.assertEquals(-1, input.read(), "Transcript log has more data");
            input.close();
        }

        @Override
        public void flush() throws IOException {
        }

        @Override
        public void write(char[] cbuf, int off, int len) throws IOException {
            for (int i = 0; i < len; i++) {
                write(cbuf[off + i]);
            }
        }

        @Override
        public void write(int c) throws IOException {
            Assertions.assertFalse(c < 0, "Character code are positive no?");

            //int expect = input.read();

            // WISHER
            int expect; // = input.read();

            if (wasCR) {
                expect = '\n';
                wasCR = false;
            } else
                expect = input.read();
            if (expect == '\n') {
                lineNumber++;
                expectedLine.delete(0, expectedLine.length());
                actualLine.delete(0, actualLine.length());
            } else {
                expectedLine.append((char) expect);
                actualLine.append((char) c);
            }
            if ((expect != c) && (expect == '\n') && (c == '\r'))
                wasCR = true;
            else {
                lastCharOK = c == expect;
                Assertions.assertTrue(expect >= 0, "Existing transcript ended unexpectedly");

                Assertions.assertEquals((char) expect, (char) c, "\nLine: " + lineNumber + "\nExpected: \"" + expectedLine.toString() +
                        "\"\nActual: \"" + actualLine.toString() + "\"\n");
            }
        }

        @Override
        public void mark(String marker) throws IOException {
            boolean recoveryMode = !lastCharOK;
            String line = input.readLine();
            lineNumber++;
            if (recoveryMode && line != null && marker.endsWith(line)) {
                //In recovery mode, it is possible that beginning of the marker was "eaten"
                //by the preceding erroneous output, we should tolerate that!
                return;
            }
            boolean noSkip = marker.equals(line);
            while (line != null && !line.equals(marker)) {
                line = input.readLine();
                lineNumber++;
            }
            Assertions.assertTrue(line != null, "Marker " + marker + " not found");
            if (!recoveryMode)
                Assertions.assertTrue(noSkip, "Marker was found, but needed to skip some data in the log (a test did not produce all expected output?)");
        }

    }

    private BufferedWriter stdout;
    private MatchWriter log;

    private TranscriptWriter(BufferedWriter out, File logFile) throws IOException {
        this.stdout = out;
        this.log = MatchWriter.make(logFile);
    }

    public TranscriptWriter(File logFile) throws IOException {
        this(new BufferedWriter(new OutputStreamWriter(System.out)), logFile);
    }

    @Override
    public void flush() throws IOException {
        log.flush();
        stdout.flush();
    }

    @Override
    public void write(char[] cbuf, int off, int len) throws IOException {
        log.write(cbuf, off, len);
        stdout.write(cbuf, off, len);
    }

    @Override
    public void close() throws IOException {
        log.close();
        stdout.flush();
    }

    /**
     * If some test fails to match its expected output, this will disrupt the matching
     * of subsequent tests as well. To avoid this problem, ensure that each test inserts
     * an appropriate marker at its beginning and end. The Transcript verifier will attempt
     * to skip forward to a matching marker, so that the transcript for the next test can
     * be picked up at the right place.
     * <p>
     * The marker String should not contain newline characters!
     */
    public void mark(String marker) throws IOException {
        Assertions.assertFalse(marker.contains("\n"), "Marker String should not contain newline characters");
        log.mark(marker);
        stdout.write(marker + "\n");
    }

    public void println(String string) throws IOException {
        write(string.toCharArray());
        write('\n');
        flush();
    }

    public void println() throws IOException {
        write('\n');
    }

    public void print(String string) throws IOException {
        write(string.toCharArray());
    }

}
