package com.enong.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.nutz.lang.random.R;

public class MD5Utils {

	public static String md5(String inputStr) {
		String md5Str = inputStr;
		if (inputStr != null) {
			MessageDigest md = null;
			try {
				md = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			md.update(inputStr.getBytes());
			BigInteger hash = new BigInteger(1, md.digest());
			md5Str = hash.toString(16);
			if ((md5Str.length() % 2) != 0) {
				md5Str = "0" + md5Str;
			}
		}
		return md5Str;
	}
	
	public static String createSalt(){
		int random = R.random(0, 100000);
		return String.valueOf(random);
	}
	
	public static String createPassword(String password,String salt){
		return md5(md5(password)+salt);
	}
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(createSalt());
	}
	
}
