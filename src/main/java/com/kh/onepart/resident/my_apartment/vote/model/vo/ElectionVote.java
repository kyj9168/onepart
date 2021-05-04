package com.kh.onepart.resident.my_apartment.vote.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ElectionVote implements java.io.Serializable{

	private int electVoteSeq;                  //선거 고유번호
	private String electNm;                    //선거명
	private int electType;                     //선거 구별
	private String electVoteDetail;            //상세정보
	private String electVoteEnrollDt;          //등록일자
	private String cnddEnrollStartDt;          //후보등록 시작일자
	private String cnddEnrollEndDt;            //후보등록 종료일자
	private String campaignStartDt;            //선거운동 시작일자
	private String campaignEndDt;              //선거운동 종료일자
	private String voteStartDt;                //투표 시작일자
	private String voteEndDt;                  //투표 종료일자
	private String electVoteOfflinePlace;      //오프라인 투표장소
	private int bdNm;                          //동 번호(투표권 부여)

}
