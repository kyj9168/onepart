package com.kh.onepart.manager.car_manage.model.service;

import java.util.List;

import com.kh.onepart.manager.car_manage.model.vo.ResidentCarVO;

public interface ResidentCarService {

	List<ResidentCarVO> residentCarList();

	void addResidentCar(ResidentCarVO residentCarVO);

	void deleteResidentCar(String string);

	ResidentCarVO selectResidentCar(ResidentCarVO residentCarVO);

}
