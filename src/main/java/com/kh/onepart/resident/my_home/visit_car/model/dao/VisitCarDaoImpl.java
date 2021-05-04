package com.kh.onepart.resident.my_home.visit_car.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.resident.my_home.visit_car.model.vo.VisitCarVo;

@Repository
public class VisitCarDaoImpl implements VisitCarDao{

	//방문차량 등록용 메소드
	@Override
	public int registerVisitCar(SqlSessionTemplate sqlSession, VisitCarVo requestVisitCarVo) {
		System.out.println("requestVisitCarVo ::D:: " + requestVisitCarVo);
		return sqlSession.insert("ResidentVisitCar.insertVisitCar", requestVisitCarVo);
	}

	//로그인 유저의 방문차량 등록 리스트 불러오는 메소드
	@Override
	public ArrayList selectMyVisitcarList(SqlSessionTemplate sqlSession, int residentSeq) {
		System.out.println("residentSeq ::D::" + residentSeq);
		return (ArrayList) sqlSession.selectList("ResidentVisitCar.selectMyVisitcarList", residentSeq);

	}

	//방문차량 등록 삭제용 메소드
	@Override
	public int deleteListVisitCar(SqlSessionTemplate sqlSession, String[] visitCarSeqArr) {
		System.out.println("visitCarSeqArr ::D:: " + visitCarSeqArr);

		return sqlSession.delete("ResidentVisitCar.deleteListVisitCar", visitCarSeqArr);
	}

}
