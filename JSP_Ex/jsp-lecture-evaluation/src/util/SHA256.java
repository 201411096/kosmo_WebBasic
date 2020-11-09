package util;

import java.security.MessageDigest;

public class SHA256 { //Secure Hash Algorithm

	public static String getSHA256(String input){
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256"); //SHA-256 형식으로 암호화
			byte[] salt = "Hello! This is Salt.".getBytes(); // 암호화에 사용하는 추가적인..
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i< chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length()==1) result.append("0");
				result.append(hex);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
}
