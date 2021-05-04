package com.kh.onepart.resident.superintend_vote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralVoteBdNm implements java.io.Serializable{

	private int gnrVoteByBdNmSeq;      //동별 투표 고유번호
	private int bdNm;                  //동 번호
	private int gnrVoteSeq;            //일반투표 고유번호

}
