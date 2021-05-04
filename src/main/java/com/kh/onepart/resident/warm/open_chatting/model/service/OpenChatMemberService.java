package com.kh.onepart.resident.warm.open_chatting.model.service;

import java.util.List;

import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.my_car.model.vo.MyCar;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatMemberVO;
import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatVO;

public interface OpenChatMemberService {
	public void addOpenChatMember(int openChatSeq, int residentSeq);

	public boolean enterCheckMember(int openChatSeq, int residentSeq);

	public void getOutThisRoom(OpenChatMemberVO openChatMemberVO);

	public int pastMemberEnter(OpenChatMemberVO openChatMemberVO);

	public void reEnterOpenChatMember(OpenChatMemberVO openChatMemberVO);

	public List<ResidentVO> chatPerson(int openChatSeq);


}
