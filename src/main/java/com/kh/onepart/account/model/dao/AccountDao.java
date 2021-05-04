package com.kh.onepart.account.model.dao;

import javax.security.auth.login.LoginException;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.onepart.account.model.exception.findIdException;
import com.kh.onepart.account.model.exception.findPwdException;
import com.kh.onepart.account.model.vo.HouseholdVo;
import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;

public interface AccountDao {
	//로그인용 메소드
	ResidentVO loginCheck(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) throws LoginException;
	// 암호화 비밀번호 조회용 메소드
	String selectEncPassword(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO);
	// 비밀번호 일치 시 회원 정보 조회용 메소드
	ResidentVO selectResident(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO);

	//회원 가입용 메소드
	int insertResident(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO);
	//House Hold 값 입력 메소드
	int insertHouseHold(SqlSessionTemplate sqlSession, HouseholdVo householdVo);

	//아이디 찾기용 메소드
	ResidentVO findId(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) throws findIdException;

	//비밀번호 찾기용 정보조회 메소드
	ResidentVO findPwd(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) throws findPwdException;

	//비밀번호 재설정용 메소드
	int setNewPwd(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO);

	// 관리자 암호화 비밀번호 조회용 메소드
	String selectEncPassword(SqlSessionTemplate sqlSession, ManagerVO requestManagerVO);

	// 관리자 비밀번호 일치 시 회원 정보 조회용 메소드
	ManagerVO selectManager(SqlSessionTemplate sqlSession, ManagerVO requestManagerVO);

	//아이디 중복 체크
	int idcheck(SqlSessionTemplate sqlSession, String residentId);

	//회원정보 수정에서 현재 비밀번호 조회용 메소드
	String selectEncPassword(SqlSessionTemplate sqlSession, String residentId);

	//회원정보수정에서 휴대전화번호 업데이트 메소드
	int setNewHP(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO);

	//회원정보수정에서 이메일주소 업데이트 메소드
	int setNewEmail(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO);

}
