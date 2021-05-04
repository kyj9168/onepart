package com.kh.onepart.manager.vote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralVoteCandidate implements java.io.Serializable{

	private int gnrVoteCndtEnrollSeq;     //후보 등록 고유번호
	private int gnrVoteSeq;               //일반투표 고유번호
	private String cndtNm;                //후보 이름
	private String cndtDetail;            //상세 정보
	private Date cndtEnrollDt;            //등록일자

}
