package x86_64sim.test;

import java.io.File;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import x86_64sim.Program;
import x86_64sim.parser.SimParser;
import util.SampleCode;

public class TestX86_64SimParse {
	protected void accept(String input) throws Exception {
		System.out.println("parsing string: "+ input);
		Program p = SimParser.parse(input);
		System.out.println("Program:");
		System.out.println(p.dump());
	}
	
	protected void accept(File file) throws Exception {
		System.out.println("parsing file: "+file);
		Program p = SimParser.parse(file);
		System.out.println("Program:");
		System.out.println(p.dump());
	}
	
	@Test
	public void testRunQuad() throws Exception {
		accept(".data\n" +
				"_a:\n" +
				".quad    23\n" +
				".text\n" +
				"main:\n" +
				"leaq    _a(%rip), %rax\n" +
				"movq    (%rax), %rax\n" +
				"ret\n");
	}

	@Test
	public void testRegister() throws Exception {
		String input = "t001";
		System.out.println("looking for register in string: "+ input);
		String p = SimParser.register(input);
		System.out.println("Register:" + p);		
	}
	@Test
	public void testBasic() throws Exception {
		accept("main:\n");
	}

	@Test
	public void testDirectives() throws Exception {
		accept(".text \n");
		accept(".section random jibberish \n");
		accept(".size other random stuff \n");
		accept(".type @foo \n");
		accept(".data\n");
		accept(".align 4\n");
		accept(".quad 45\n");
		accept(".quad _A_ainit\n");
	}

	@Test
	public void testReg() throws Exception {
		accept("movq %rax, t001\n");
	}
	
	@Test
	public void testRet() throws Exception {
		accept("ret\n");
	}

	@Test
	public void testBogus() throws Exception {
		Assertions.assertThrows(Error.class,
				() -> accept("movq	1, %rdi\n"));
	}
	@Test
	public void testLitMem() throws Exception {
		accept("movq	$1, (%rdi)\n");
	}
	@Test 
	public void testParseSampleSSCode() throws Exception {
		File[] files = SampleCode.sampleSSFiles();
		for (File file : files) {
			accept(file);
		}
	}

	@Test 
	public void testParseSampleSCode() throws Exception {
		File[] files = SampleCode.sampleSFiles();
		for (File file : files) {
			accept(file);
		}
	}
}
