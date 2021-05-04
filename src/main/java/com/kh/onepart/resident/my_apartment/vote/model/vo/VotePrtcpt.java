package com.kh.onepart.resident.my_apartment.vote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VotePrtcpt implements java.io.Serializable{

	private int votePrtcptSeq;          //투표 참여 고유번호
	private int votePrtcptType;         //투표 구분
	private int gnrVoteSeq;             //일반투표 고유번호
	private int electVoteSeq;           //선거 고유번호
	private int residentSeq;            //입주민 고유번호

}
