package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestImgVO {

	private int imageSeq;
	private int fileType;
	private String originNm;
	private String changeNm;
	private String filePath;
	private String uploadDt;
	private int imgType;
	private int facSeq;
	private int complaintSeq;
	private int noticeSeq;
	private int openChatCommSeq;
	private int electVoteCndtSignupSeq;
	private int messengerSeq;

}
