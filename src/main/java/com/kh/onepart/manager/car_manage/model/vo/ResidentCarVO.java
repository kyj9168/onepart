package com.kh.onepart.manager.car_manage.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentCarVO {
	private int residentEnrollCar; //입주민차량 고유번호
	private int residentSeq; //입주민차량 입주민 고유번호
	private String carType; // 차량종류
	private String carNm; //차량명
	private String enrollPurpose; //용도
	private Date enrollDt; // 등록일
	private String carNum; //차량번호

	private int bdNm; //동
	private int rmNm; //호수
	private String residentNm; //입주민 이름
}
