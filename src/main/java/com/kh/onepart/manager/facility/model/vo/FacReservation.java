package com.kh.onepart.manager.facility.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FacReservation {

	private int facRsrvSeq;
	private int facSeq;
	private String propUseDt;
	private String propUseTm;
	private int residentSeq;
	private int propStatus;
	private int toalFee;
	private int useHeadCount;
	private String usePurpose;
	private String etc;
	private int rsrvGroupType;
	private String rsrvNm;
	private Date enrollDt;
	private int propSeat;
	private String rsrvPhone;
	private String facNm;
	private String residentNm;

}
