package com.catic.tool;

import java.security.*;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2004
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author Ã·Ïþ¶¬
 * @version 1.0
 */

public class Encryption {

	public Encryption() {
	}

	public String getEncrypt(String temp) {
		String result = "";
		byte[] result_byte = null;
		byte[] data = null;
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		data = temp.getBytes();
		result = new sun.misc.BASE64Encoder().encode(data);
		return result;
	}

	public String getDecrypt(String temp) {
		String result = "";
		try {

			byte[] data = new sun.misc.BASE64Decoder().decodeBuffer(temp);
			result = new String(data);
		} catch (java.io.IOException e) {
			return result;
		}
		return result;
	}

	public static void main(String[] args) {
		Encryption encryp = new Encryption();
		String str_in = "d29idXpoaWRhbw==";
		// String str_in = "13258130175";
		// String str_out = encryp.getEncrypt(str_in);
		// String str_out = str_in;
		str_in = encryp.getDecrypt(str_in);
		System.out.println("str_in=" + str_in);
		// System.out.println("str_out="+str_out);
	}
}