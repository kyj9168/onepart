package com.kh.onepart.manager.maintenance_cost.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CostExcel {

	private int category;
	private int money;
	private String excelYear;
	private String excelMonth;
	private String fileType;
	private String insertDay;

}
