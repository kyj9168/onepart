package com.kh.onepart.resident.convenience.complaint.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.convenience.complaint.model.vo.ComplaintVo;

@Repository
public class ComplaintDaoImpl implements ComplaintDao {

	@Override
	public ArrayList<ComplaintVo> selectAllComplaintVo(SqlSessionTemplate sqlSession) {
		
		return null;
	}

}
