package com.kh.onepart.resident.my_apartment.survey.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestSurveyQstn {

	private int surveySeq;
	private int surveyQstnSeq;
	private int surveyQstnNum;
	private String surveyQstnTitle;
	private String surveyQstnNece;
	private int surveyQstnType;
}
