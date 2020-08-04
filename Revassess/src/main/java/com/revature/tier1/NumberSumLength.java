package com.revature.tier1;

public class NumberSumLength {

	public static boolean checkNumberPowerLength(long num) {
		
		String longNum = Long.toString(num);
		
		int length = longNum.length();
		
		long sum = 0;
		
		for (int i=0; i < length; i++) {
			
			sum+=Math.pow(Character.getNumericValue(longNum.charAt(i)), length);
			
		}
		
		if (sum == num) {
			return true;
		}
		return false;
	}
}




