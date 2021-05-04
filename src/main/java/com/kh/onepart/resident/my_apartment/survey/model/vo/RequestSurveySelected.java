package com.kh.onepart.resident.my_apartment.survey.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestSurveySelected {

	private int surveySelectedSeq;
	private int surveyPrtcptSeq;
	private String selectedAnswer;
	private int surveyQstnSeq;

}
