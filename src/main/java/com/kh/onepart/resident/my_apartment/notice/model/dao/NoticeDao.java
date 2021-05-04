package com.kh.onepart.resident.my_apartment.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.resident.my_apartment.notice.model.vo.NoticeVo;

public interface NoticeDao {

	ArrayList<NoticeVo> selectNoticeVo(int noticeSeq, SqlSessionTemplate sqlSession);

	ArrayList<NoticeVo> insertNoticeVo(SqlSessionTemplate sqlSession);



}
