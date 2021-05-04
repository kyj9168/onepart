package com.kh.onepart.resident.warm.open_chatting.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageVO {
	private int imageSeq;               //이미지 고유번호
	private int fileType;               //파일구분
	private String originNm;            //원본이름
	private String changeNm;            //변경이름
	private String filePath;            //파일경로
	private Date uploadDt;              //등록일자
	private int imgType;                //이미지 구분
	private int facSeq;                 //시설물 고유번호
	private int complaintSeq;           //민원접수 고유번호
	private int noticeSeq;              //공지사항 고유번호
	private int openChatCommSeq;        //오픈채팅 대화내용 고유번호
	private int electVoteCndtSignupSeq; //후보신청 고유번호
	private int messengerSeq;           //메신저 고유번호

}
