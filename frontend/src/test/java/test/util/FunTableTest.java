package test.util;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import util.FunTable;

/**
 * It is a good idea to provide unit tests for all non-trivial 
 * data structure implementations. This class contains tests for
 * our implementation of Symbol tables provided in the class
 * minijava.table.FunTable.
 * <p>
 * The implementation of Table that is provided is already complete.
 * These tests should run and pass "out of the box".
 * 
 * @author kdvolder
 */
public class FunTableTest {
	
	@Test
	public void testEmptyTable() {
		FunTable<Integer> tab = FunTable.theEmpty();
		Assertions.assertTrue(tab.isEmpty());
		Assertions.assertNull(tab.lookup("something"));
	}

	@Test public void testOneInsert() {
		FunTable<Integer> tab = FunTable.theEmpty();
		tab = tab.insert("x", 10);
		Assertions.assertFalse(tab.isEmpty());
		Integer found = tab.lookup("x");
		Assertions.assertNotNull(found);
		Assertions.assertEquals(10, (int)found);
	}

	@Test public void testMultipleInsert() {
		FunTable<Integer> tab = FunTable.theEmpty();
		tab = tab.insert("x", 10);
		tab = tab.insert("y", 20);
		tab = tab.insert("z", 30);
		Assertions.assertFalse(tab.isEmpty());
		
		Assertions.assertEquals(10, (int)tab.lookup("x"));
		Assertions.assertEquals(20, (int)tab.lookup("y"));
		Assertions.assertEquals(30, (int)tab.lookup("z"));
		
		Assertions.assertNull(tab.lookup("X"));
	}
	
	@Test public void testMultipleInsertOfSame() {
		FunTable<Integer> tab = FunTable.theEmpty();
		tab = tab.insert("x", 10);
		tab = tab.insert("y", 20);
		tab = tab.insert("x", 30);
		Assertions.assertFalse(tab.isEmpty());
		
		Assertions.assertEquals(30, (int)tab.lookup("x"));
		Assertions.assertEquals(20, (int)tab.lookup("y"));
	}
	
	@Test public void testMerge() {
		FunTable<Integer> tab = FunTable.theEmpty();
		tab = tab.insert("x", 10);
		tab = tab.insert("y", 20);
		tab = tab.insert("x", 30);
		
		FunTable<Integer> superTab = FunTable.theEmpty();
		superTab = superTab.insert("a", 100);
		superTab = superTab.insert("y", 200);
		superTab = superTab.insert("a", 300);
		
		tab = tab.merge(superTab);
		
		Assertions.assertEquals(30, (int)tab.lookup("x"));
		Assertions.assertEquals(20, (int)tab.lookup("y")); // tab "overrides" superTab
		Assertions.assertEquals(300, (int)tab.lookup("a")); 
	}
}
