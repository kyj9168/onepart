package com.kh.onepart.resident.my_apartment.notice.model.service;

import java.util.ArrayList;

import com.kh.onepart.resident.my_apartment.notice.model.vo.NoticeVo;

public interface NoticeService {

	ArrayList<NoticeVo> selectNoticeVo(int noticeSeq);

	ArrayList<NoticeVo> insertNoticeVo();

	ArrayList<NoticeVo> updateNoticeVo();


	
}
