package com.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserAuthenticationFilter implements javax.servlet.Filter {
	
	private final String LOGIN_PAGE = "/Login.html";
	private final String LOGIN_ACTION = "/LoginAction";
	private final String SIGNUP_ACTION = "/SignAction";
	private final String SIGNUP_PAGE = "/Regist.html";

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String url= req.getRequestURI();
		if(url.indexOf(LOGIN_PAGE) == -1 && url.indexOf(LOGIN_ACTION) == -1 && url.indexOf(SIGNUP_ACTION) == -1 && url.indexOf(SIGNUP_PAGE) == -1) {
			if(session == null || session.getAttribute("status") == null ) {
				res.sendRedirect(req.getContextPath() + LOGIN_PAGE);
				return;
			}
			if(!(session.getAttribute("status").equals("success"))) {
				res.sendRedirect(req.getContextPath() + LOGIN_PAGE); 
				return;
			}
		}
		chain.doFilter(request, response); 
	}
	
}