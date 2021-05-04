package com.kh.onepart.resident.my_apartment.notice.model.vo;

import java.sql.Date;

public class NoticeVo {
	private int noticeSeq; //getNo
	private String noticeTitle;
	private String noticeContent;
	private Date noticeEnrollDt;

	public NoticeVo() {}

	public NoticeVo(int noticeSeq, String noticeTitle, String noticeContent, Date noticeEnrollDt) {
		super();
		this.noticeSeq = noticeSeq;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeEnrollDt = noticeEnrollDt;
	}

	public int getNoticeSeq() {
		return noticeSeq;
	}

	public void setNoticeSeq(int noticeSeq) {
		this.noticeSeq = noticeSeq;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeEnrollDt() {
		return noticeEnrollDt;
	}

	public void setNoticeEnrollDt(Date noticeEnrollDt) {
		this.noticeEnrollDt = noticeEnrollDt;
	}

	@Override
	public String toString() {
		return "NoticeVo [noticeSeq=" + noticeSeq + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeEnrollDt=" + noticeEnrollDt + "]";
	}
	
	
}
