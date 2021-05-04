package com.kh.onepart.common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	// 파일 업로드
	public static String uploadFiles(String uploadPath, String originalName, byte[] file) throws IOException {

		// 저장할 파일 이름
		String savedName = CommonUtils.getRandomString()+"_"+originalName;

		// 저장할 파일 경로
		String savedPath = UploadFileUtils.generatePath(uploadPath);

		// 디렉토리 생성
		UploadFileUtils.makeDir(uploadPath, savedPath);

		// 파일 저장
		FileCopyUtils.copy(file, new File(uploadPath+"\\"+savedPath+"\\", savedName));

		return "/"+savedPath+"/"+savedName;
	}

	// 파일 저장 디렉토리 이름 구하기(날짜로)
	private static String generatePath(String uploadPath) {
		Calendar cal = Calendar.getInstance();

		StringBuilder datePath = new StringBuilder();
		datePath.append(cal.get(Calendar.YEAR));
		datePath.append("_");
		datePath.append(new DecimalFormat("00").format(cal.get(Calendar.MONTH)));

		return datePath.toString();
	}

	// 디렉토리 생성
	private static void makeDir(String uploadPath, String dirPath) {
		File dir = new File(uploadPath + dirPath);
		if(!dir.exists()) {
			dir.mkdir();
		}
	}
}
