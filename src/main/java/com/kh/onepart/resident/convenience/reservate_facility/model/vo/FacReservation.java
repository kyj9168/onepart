package com.kh.onepart.resident.convenience.reservate_facility.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FacReservation {

	private int facRsrvSeq;                           //예약 고유번호
	private int facSeq;                               //시설물 고유번호
	private String propUseDt;                         //신청이용날짜
	private String propUseTm;                         //신청이용시간
	private int residentSeq;                          //입주민 고유번호(예약자)
	private int propStatus;                           //신청상태
	private int toalFee;                              //총 사용료
	private int useHeadCount;                         //사용인원
	private String usePurpose;                        //사용목적
	private String etc;                               //기타사항
	private int rsrvGroupType;                        //개인/단체 구분
	private String rsrvNm;                            //개인/단체명
	private Date enrollDt;                            //등록일자
	private int propSeat;                             //신청좌석
	private String rsrvPhone;                         //연락처
	private String facNm;
	private String facPositionNum;

}
