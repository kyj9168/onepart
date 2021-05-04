package com.kh.onepart.resident.my_apartment.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.my_apartment.notice.model.dao.NoticeDao;
import com.kh.onepart.resident.my_apartment.notice.model.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao nd;
	
	//공지사항 리스트 및 글보기
	@Override
	public ArrayList<NoticeVo> selectNoticeVo(int noticeSeq) {
		ArrayList<NoticeVo> list = nd.selectNoticeVo(noticeSeq, sqlSession);
		return list;
	}
	//공지사항 글작성
	@Override
	public ArrayList<NoticeVo> insertNoticeVo() {
		ArrayList<NoticeVo> list = nd.insertNoticeVo(sqlSession);
		return list;
	}
	
	//공지사항 글수정
	@Override
	public ArrayList<NoticeVo> updateNoticeVo() {
//		ArrayList<NoticeVo> list = nd.updateNoticeVo(sqlSession);
		return null;
	}
	
	
}
