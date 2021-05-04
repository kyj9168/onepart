package com.kh.onepart.manager.employee_manage.model.service;

import java.util.List;

import com.kh.onepart.manager.employee_manage.model.vo.EmployeeManageVO;

public interface EmployeeManageService {

	List<EmployeeManageVO> managerList();

	void addManager(EmployeeManageVO employeeManageVO);

	void deleteManager(String managerSeq);

	EmployeeManageVO selectManager(EmployeeManageVO employeeManageVO);

	void updateManager(String managerSeq);


}
