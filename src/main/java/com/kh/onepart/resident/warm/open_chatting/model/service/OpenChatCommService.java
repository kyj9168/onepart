package com.kh.onepart.resident.warm.open_chatting.model.service;

import java.util.List;

import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatCommVO;

public interface OpenChatCommService {
	public List<OpenChatCommVO> getPrevMessages(int openChatSeq);
	public void saveOpenChatComm(OpenChatCommVO openChatCommVO);
	public void saveOpenChatImageComm(OpenChatCommVO openChatCommVO);
}
