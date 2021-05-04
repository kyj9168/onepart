package com.kh.onepart.resident.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentAndAptDetailInfo {

	private int residentSeq;
	private int residentNm;
	private String bdNm;
	private int rmNm;

}
