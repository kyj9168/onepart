package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseResidentVO {

	private int residentSeq;
	private String residentNm;
	private int bdNm;
	private int rmNm;


}
