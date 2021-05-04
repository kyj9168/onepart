package com.kh.onepart.manager.main.model.service;

import com.kh.onepart.manager.main.model.vo.ResidentStatusVO;

public interface MainService {

	/**
	 * 입주 현황
	 * @return
	 */
	ResidentStatusVO residentStatus();

	/**
	 * 총 입주민 인원 수
	 * @return
	 */
	int residentTotalCount();

	/**
	 * 한 가구당 인원 수
	 * @return
	 */
	double countPerHousehold();

	/**
	 * 등록 차량 수
	 * @return
	 */
	int enrollCarCount();

}
