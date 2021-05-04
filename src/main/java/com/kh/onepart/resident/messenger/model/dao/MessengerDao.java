package com.kh.onepart.resident.messenger.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.resident.messenger.model.vo.ManagerAndDeptVO;
import com.kh.onepart.resident.messenger.model.vo.MessengerBasicAllData;
import com.kh.onepart.resident.messenger.model.vo.RequestAttachVO;
import com.kh.onepart.resident.messenger.model.vo.RequestImgVO;
import com.kh.onepart.resident.messenger.model.vo.RequestMessengerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseMessengerAndResidentAndManagerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseResidentVO;

public interface MessengerDao {

	/**
	 * 쪽지 작성
	 * @param sqlSession
	 * @param requestMessengerVO
	 */
	int insertMessenger(SqlSessionTemplate sqlSession, RequestMessengerVO requestMessengerVO);

	/**
	 * 타입별 쪽지 카운트
	 * @param sqlSession
	 * @param requestMessengerVO
	 * @return
	 */
	int selectMessengerCount(SqlSessionTemplate sqlSession, RequestMessengerVO requestMessengerVO);

	/**
	 * 타입별 쪽지 리스트
	 * @param sqlSession
	 * @param pi
	 * @param requestMessengerVO
	 * @return
	 */
	ArrayList<ResponseMessengerAndResidentAndManagerVO> selectMessengerList(SqlSessionTemplate sqlSession, PageInfo pi,
			RequestMessengerVO requestMessengerVO);

	/**
	 * 직원 명단 조회
	 * @param sqlSession
	 * @return
	 */
	ArrayList<ManagerAndDeptVO> selectManagerList(SqlSessionTemplate sqlSession);

	/**
	 * 입주민 명단 조회
	 * @param sqlSession
	 * @return
	 */
	ArrayList<ResponseResidentVO> selectResidentList(SqlSessionTemplate sqlSession);

	/**
	 * 이미지 삽입
	 * @param sqlSession
	 * @param requestImgVO
	 */
	void insertImage(SqlSessionTemplate sqlSession, RequestImgVO requestImgVO);

	/**
	 * 첨부파일 삽입
	 * @param sqlSession
	 * @param requestAttachVO
	 */
	void insertAttachment(SqlSessionTemplate sqlSession, RequestAttachVO requestAttachVO);

	/**
	 * 쪽지 상세보기 - 기본정보
	 * @param sqlSession
	 * @param messengerSeq
	 * @return
	 */
	MessengerBasicAllData selectMessengerDetail(SqlSessionTemplate sqlSession, String messengerSeq);

	/**
	 * 쪽지 상세보기 - 이미지
	 * @param sqlSession
	 * @param messengerSeq
	 * @return
	 */
	ArrayList<RequestImgVO> selectImgList(SqlSessionTemplate sqlSession, String messengerSeq);

	/**
	 * 쪽지 상세보기 - 첨부파일
	 * @param sqlSession
	 * @param messengerSeq
	 * @return
	 */
	ArrayList<RequestAttachVO> selectAttachmentList(SqlSessionTemplate sqlSession, String messengerSeq);

	/**
	 * 이미지 다운로드
	 * @param sqlSession
	 * @param imageSeq
	 * @return
	 */
	RequestImgVO selectDownloadImg(SqlSessionTemplate sqlSession, int imageSeq);

	/**
	 * 첨부파일 다운로드
	 * @param sqlSession
	 * @param attchSeq
	 * @return
	 */
	RequestAttachVO selectDownloadAttach(SqlSessionTemplate sqlSession, int attchSeq);

	/**
	 * 메신저 읽기 처리
	 * @param sqlSession
	 * @param messengerSeq
	 */
	void updateMessengerReadProcess(SqlSessionTemplate sqlSession, String messengerSeq);

	/**
	 * 메신저 보관함으로
	 * @param sqlSession
	 * @param messengerSeq
	 */
	void keepMessenger(SqlSessionTemplate sqlSession, ArrayList<String> list);

	/**
	 * 방문 차량용 쪽지 보내기
	 * @param requestMessengerVO
	 */
	void insertMessengerForVisitCar(SqlSessionTemplate sqlSession, RequestMessengerVO requestMessengerVO);

	/**
	 * 선택 쪽지 삭제
	 * @param sqlSession
	 * @param list
	 */
	void deleteMessenger(SqlSessionTemplate sqlSession, ArrayList<String> list);

}
