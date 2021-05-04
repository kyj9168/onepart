package com.kh.onepart.resident.messenger.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.common.PageInfo;
import com.kh.onepart.resident.messenger.model.dao.MessengerDao;
import com.kh.onepart.resident.messenger.model.vo.ManagerAndDeptVO;
import com.kh.onepart.resident.messenger.model.vo.MessengerBasicAllData;
import com.kh.onepart.resident.messenger.model.vo.RequestAttachVO;
import com.kh.onepart.resident.messenger.model.vo.RequestImgVO;
import com.kh.onepart.resident.messenger.model.vo.RequestMessengerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseMessengerAndResidentAndManagerVO;
import com.kh.onepart.resident.messenger.model.vo.ResponseResidentVO;

@Service
public class MessengerServiceImpl implements MessengerService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	MessengerDao messengerDao;

	/** 쪽지 작성 */
	@Override
	public void insertMessenger(RequestMessengerVO requestMessengerVO, String[] tags, ArrayList<RequestImgVO> requestImgVOList, ArrayList<RequestAttachVO> requestAttachVOList) {
		// TODO Auto-generated method stub

		for(int i=0; i<tags.length; i++) {
			System.out.println("받는 이 : " + tags[i]);
			requestMessengerVO.setMessengerReceiver(tags[i]);
			System.out.println("최종 requestMessengerVO ::: " + requestMessengerVO);
			int messengerSeq = messengerDao.insertMessenger(sqlSession, requestMessengerVO);

			// image
			for(int j=0; j<requestImgVOList.size(); j++) {
				System.out.println("이미지를 !!!");
				requestImgVOList.get(j).setMessengerSeq(messengerSeq);
				messengerDao.insertImage(sqlSession, requestImgVOList.get(j));
			}

			// attachment
			for(int j=0; j<requestAttachVOList.size(); j++) {
				System.out.println("첨부파일 !!!");
				requestAttachVOList.get(j).setMessengerSeq(messengerSeq);
				messengerDao.insertAttachment(sqlSession, requestAttachVOList.get(j));
			}
		}
	}

	/** 타입별 쪽지 카운트 */
	@Override
	public int selectMessengerCount(RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub

		int messengerCount = messengerDao.selectMessengerCount(sqlSession, requestMessengerVO);


		return messengerCount;
	}

	/** 타입별 쪽지 리스트 */
	@Override
	public ArrayList<ResponseMessengerAndResidentAndManagerVO> selectMessengerList(PageInfo pi,
			RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub

		ArrayList<ResponseMessengerAndResidentAndManagerVO> responseMessengerAndResidentAndManagerVOList = messengerDao.selectMessengerList(sqlSession, pi, requestMessengerVO);

		return responseMessengerAndResidentAndManagerVOList;
	}

	/** 직원 명단 조회 */
	@Override
	public ArrayList<ManagerAndDeptVO> selectManagerList() {
		// TODO Auto-generated method stub

		return messengerDao.selectManagerList(sqlSession);
	}

	/** 입주민 명단 조회 */
	@Override
	public ArrayList<ResponseResidentVO> selectResidentList() {
		// TODO Auto-generated method stub
		return messengerDao.selectResidentList(sqlSession);
	}

	/** 쪽지 상세보기 */
	@Override
	public ArrayList<Object> selectMessengerDetail(String messengerSeq) {
		// TODO Auto-generated method stub

		ArrayList<Object> messengerDetailData = new ArrayList<Object>();

		// 기본 정보 가져오기
		MessengerBasicAllData basicInfo = messengerDao.selectMessengerDetail(sqlSession, messengerSeq);
		System.out.println("basicInfo ::" + basicInfo);

		// 이미지
		ArrayList<RequestImgVO> imgVOList = messengerDao.selectImgList(sqlSession, messengerSeq);

		// 첨부파일
		ArrayList<RequestAttachVO> attachVOList = messengerDao.selectAttachmentList(sqlSession, messengerSeq);

		System.out.println("imgVOList :: " + imgVOList);
		System.out.println("attachVOList :: " + attachVOList);

		messengerDetailData.add(basicInfo);
		messengerDetailData.add(imgVOList);
		messengerDetailData.add(attachVOList);

		return messengerDetailData;
	}

	/** 이미지 다운로드 */
	@Override
	public RequestImgVO selectDownloadImg(RequestImgVO requestImgVO) {
		// TODO Auto-generated method stub
		return messengerDao.selectDownloadImg(sqlSession, requestImgVO.getImageSeq());
	}

	/** 첨부파일 다운로드 */
	@Override
	public RequestAttachVO selectDownloadAttach(RequestAttachVO requestAttachVO) {
		// TODO Auto-generated method stub
		return messengerDao.selectDownloadAttach(sqlSession, requestAttachVO.getAttchSeq());
	}

	/** 메신저 읽기 처리 */
	@Override
	public void updateMessengerReadProcess(String messengerSeq) {
		// TODO Auto-generated method stub

		messengerDao.updateMessengerReadProcess(sqlSession, messengerSeq);
	}

	/** 메신저 보관함으로 */
	@Override
	public void keepMessenger(ArrayList<String> list) {
		// TODO Auto-generated method stub
		messengerDao.keepMessenger(sqlSession, list);
	}

	/** 방문 차량용 쪽지 보내기 */
	@Override
	public void insertMessengerForVisitCar(RequestMessengerVO requestMessengerVO) {
		// TODO Auto-generated method stub
		messengerDao.insertMessengerForVisitCar(sqlSession, requestMessengerVO);
	}

	/** 선택쪽지 삭제 */
	@Override
	public void deleteMessenger(ArrayList<String> list) {
		// TODO Auto-generated method stub
		messengerDao.deleteMessenger(sqlSession, list);
	}

}
