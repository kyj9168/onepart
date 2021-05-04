package com.kh.onepart.manager.employee_manage.model.service.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.manager.employee_manage.model.dao.EmployeeManageDao;
import com.kh.onepart.manager.employee_manage.model.service.EmployeeManageService;
import com.kh.onepart.manager.employee_manage.model.vo.EmployeeManageVO;


@Service
public class EmployeeManageServiceImpl implements EmployeeManageService{

	@Autowired
	EmployeeManageDao employeeManageDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EmployeeManageVO> managerList() {

		return employeeManageDao.managerList(sqlSession);
	}

	@Override
	public void addManager(EmployeeManageVO employeeManageVO) {
		employeeManageDao.addManager(sqlSession, employeeManageVO);

	}

	@Override
	public void deleteManager(String managerSeq) {
		employeeManageDao.deleteManager(sqlSession, managerSeq);

	}

	@Override
	public EmployeeManageVO selectManager(EmployeeManageVO employeeManageVO) {
		// TODO Auto-generated method stub
		return	employeeManageDao.selectManager(sqlSession, employeeManageVO);
	}

	@Override
	public void updateManager(String managerSeq) {
		employeeManageDao.updateManager(sqlSession, managerSeq);

	}



}
