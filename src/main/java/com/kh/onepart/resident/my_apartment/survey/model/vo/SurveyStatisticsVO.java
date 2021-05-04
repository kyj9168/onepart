package com.kh.onepart.resident.my_apartment.survey.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SurveyStatisticsVO {

	private String aptDetailInfoSeq;
	private int bdNm;
	private int rmNm;
	private int residentSeq;
	private String residentNm;
	private String selectedAnswer;
	private int surveyQstnType;

}

