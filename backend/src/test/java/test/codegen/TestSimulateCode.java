package test.codegen;

import ir.interp.InterpMode;

import java.io.File;


import org.junit.AfterClass;
import org.junit.Assert;

import test.translate.TestTranslate;
import translate.Fragments;
import typechecker.TypeCheckerException;
import util.Utils;
import x86_64sim.Sim;
import x86_64sim.State;

import codegen.CodeGenerator;


/**
 * So what we will do is simply to compile again all the TestTranslate programs into
 * IR code, then convert these into assem instructions, and then simulate them.
 * 
 * @author kdvolder and norm
 */
public class TestSimulateCode extends TestTranslate {

	// Note that this class doesn't actually contain any @Test methods.
	// It inherits them from TestTranslate.
	// Each test will call one of the two test methods below, which we override 
	// here.
	// This way we can easily reuse all the tests, but make them do something extra
	// (i.e. generate and print the assembly).

	private void check(String expected, String result) {
		if (expected.equals(result)) {
			System.out.println("Output matched expected");
		} else {
			System.out.println("Output doesn't match expected.  Expected:");
			System.out.print(expected);
			System.out.println("Output:");
			System.out.print(result);
		}
		Assert.assertEquals(expected, result);
	}
	@Override
	protected InterpMode getSimulationMode() {
		return null; // means don't simulate IR code.
	}

	@Override
	protected Fragments test(File program) throws TypeCheckerException, Exception {
		Fragments translated = super.test(program);
		//		System.out.println("Generating assembly for "+program);
		String expected = Utils.getExpected(program);
		String result = test(translated);
		check(expected, result);
		return null; // doesn't matter right now.
	}

	@Override
	protected Fragments test(String expected, String program) throws Exception {
		Fragments translated = super.test(expected, program);
		//		System.out.println("Generating assembly for "+program);
		String result = test(translated);
		check(expected, result);
		return null; // doesn't matter right now.
	}

	protected String test(Fragments ir_fragments) {
		CodeGenerator cogen = new CodeGenerator();
		String program = cogen.apply(ir_fragments).toString();
		String result = "";
		State state = null;
		try {
			state = Sim.ulate(program, true);
		} catch (Error e) {
			result = e.getMessage();
			e.printStackTrace();
		}
		System.out.println("Program:");
		System.out.print(program);
		System.out.println("Output:");
		System.out.print(result);
		return state.result;
	}

	/**
	 * This prints out a representation of the X86Muncher's pattern munching rules.
	 * For debugging purposes. 
	 */
	@AfterClass public static void dumpRules() {
		//	X86Muncher.dumpRules();
	}

}
