package com.eeit144.drinkmaster.back.util;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.web.bind.annotation.RequestParam;

public class Util {

	private static final String KEY_ALGORITHM="AES/ECB/PKCS5Padding";
//	private static final String KEY_ALGORITHM="bestDrinkForYou";
	private static final String KEY ="drinkmasterbest!";
	
//	cipher
	private static Cipher getCipher(byte[] key,int model) throws Exception{
		SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");
		Cipher cipher = Cipher.getInstance(KEY_ALGORITHM);
		cipher.init(model, secretKeySpec);
		return cipher;
	}
	
//	加密
	public static String encrypt(byte[] data, byte[] key) throws Exception{
		Cipher cipher = getCipher(key, Cipher.ENCRYPT_MODE);
		return Base64.getEncoder().encodeToString(cipher.doFinal(data));
	}
	
//	解密
	public static byte[] decrypt(byte[] data,byte[] key) throws Exception{
		Cipher cipher = getCipher(key, Cipher.DECRYPT_MODE);
		return cipher.doFinal(Base64.getDecoder().decode(data));
	}
	
	
	public static String saleCode(@RequestParam("key") String key) {
		String encrypt = null;
		try {
			encrypt = Util.encrypt(key.getBytes(),KEY.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
			return encrypt;
//			test1234
//			aWSMDvbh8h8qGKIbnnXFYA==
	}

	public static String DeSaleCode(@RequestParam("password") String pwd) {
		
		byte[] decrypt = null;
		try {
			decrypt = Util.decrypt(pwd.getBytes(), KEY.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String string = new String(decrypt);
//		aWSMDvbh8h8qGKIbnnXFYA==
//		test1234
		return string;
	}
}
