package com.kh.onepart.resident.my_apartment.survey.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestSurveyQstnOption {

	private int surveyQstnOptionSeq;
	private int surveyQstnOptionNum;
	private String surveyQstnOptionContent;
	private int surveyQstnSeq;
	private int surveyQstnNum;
}
