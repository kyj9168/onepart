package com.kh.onepart.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class BeforeAdvice {
	@Pointcut("execution(* com.kh.tsp..*ServiceImpl.*(..))")
	public void allPointcut() {}

	@Before("allPointcut()")
	public void beforeLog(JoinPoint jp) {
		String methodName = jp.getSignature().getName();

		Object[] args = jp.getArgs();

		System.out.println("[메소드 호출 전 확인] : " + methodName + "() 메소드의 매개변수 갯수 : " + args.length);
		for(int i = 0; i < args.length; i++) {
			System.out.println(i + "번째 매개변수 정보 : " + args[i].toString());
		}
	}

}
