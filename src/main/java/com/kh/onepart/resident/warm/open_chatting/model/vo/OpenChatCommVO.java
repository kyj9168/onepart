package com.kh.onepart.resident.warm.open_chatting.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OpenChatCommVO {
	private int		openChatCommSeq;		// 오픈채팅 대화내용 고유번호 (pk)
	private String	openChatCommContent;	// 발신내용
	private int		openChatMemberSeq;		// 오픈채팅 방 별 멤버 고유번호(발신인)
	private String	openChatCommAttchTf;	// 첨부파일 여부
	private String	openChatCommImgTf;		// 이미지 여부
	private Timestamp openChatCommSendDt;
	private int openChatSeq; //고유 방 번호
	private int residentSeq; //회원 번호
	private String residentId; //회원 ID
}
