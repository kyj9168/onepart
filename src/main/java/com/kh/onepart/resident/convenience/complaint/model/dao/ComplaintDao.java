package com.kh.onepart.resident.convenience.complaint.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.resident.convenience.complaint.model.vo.ComplaintVo;

public interface ComplaintDao {

	ArrayList<ComplaintVo> selectAllComplaintVo(SqlSessionTemplate sqlSession);
	
}
