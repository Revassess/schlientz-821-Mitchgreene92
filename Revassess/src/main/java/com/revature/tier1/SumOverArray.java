package com.revature.tier1;



public class SumOverArray {

	public static int IterateAndSum(int[] arr) {

		if (arr != null) {

			int sum = 0;
			for (int value : arr) {
				sum += value;
			}
			return sum;
		}

		else {
			return 0;
		}
	}
}

