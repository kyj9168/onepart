package com.kh.onepart.manager.main.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentStatusVO {

	private int currentCount;
	private int totalCount;
	double residentPercent;
	private int residentTotalCount;
	private double countPerHousehold;
	private int enrollCarCount;

}
