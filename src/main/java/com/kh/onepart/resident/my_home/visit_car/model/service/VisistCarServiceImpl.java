package com.kh.onepart.resident.my_home.visit_car.model.service;

import java.util.ArrayList;

import javax.security.auth.login.LoginException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onepart.resident.my_home.visit_car.model.dao.VisitCarDao;
import com.kh.onepart.resident.my_home.visit_car.model.vo.VisitCarVo;

@Service
public class VisistCarServiceImpl implements VisitCarService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	VisitCarDao visitCarDao;

	//방문차량 등록용 메소드
	@Override
	public int registerVisitCar(VisitCarVo requestVisitCarVo) {
		System.out.println("requestVisitCarVo ::S::" + requestVisitCarVo);
		return visitCarDao.registerVisitCar(sqlSession, requestVisitCarVo);
	}

	//로그인 유저의 방문차량 등록 리스트 불러오는 메소드
	@Override
	public ArrayList selectMyVisitcarList(int residentSeq) {
		System.out.println("residentSeq ::S::" + residentSeq);
		return visitCarDao.selectMyVisitcarList(sqlSession, residentSeq);
	}

	//방문차량 등록 삭제 후 방문차량 등록 리스트 불러오는 메소드
	@Override
	public int deleteListVisitCar(String[] visitCarSeqArr) {
		System.out.println("visitCarSeqArr ::S::" + visitCarSeqArr);
		int result = visitCarDao.deleteListVisitCar(sqlSession, visitCarSeqArr);
		return result;
	}

}
