package com.kh.onepart.resident.main.model.service;

public interface ResidentTemplateService {

	/**
	 * 읽지 않은 쪽지 개수
	 * @param loginUser
	 * @return
	 */
	int selectNoReadMessengerCount(String loginUser);

}
