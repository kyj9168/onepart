package com.kh.onepart.resident.my_apartment.vote.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CandidatePercent {

	private int voteSeq;
	private int candidateSeq;
	private int candidatePercent;

}
