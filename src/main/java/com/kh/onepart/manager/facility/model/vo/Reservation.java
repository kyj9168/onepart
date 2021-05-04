package com.kh.onepart.manager.facility.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation implements java.io.Serializable{

	private int facSeq;
	private String facNm;
	private String facPosition;
	private String facAvailWeekOfDay;
	private String facAvailTm;
	private int facDefaultFee;
	private int facMaxHead;
	private int facSquareMeasure;
	private String qrImgPath;
	private String facDetailInfo;
	private String facRsrvInfo;
	private String facUseInfo;
	private String facCaution;
	private int facType;
	private String facDelTf;
	private int imageSeq;
	private int fileType;
	private String originNm;
	private String changeNm;
	private String filePath;
	private Date uploadDt;
	private int messengerSeq;
	private int openChatCommSeq;
	private String seatArr;
	private int seatMaxNum;
	private String resultImgArr;

}
