package com.kh.onepart.resident.my_home.visit_car.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitCarVo {

	private int visitCarSeq;
	private String visitCarNum;
	private String subPhone;
	private String visitPurpose;
	private String visitDt;
	private Date visitCarEnrollDt;
	private int status;
	private int residentSeq;
	private String rejectReason;

}
