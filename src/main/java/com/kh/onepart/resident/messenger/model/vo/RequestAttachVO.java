package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestAttachVO {

	private int attchSeq;
	private int fileType;
	private String originNm;
	private String changeNm;
	private String filePath;
	private String uploadDt;
	private int messengerSeq;
	private int openChatCommSeq;

}
