package com.kh.onepart.resident.convenience.complaint.model.service;

import java.util.ArrayList;

import com.kh.onepart.resident.convenience.complaint.model.vo.ComplaintVo;

public interface ComplaintService {

	ArrayList<ComplaintVo> selectAllComplaintVo();

	ArrayList<ComplaintVo> insertComplaintVo();

	
}
