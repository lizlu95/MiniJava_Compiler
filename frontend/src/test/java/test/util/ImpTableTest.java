package test.util;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import util.ImpTable;
import util.ImpTable.DuplicateException;

/**
 * It is a good idea to provide unit tests for all non-trivial 
 * data structure implementations. This class contains tests for
 * our implementation of Symbol tables provided in the class
 * minijava.table.ImpTable.
 * <p>
 * The implementation of Table that is provided is already complete.
 * These tests should run and pass "out of the box".
 * 
 * @author kdvolder
 */
public class ImpTableTest {
	
	@Test
	public void testEmptyTable() {
		ImpTable<Integer> tab = new ImpTable<Integer>();
		Assertions.assertTrue(tab.isEmpty());
		Assertions.assertNull(tab.lookup("something"));
	}

	@Test public void testOneInsert() throws DuplicateException {
		ImpTable<Integer> tab = new ImpTable<Integer>();
		tab.put("x", 10);
		Assertions.assertFalse(tab.isEmpty());
		Integer found = tab.lookup("x");
		Assertions.assertNotNull(found);
		Assertions.assertEquals(10, (int)found);
	}

	@Test public void testMultipleInsert() throws DuplicateException {
		ImpTable<Integer> tab = new ImpTable<Integer>();
		tab.put("x", 10);
		tab.put("y", 20);
		tab.put("z", 30);
		Assertions.assertFalse(tab.isEmpty());
		
		Assertions.assertEquals(10, (int)tab.lookup("x"));
		Assertions.assertEquals(20, (int)tab.lookup("y"));
		Assertions.assertEquals(30, (int)tab.lookup("z"));
		
		Assertions.assertNull(tab.lookup("X"));
	}
	
	@Test public void testMultipleInsertOfSame() throws DuplicateException {
		ImpTable<Integer> tab = new ImpTable<Integer>();
		tab.put("x", 10);
		tab.put("y", 20);
		try {
			tab.put("x", 30);
			Assertions.fail("Should throw a duplicate excpetion");
		} catch (DuplicateException e) {
		}
		Assertions.assertFalse(tab.isEmpty());
		
		Assertions.assertEquals(10, (int)tab.lookup("x")); // duplicate was not added!
		Assertions.assertEquals(20, (int)tab.lookup("y"));
	}
	
}
