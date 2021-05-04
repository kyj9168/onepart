package com.kh.onepart.resident.superintend_vote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralVote implements java.io.Serializable{

	private int gnrVoteSeq;                  //일반투표 고유번호
	private String gnrVoteName;              //투표 명
	private int gnrVoteType;                 //투표 구별
	private Date gnrVoteStartDt;             //투표 시작일자
	private String gnrVoteEndDt;             //투표 종료일자
	private String gnrVoteOfflinePlace;      //오프라인 투표장소
	private String gnrVoteDetail;            //상세정보
	private Date gnrVoteEnrollDt;            //등록 일자
	private int gnrVoteGrant;                //투표권 부여
	private String voteCandidateArr;		 //해당투표 후보배열
	private int gnrVoteByBdNmSeq;            //동별 투표 고유번호
	private int bdNm;                     	 //동 번호
	private String bdNmArr;                  //동 번호 배열

}
