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
	private final String[] passPage = {
			"/HIT-DataManage",
			"/HIT-DataManage/Login.html", 
			"/HIT-DataManage/LoginAction", 
			"/HIT-DataManage/SignAction", 
			"/HIT-DataManage/Regist.html"
	}; //������һϵ���ܶ�������������Ľ������action
	
	private final String[] resource = {
			"/boostrap",
			"/img"
	};
	
	//�ȶ���һ�������ж�ssession��ֵ�Ƿ����Ҫ��
	public boolean isCorrect(HttpSession session) {
		if(session == null || session.getAttribute("status") == null || !(session.getAttribute("status").equals("success"))) {
			return false;
		}
		else {
			return true;
		}
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		boolean isPass = false;
		boolean isResource = false;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		boolean sessionStatus = isCorrect(session);
		String url = req.getRequestURI();
		for(int i = 0; i < passPage.length; i++) {
			if(url.equals(passPage[i])) {
				isPass = true;
				break;
			}
		}
		for(int i = 0; i < resource.length; i++) {
			if(url.indexOf(resource[i]) != -1) {
				isResource = true;
				break;
			}
		}
		/*
		 * �Ƚ��й���ҳ�������Ȼ����δ��¼��
		 * ֱ��������¼����
		 */
		if(!isPass && !isResource) {
			if(!sessionStatus) {
				res.sendRedirect(req.getContextPath() + LOGIN_PAGE);
				return;
			}
		}
		chain.doFilter(request, response); 
	}
	
}