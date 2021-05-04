package com.kh.onepart.resident.superintend_vote.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ElectionVoteCandidate implements java.io.Serializable{

	private int electVoteCndtSignupSeq;     //후보신청 고유번호
	private int electVoteSeq;               //선거 고유번호
	private String finalEdu;                //최종학력
	private int residentSeq;                //입주민 고유번호
	private String cndtSignupDt;            //후보신청일자
	private String workNm;                  //직장명
	private String workPosition;            //직위
	private String workAdd;                 //직장주소
	private int careerSeq;                  //사회경력 및 이력 고유번호
	private int status;                     //상태
	private String simpleInfo;              //간단 정보
	private String detailInfo;              //상세 정보
	private String etcInfo;                 //기타사항
	private String cndtEnrollDt;            //후보등록일자
	private String cndtElectedDt;           //후보당선일자
	private String residentNm;				//후보명
	private int bdNm;						//후보 동
	private int rmNm;						//후보 호
	private String changeNm;				//변경이름
	private String filePath;				//저장경로
	private int cndtNo;						//후보번호
	private String residentBirth;
	private String residentGender;

}
