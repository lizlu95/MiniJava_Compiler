package x86_64sim.parser;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

import util.Utils;
import x86_64sim.Program;
import x86_64sim.parser.X86_64SimParser;


public class SimParser {

	/**
	 * Read input from a File and parse it into a program.
	 */
	public static Program parse(File file) throws IOException {
		FileReader input = new FileReader(file);
		try {
			return parse(input);
		}
		catch (ParseException p) {
			throw new Error("ParseException: " + p.getMessage() +"\n" + Utils.getContents(file));
		}
		finally { //No matter what happens, always close the file!
			input.close();
		}
	}

	/**
	 * Read input from a java.io.Reader and parse it into a Program. It is the
	 * caller's responsibility to close the Reader.
	 */
	private static Program parse(Reader input) throws ParseException {
		X86_64SimParser parser = new X86_64SimParser(input);
		return parser.Program();
	}

	private static String register(Reader input) throws ParseException {
		X86_64SimParser parser = new X86_64SimParser(input);
		return parser.Register();
	}

	public static String register(String inputText) throws ParseException {
		return register(new StringReader(inputText));
	}

	/**
	 * Read input directly from a String and parse it into an AST.
	 */
	public static Program parse(String inputText) {
		try {
			return parse(new StringReader(inputText));
		}
		catch (ParseException p) {
			throw new Error("ParseException: " + p.getMessage() +"\n" + inputText);
		}
	}
}
