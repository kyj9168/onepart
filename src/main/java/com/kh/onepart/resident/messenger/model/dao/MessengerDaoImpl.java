package com.kh.onepart.resident.messenger.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.resident.messenger.model.vo.ManagerAndDeptVO;
import com.kh.onepart.resident.messenger.model.vo.MessengerBasicAllData;
import com.kh.onepart.resident.messenger.model.vo.RequestAttachVO;
import com.kh.onepart.resident.messenger.model.vo.RequestImgVO;
import com.kh.onepart.resident.messenger.model.vo.RequestMessengerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseMessengerAndResidentAndManagerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseResidentVO;

@Repository
public class MessengerDaoImpl implements MessengerDao {

	/**  쪽지 작성 */
	@Override
	public int insertMessenger(SqlSessionTemplate sqlSession, RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub

		sqlSession.insert("Messenger.insertMessenger", requestMessengerVO);
		return requestMessengerVO.getMessengerSeq();
	}

	/** 타입별 쪽지 카운트 */
	@Override
	public int selectMessengerCount(SqlSessionTemplate sqlSession, RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub

		int messengerCount = sqlSession.selectOne("Messenger.selectMessengerCount", requestMessengerVO);

		return messengerCount;
	}

	/** 타입별 쪽지 리스트 */
	@Override
	public ArrayList<ResponseMessengerAndResidentAndManagerVO> selectMessengerList(SqlSessionTemplate sqlSession,
			PageInfo pi, RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		ArrayList<ResponseMessengerAndResidentAndManagerVO> responseMessengerAndResidentAndManagerVOList = (ArrayList) sqlSession.selectList("Messenger.selectMessengerList", requestMessengerVO, rowBounds);

		return responseMessengerAndResidentAndManagerVOList;
	}

	/** 직원 명단 조회 */
	@Override
	public ArrayList<ManagerAndDeptVO> selectManagerList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub

		return (ArrayList) sqlSession.selectList("Messenger.selectManagerList");
	}

	/** 입주민 명단 조회 */
	@Override
	public ArrayList<ResponseResidentVO> selectResidentList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("Messenger.selectResidentList");
	}

	/** 이미지 삽입 */
	@Override
	public void insertImage(SqlSessionTemplate sqlSession, RequestImgVO requestImgVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("Messenger.insertImage", requestImgVO);
	}

	/** 첨부파일 삽입 */
	@Override
	public void insertAttachment(SqlSessionTemplate sqlSession, RequestAttachVO requestAttachVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("Messenger.insertAttachment", requestAttachVO);
	}

	/** 쪽지 상세보기 - 기본정보 */
	@Override
	public MessengerBasicAllData selectMessengerDetail(SqlSessionTemplate sqlSession, String messengerSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selectMessengerDetail", messengerSeq);
	}

	/** 쪽지 상세보기 - 이미지 */
	@Override
	public ArrayList<RequestImgVO> selectImgList(SqlSessionTemplate sqlSession, String messengerSeq) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("Messenger.selectImgList", messengerSeq);
	}

	/** 쪽지 상세보기 - 첨부파일 */
	@Override
	public ArrayList<RequestAttachVO> selectAttachmentList(SqlSessionTemplate sqlSession, String messengerSeq) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("Messenger.selectAttachmentList", messengerSeq);
	}

	/** 이미지 다운로드 */
	@Override
	public RequestImgVO selectDownloadImg(SqlSessionTemplate sqlSession, int imageSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selectDownloadImg", imageSeq);
	}

	/** 첨부파일 다운로드 */
	@Override
	public RequestAttachVO selectDownloadAttach(SqlSessionTemplate sqlSession, int attchSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Messenger.selectDownloadAttach", attchSeq);
	}

	/** 메신저 읽기 처리 */
	@Override
	public void updateMessengerReadProcess(SqlSessionTemplate sqlSession, String messengerSeq) {
		// TODO Auto-generated method stub
		sqlSession.update("Messenger.updateMessengerReadProcess", messengerSeq);
	}

	/** 메신저 보관함으로 */
	@Override
	public void keepMessenger(SqlSessionTemplate sqlSession, ArrayList<String> list) {
		// TODO Auto-generated method stub
		sqlSession.update("Messenger.keepMessenger", list);
	}

	/** 방문 차량용 쪽지 보내기 */
	@Override
	public void insertMessengerForVisitCar(SqlSessionTemplate sqlSession, RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("Messenger.insertMessengerForVisitCar", requestMessengerVO);
	}

	/** 선택 쪽지 삭제 */
	@Override
	public void deleteMessenger(SqlSessionTemplate sqlSession, ArrayList<String> list) {
		// TODO Auto-generated method stub
		sqlSession.update("Messenger.deleteMessenger", list);
	}
}
