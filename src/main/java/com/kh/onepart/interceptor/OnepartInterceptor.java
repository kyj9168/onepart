package com.kh.onepart.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class OnepartInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(OnepartInterceptor.class);

//	private final String[] EXCLUDE_URL = {
//			"/moveAccount",
//			"/resources",
//			"/resident/main"
//			};

	// Controller 가기 전 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		//System.out.println("preHandle 실행!!!!");

//		String requestURL  = URLUtils.URL_SUBSTRING(request.getRequestURL().toString());
//		System.out.println("requestURL :: " + requestURL);
//		ResidentVO residentVO = (ResidentVO) request.getSession().getAttribute("loginUser");
//
//		boolean passFlag = false;
//
//		// 로그인이 되지 않았을 경우
//		if(residentVO == null) {
//			for(String excludeUrl : EXCLUDE_URL) {
//				System.out.println(" 11111requestURL : " + requestURL);
//				System.out.println(" 22222excludeUrl : " + excludeUrl);
//
//				if(requestURL.contains(excludeUrl)) {
//					passFlag = true;
//					break;
//				} else {
//					System.out.println("else in !");
//					System.out.println("requestURL else : " + requestURL);
//				}
//			}
//		}
//		System.out.println("passFlag : " + passFlag);
//		if(passFlag == false) {
//			response.sendRedirect("/onepart/moveAccount/");
//		}

		return super.preHandle(request, response, handler);
	}

	// Controller에서 View로 가기 전 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		//System.out.println("postHandle 실행!!!!");

		super.postHandle(request, response, handler, modelAndView);
	}

	// Controller에서 View 전달 후 View에서 처리 완료 뒤 실행
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

		//System.out.println("afterCompletion 실행!!!!");

		super.afterCompletion(request, response, handler, ex);
	}

}
