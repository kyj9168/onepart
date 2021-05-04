package com.kh.onepart.manager.facility.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {

	private int imageSeq;
	private int fileType;
	private String originNm;
	private String changeNm;
	private String filePath;
	private Date uploadDt;
	private int imgType;
	private int facSeq;
	private int complaintSeq;
	private int noticeSeq;
	private int openChatCommSeq;

}
