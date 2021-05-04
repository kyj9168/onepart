package com.kh.onepart.manager.survey.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SurveyVO {

	private int surveySeq;
	private String surveyTitle;
	private int surveyStatus;
	private int surveyType;
	private String surveySimpleIntro;
	private String surveyPeriod;
	private String surveyEnrollDt;
	private String surveyDelTf;
}
