package com.kh.onepart.manager.facility.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FacSeatInfo {

	private int facSeatSeq;
	private int facSeatNum;
	private int facSeq;
	private String facPositionNum;
	private int facSeatMaxNum;

}
