package com.kh.onepart.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class AroundAdvice {
	@Pointcut("execution(* com.kh.tsp..*ServiceImpl..*(..))")
	public void allPointcut() {}

	@Around("allPointcut()")
	public Object aroundLog(ProceedingJoinPoint pj) throws Throwable {
		String methodName = pj.getSignature().getName();

		//사전에 대한 처리 내용
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();

		//원래 흐름으로 진행
		Object obj = pj.proceed();

		//사후에 대한 처리 내용
		stopWatch.stop();

		System.out.println(methodName + "메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");

		return obj;
	}
}
