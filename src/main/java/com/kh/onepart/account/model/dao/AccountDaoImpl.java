package com.kh.onepart.account.model.dao;

import javax.security.auth.login.LoginException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.onepart.account.model.exception.findIdException;
import com.kh.onepart.account.model.exception.findPwdException;
import com.kh.onepart.account.model.vo.HouseholdVo;
import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;

@Repository
public class AccountDaoImpl implements AccountDao {
	//로그인용 메소드
	@Override
	public ResidentVO loginCheck(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) throws LoginException {
		System.out.println("account dao");
		System.out.println("requestResidentVO::" + requestResidentVO);

		ResidentVO loginUser = sqlSession.selectOne("Account.selectCheckLogin", requestResidentVO);
		System.out.println(loginUser);

		if(loginUser == null) {
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		return loginUser;
	}
	// 암호화 비밀번호 조회용 메소드
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) {
		return sqlSession.selectOne("Account.selectPwd", requestResidentVO.getResidentId());
	}
	//비밀번호 일치 시 회원 정보 조회용 메소드
	@Override
	public ResidentVO selectResident(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) {
		return sqlSession.selectOne("Account.selectLoginUser", requestResidentVO);
	}
	//회원 가입용 메소드
	@Override
	public int insertResident(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) {
		System.out.println("sqlSession in daoImpl : " + sqlSession);
		System.out.println("requestResidentVO in daoImpl : " + requestResidentVO);
		//System.out.println("result in daoImle : " + sqlSession.insert("Account.insertResident", requestResidentVO));
		sqlSession.insert("Account.insertResident", requestResidentVO);

		int residentSeq = requestResidentVO.getResidentSeq();
	    return residentSeq;

	}
	//House Hold 값 입력 메소드
	@Override
	public int insertHouseHold(SqlSessionTemplate sqlSession, HouseholdVo householdVo) {
		System.out.println("householdVo ::D:: " + householdVo);
		return sqlSession.insert("Account.insertHouseHold", householdVo);
	}

	//아이디 찾기용 메소드
	@Override
	public ResidentVO findId(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) throws findIdException {
		System.out.println("account dao");
		System.out.println("requestResidentVO::" + requestResidentVO);

		ResidentVO findId = sqlSession.selectOne("Account.selectFindId", requestResidentVO);
		System.out.println("findId in dao : " + findId);

//		if(findId == null) {
//			throw new findIdException("일치하는 아이디가 존재하지 않습니다.");
//		}
		return findId;
	}

	//비밀번호 찾기용 정보조회 메소드
	@Override
	public ResidentVO findPwd(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) throws findPwdException {
		System.out.println("account dao");
		System.out.println("requestResidentVO::" + requestResidentVO);

		ResidentVO findPwd = sqlSession.selectOne("Account.selectFindPwd", requestResidentVO);
		System.out.println("findPwd in dao : " + findPwd);

//		if(findPwd == null) {
//			throw new findPwdException("일치하는 아이디가 존재하지 않습니다.");
//		}
		return findPwd;
	}

	//비밀번호 재설정용 메소드
	@Override
	public int setNewPwd(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) {
		System.out.println("sqlSession in daoImpl : " + sqlSession);
		System.out.println("requestResidentVO in daoImpl : " + requestResidentVO);
		//System.out.println("result in daoImle : " + sqlSession.insert("Account.insertResident", requestResidentVO));
		return sqlSession.insert("Account.setNewPwd", requestResidentVO);
	}

	// 관리자 암호화 비밀번호 조회용 메소드
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, ManagerVO requestManagerVO) {
		return sqlSession.selectOne("Account.selectManagerPwd", requestManagerVO);
	}

	// 관리자 비밀번호 일치 시 회원 정보 조회용 메소드
	@Override
	public ManagerVO selectManager(SqlSessionTemplate sqlSession, ManagerVO requestManagerVO) {
		return sqlSession.selectOne("Account.selectManagerLoginUser", requestManagerVO);
	}

	//아이디 중복 체크
	@Override
	public int idcheck(SqlSessionTemplate sqlSession, String residentId) {
		System.out.println("residentId ::D:: " + residentId);
		return sqlSession.selectOne("Account.idcheck",residentId);
	}

	//회원정보 수정에서 비밀번호 재설정용 메소드


	//회원정보 수정에서 현재 비밀번호 조회용 메소드
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, String residentId) {
		return sqlSession.selectOne("Account.selectPwd", residentId);
	}

	//회원정보수정에서 휴대전화번호 업데이트 메소드
	@Override
	public int setNewHP(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) {
		return sqlSession.update("Account.updatePhone", requestResidentVO);
	}

	//회원정보수정에서 이메일주소 업데이트 메소드
	@Override
	public int setNewEmail(SqlSessionTemplate sqlSession, ResidentVO requestResidentVO) {
		return sqlSession.update("Account.updateEmail", requestResidentVO);
	}


}
