package com.kh.onepart.resident.superintend_vote.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApartDetailInfo implements java.io.Serializable{

	private String aptDetailInfoSeq;      //동/호 고유번호
	private int bdNm;                     //동
	private int rmNm;                     //호
	private int squareMeasure;            //평수
	private String residentNm;
	private String residentPhone;
	private int residentSeq;

}

