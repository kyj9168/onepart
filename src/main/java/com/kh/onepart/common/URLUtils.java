package com.kh.onepart.common;

public class URLUtils {

	/**
	 * 요청 URI만 걸러내기
	 * @param requestURL
	 * @return
	 */
	public static String URL_SUBSTRING(String requestURL) {

		final String PATTERN_URL = ":8001/onepart";
		String resultURL = requestURL.substring(requestURL.indexOf(PATTERN_URL) + PATTERN_URL.length());

		return resultURL;
	}


}
