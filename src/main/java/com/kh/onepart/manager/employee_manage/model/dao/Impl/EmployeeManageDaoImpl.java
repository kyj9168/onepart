package com.kh.onepart.manager.employee_manage.model.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.manager.employee_manage.model.dao.EmployeeManageDao;
import com.kh.onepart.manager.employee_manage.model.vo.EmployeeManageVO;


@Repository
public class EmployeeManageDaoImpl implements EmployeeManageDao{

	@Override
	public List<EmployeeManageVO> managerList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("EmployeeManage.managerList");
	}

	@Override
	public void addManager(SqlSessionTemplate sqlSession, EmployeeManageVO employeeManageVO) {
		sqlSession.insert("EmployeeManage.addManager", employeeManageVO);

	}

	@Override
	public void deleteManager(SqlSessionTemplate sqlSession, String managerSeq) {
		sqlSession.delete("EmployeeManage.deleteManager", managerSeq);

	}

	@Override
	public EmployeeManageVO selectManager(SqlSessionTemplate sqlSession, EmployeeManageVO employeeManageVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("EmployeeManage.selectManager", employeeManageVO);
	}

	@Override
	public void updateManager(SqlSessionTemplate sqlSession, String managerSeq) {
		sqlSession.update("EmployeeManage.updateManager", managerSeq);

	}



}
