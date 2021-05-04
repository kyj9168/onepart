package com.kh.onepart.resident.warm.open_chatting.model.service;

import com.kh.onepart.resident.warm.open_chatting.model.vo.OpenChatNoticeVO;

public interface OpenChatNoticeService {

	OpenChatNoticeVO noticeSelect(OpenChatNoticeVO openChatNoticeVO);

	void insertNotice(OpenChatNoticeVO openChatNoticeVO);

	void updateNotice(OpenChatNoticeVO openChatNoticeVO);

	void deleteNotice(OpenChatNoticeVO openChatNoticeVO);

}
