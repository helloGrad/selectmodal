package com.grad.net.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.grad.net.service.MemberService;


/*
 * 박가혜, 로그아웃 세션 종료
 */

public class AuthLogoutInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private MemberService MemberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(true);
		
		session.removeAttribute("authUser");
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/");

		return false;
	}

}
