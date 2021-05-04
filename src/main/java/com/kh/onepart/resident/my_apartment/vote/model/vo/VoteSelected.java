package com.kh.onepart.resident.my_apartment.vote.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VoteSelected implements java.io.Serializable{

	private int voteSelectedSeq;              //투표 선택항목 고유번호
	private int votePrtcptSeq;                //투표 참여 고유번호
	private int voteSelectedType;             //투표 구분
	private int gnrVoteCndtEnrollSeq;         //후보 등록 고유번호
	private int electVoteCndtSignupSeq;       //후보신청 고유번호
	private int selectedCndt;                 //선택 후보

}
