package com.kh.onepart.manager.resident_manage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

public interface ResidentManageDao {

	ArrayList selectAllResident(SqlSessionTemplate sqlSession);

}
