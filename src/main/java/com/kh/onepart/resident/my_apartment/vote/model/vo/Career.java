package com.kh.onepart.resident.my_apartment.vote.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Career {

	private int careerSeq;
	private String careerPeriod;
	private String careerDetail;
	private int electVoteCndtSignupSeq;

}
