package com.kh.onepart.resident.my_apartment.survey.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestSurveyPrtcpt {

	private int surveyPrtcptSeq;
	private int residentSeq;
	private int surveySeq;
	private Date surveyPrtcptDt;

}
