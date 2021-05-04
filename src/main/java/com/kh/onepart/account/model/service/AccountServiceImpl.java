package com.kh.onepart.account.model.service;

import javax.security.auth.login.LoginException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onepart.account.model.dao.AccountDao;
import com.kh.onepart.account.model.exception.ManagerLoginException;
import com.kh.onepart.account.model.exception.findIdException;
import com.kh.onepart.account.model.exception.findPwdException;
import com.kh.onepart.account.model.vo.HouseholdVo;
import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	AccountDao accountDao;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	//로그인용 메소드
	@Override
	public ResidentVO loginCheck(ResidentVO requestResidentVO) throws LoginException {
		System.out.println("loginCheck service");
		System.out.println("requestResidentVO in Service::" + requestResidentVO);

		ResidentVO loginUser = null;
		String encPassword = accountDao.selectEncPassword(sqlSession, requestResidentVO);
		System.out.println("encPassword in service : " + encPassword);
		System.out.println("requestResidentVO.getResidentPwd() in service : " + requestResidentVO.getResidentPwd());

//		ResidentVO responseResidentVO = accountDao.loginCheck(sqlSession, requestResidentVO);

		if(!passwordEncoder.matches(requestResidentVO.getResidentPwd(), encPassword)) {
//			System.out.println("hi");
			throw new LoginException("로그인 실패!");
		}else {
			loginUser = accountDao.selectResident(sqlSession, requestResidentVO);
			System.out.println("loginUser in Service : " + loginUser);
		}

		return loginUser;
	}

	//회원 가입용 메소드
	@Override
	public int insertResident(ResidentVO requestResidentVO) {
		System.out.println("requestResidentVO in svcImpl : " + requestResidentVO);

		int residentSeq = accountDao.insertResident(sqlSession, requestResidentVO);
		System.out.println("residentSeq ::S:: " + residentSeq);

		HouseholdVo householdVo = new HouseholdVo();
		householdVo.setAptDetailInfoSeq(requestResidentVO.getAptDetailInfoSeq());
		householdVo.setResidentSeq(residentSeq);

//		if(result > 0) {
			return accountDao.insertHouseHold(sqlSession, householdVo);
//		}else {


//		}

	}

	//아이디 찾기용 메소드
	@Override
	public ResidentVO findId(ResidentVO requestResidentVO) throws findIdException {
		System.out.println("account service");
		System.out.println("requestResidentVO in Service:" + requestResidentVO);

		ResidentVO findId = null;
		findId = accountDao.findId(sqlSession, requestResidentVO);
		System.out.println("findId in Service : " + findId);

		return findId;
	}

	//비밀번호 찾기용 정보조회 메소드
	@Override
	public ResidentVO findPwd(ResidentVO requestResidentVO) throws findPwdException {
		System.out.println("account service");
		System.out.println("requestResidentVO in Service:" + requestResidentVO);

		ResidentVO findPwd = null;
		findPwd = accountDao.findPwd(sqlSession, requestResidentVO);
		System.out.println("findPwd in Service : " + findPwd);

		return findPwd;
	}

	//비밀번호 재설정용 메소드
	@Override
	public int setNewPwd(ResidentVO requestResidentVO) {
		System.out.println("requestResidentVO in svcImpl : " + requestResidentVO);
		return accountDao.setNewPwd(sqlSession, requestResidentVO);
	}

	@Override
	public ManagerVO managerLoginCheck(ManagerVO requestManagerVO) throws ManagerLoginException {
		System.out.println("account service");
		System.out.println("requestManagerVO in Service::" + requestManagerVO);

		ManagerVO loginUser = null;
		String encPassword = accountDao.selectEncPassword(sqlSession, requestManagerVO);
		System.out.println("encPassword in service : " + encPassword);
		System.out.println("requestManagerVO.getResidentPwd() in service : " + requestManagerVO.getManagerPwd());

//		ResidentVO responseResidentVO = accountDao.loginCheck(sqlSession, requestManagerVO);

		if(!passwordEncoder.matches(requestManagerVO.getManagerPwd(), encPassword)) {
			System.out.println("hi");
			throw new ManagerLoginException("로그인 실패!");
		}else {
			loginUser = accountDao.selectManager(sqlSession, requestManagerVO);
			System.out.println("loginUser in Service : " + loginUser);
		}

		return loginUser;
	}

	//아이디 중복 체크
	@Override
	public int idcheck(String residentId) {
		System.out.println("residentId ::S:: " + residentId);
		return accountDao.idcheck(sqlSession, residentId);
	}

	//회원정보 수정에서 비밀번호 재설정용 메소드
	@Override
	public int setNewPwd2(String oldResidentPwd, ResidentVO requestResidentVO) {

		String currentEncPassword = accountDao.selectEncPassword(sqlSession, requestResidentVO.getResidentId());
		System.out.println("currentEncPassword ::S:: " + currentEncPassword );
		System.out.println("oldEncPassword ::S:: " + oldResidentPwd );


		if(passwordEncoder.matches(oldResidentPwd, currentEncPassword)) {
			System.out.println("비밀번호 조회하고 지금 입력한 것과 맞으면 dao로 이동");
			return accountDao.setNewPwd(sqlSession, requestResidentVO);
		}else {
			System.out.println("비밀번호 조회하고 지금 입력한 것과 안 맞아서 return 0");
			return 0;
		}

	}

	//회원정보수정에서 휴대전화번호 업데이트 메소드
	@Override
	public int setNewHP(ResidentVO requestResidentVO) {
		return accountDao.setNewHP(sqlSession, requestResidentVO);
	}

	//회원정보수정에서 이메일주소 업데이트 메소드
	@Override
	public int setNewEmail(ResidentVO requestResidentVO) {
		return accountDao.setNewEmail(sqlSession, requestResidentVO);
	}







}
