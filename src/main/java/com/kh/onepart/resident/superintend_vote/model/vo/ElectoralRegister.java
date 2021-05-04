package com.kh.onepart.resident.superintend_vote.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ElectoralRegister {

	private int residentSeq;
	private String aptDetailInfoSeq;
	private String residentNm;
	private String residentPhone;
	private String voteStatue;
	private String status;
	private int electVoteSeq;

}
