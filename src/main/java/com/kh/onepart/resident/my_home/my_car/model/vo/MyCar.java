package com.kh.onepart.resident.my_home.my_car.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCar {
	private int residentEnrollCar;
	private int residentSeq;
	private String carType;
	private String carNm;
	private String enrollPurpose;
	private Date enrollDt;
	private String carNum;

	private String residentNm;
	private int bdNm;
	private int rmNm;
}
