package com.kh.onepart.account.model.service;

import javax.security.auth.login.LoginException;

import com.kh.onepart.account.model.exception.ManagerLoginException;
import com.kh.onepart.account.model.exception.findIdException;
import com.kh.onepart.account.model.exception.findPwdException;
import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;

public interface AccountService {
	//로그인 정보 확인용 메소드
	ResidentVO loginCheck(ResidentVO requestResidentVO) throws LoginException;

	//회원 가입용 메소드
	int insertResident(ResidentVO requestResidentVO);

	//아이디 찾기용 메소드
	ResidentVO findId(ResidentVO requestResidentVO) throws findIdException;

	//비밀번호 찾기용 정보조회 메소드
	ResidentVO findPwd(ResidentVO requestResidentVO) throws findPwdException;

	//비밀번호 재설정용 메소드
	int setNewPwd(ResidentVO requestResidentVO);

	//관리자 로그인 정보 확인용 메소드
	ManagerVO managerLoginCheck(ManagerVO requestManagerVO) throws ManagerLoginException;

	//아이디 중복 체크
	int idcheck(String residentId);

	//회원정보 수정에서 비밀번호 재설정용 메소드
	int setNewPwd2(String oldResidentPwd, ResidentVO requestResidentVO);

	//회원정보수정에서 휴대전화번호 업데이트 메소드
	int setNewHP(ResidentVO requestResidentVO);

	//회원정보수정에서 이메일주소 업데이트 메소드
	int setNewEmail(ResidentVO requestResidentVO);




}
