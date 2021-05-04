package com.kh.onepart.resident.my_apartment.survey.model.vo;

import com.kh.onepart.common.PageInfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestSurveyMainVO {

	int residentSeq;
	PageInfo pi;
	int surveyType;

}
