package com.kh.onepart.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.kh.onepart.account.model.vo.ResidentVO;

@Component
@Aspect
public class AfterReturningAdvice {
	@Pointcut("execution(* com.kh.tsp..*serviceImple.*(..))")
	public void allPointcut() {}

	//보통 설정명 말해주면 다른 거랑 같이 쓴다는 뜻
	@AfterReturning(pointcut="allPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		String methodName = jp.getSignature().getName();

		//로그인 성공시 간단하게 콘솔에 출력
		if(returnObj instanceof ResidentVO) {
			ResidentVO requestResidentVO = (ResidentVO) returnObj;

				if(requestResidentVO.getResidentId().equals("user01")) {
					System.out.println("로그인 : user01");
				}
		}
		System.out.println("[메소드 리턴] " + methodName
				+ "() 메소드 리턴 값 : " + returnObj.toString());
	}
}
