package com.kh.onepart.resident.residentMeeting.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentMeetingVO {

	private int residentsMeetingSeq;
	private int residentSeq;
	private String meetingNm;
	private String meetingTopic;
	private String meetingIntro;
	private String meetingPlace;
	private String meetingDt;
	private int meetingStatus;
	private String meetingMinutes;
	private String meetingEnrollDt;
	private String cancleReason;
	private String cancleDt;
	private int mettingType;
	private String deleteTf;
	private String meetingTm;

}
