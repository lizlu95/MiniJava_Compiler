package test.analysis;

import test.codegen.TestCodegen;
import translate.Fragments;
import codegen.AssemFragment;
import codegen.AssemProc;
import codegen.CodeGenerator;
import codegen.assem.Instr;
import analysis.FlowGraph;

/**
 * Unfortunately, there's no good way that I can think of to test this phase
 * reliably. 
 * <p>
 * So what we will do is simply to compile again all the TestTranslate programs into
 * IR code, then convert these into assem instructions, and then build a flow graph from
 * the assem code. The final result of this process is then dumped onto System.out.
 * <p>
 * The test provided here is therefore not much more than a test that your code produces
 * some output without crashing, not whether this output is correct in any sense.
 * 
 * @author kdvolder
 */
public class TestFlowGraphs extends TestCodegen {
	
	// Note that this class doesn't actually contain any @Test methods.
	// It inherits them from TestCodegen.
	// Each test will call the test method below, which we override 
	// here.
	// (i.e. generate and print the flow graph
	

	@Override
	protected void test(Fragments ir_fragments) {
		CodeGenerator cogen = new CodeGenerator();
		for (AssemFragment frag : cogen.apply(ir_fragments)) {
			AssemProc proc = (AssemProc) frag;
			test(proc);
		} ;
		
	}

	protected void test(AssemProc proc) {
		System.out.println("flow graph for : "+proc.getLabel());
		FlowGraph<Instr> flowGraph = FlowGraph.build(proc.getBody());
		System.out.println(flowGraph);
	}

}
