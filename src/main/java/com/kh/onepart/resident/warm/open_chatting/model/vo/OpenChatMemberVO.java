package com.kh.onepart.resident.warm.open_chatting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OpenChatMemberVO {
	private int		openChatMemberSeq;			// 오픈채팅 방 별 멤버 고유번호 (pk)
	private int		openChatSeq;				// 오픈채팅 방 고유번호
	private int		residentSeq;				// 입주민 고유번호(맴버)
	private Date	openChatMemberPrtcptDt;		// 참여일자

}
