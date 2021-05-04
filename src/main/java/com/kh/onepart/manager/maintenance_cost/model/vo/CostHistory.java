package com.kh.onepart.manager.maintenance_cost.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CostHistory {

	private int maintenanceCostHistorySeq;                 //관리비 내역 고유번호
	private int maintenanceCostSeq;                        //관리비 고유번호
	private String divisionYear;                           //관리비 구분 년
	private String paymentEndDt;                           //관리비 납부 종료 날짜
	private String aptDetailInfoSeq;                       //동/호 고유번호
	private String divisionMonth;                          //관리비 구분 월
	private int paymentAmount;                             //관리비 납부 금액

	private String divisionOne;
	private String divisionTwo;
	private String divisionThree;

	private int sumMaintenanceCost;						   //납부액
	private int avgMaintenanceCost;

	private int sumMonthCost;

}
