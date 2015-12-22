package sample;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestCharAt {

	@Test
	public void testPositive() {
		CharAtExample sample = new CharAtExample("Hello World");
		char expected = 'e';
		char actual=sample.charAt(1);
		assertEquals(expected, actual);
	}
	
	@Test
	public void testBoundryCasePositive() {
		CharAtExample sample = new CharAtExample("Hello World");
		char expected = 'd';
		char actual=sample.charAt(10);
		assertEquals(expected, actual);
	}

}
