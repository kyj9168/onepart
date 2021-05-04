package com.kh.onepart.resident.convenience.complaint.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.convenience.complaint.model.dao.ComplaintDao;
import com.kh.onepart.resident.convenience.complaint.model.vo.ComplaintVo;

@Service
public class ComplaintServiceImpl implements ComplaintService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ComplaintDao cd;
	
	@Override
	public ArrayList<ComplaintVo> selectAllComplaintVo() {
		
		ArrayList<ComplaintVo> list = cd.selectAllComplaintVo(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<ComplaintVo> insertComplaintVo() {
		// TODO Auto-generated method stub
		return null;
	}

}
