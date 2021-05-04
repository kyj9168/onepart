package com.kh.onepart.resident.warm.open_chatting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OpenChatVO {
	private int		openChatSeq;		// 오픈 채팅방 고유번호 (PK)
	private Date	openChatOpenedDt;	// 개설일자
	private String	openChatRoomNm;		// 방 이름
	private int		openChatMaxHead;	// 최대 인원
	private String	openChatDeleteTf;	// 삭제여부
	private int		residentSeq;		// 입주민 고유번호(FK)
	private int	openChatCurrHead;	// 현재 방 참가 인원
	private String	openChatPwd;		// 채팅방 비밀번호
}
