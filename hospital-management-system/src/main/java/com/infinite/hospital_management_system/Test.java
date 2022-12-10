package com.infinite.hospital_management_system;

public class Test {
	public static void main(String[] args) {
//		System.out.println(SessionHelper.getConnection().openSession().createQuery("SELECT count(*) from Payment where treatment_id = 1").list().get(0).getClass().getName());
		
		int a = 2;
//		int b = 2;
//		
//		System.out.println(a == b);
		
		String x = "2";
		String y = new String("S");
		
		System.out.println(x.equals("2"));
		System.out.println(x == new String("2"));
		
		System.out.println(x.hashCode());
		System.out.println(y.hashCode());
		
	}
}
