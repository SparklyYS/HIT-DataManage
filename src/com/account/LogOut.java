package com.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogOut extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	
	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String logout() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		session.setAttribute("status", "non");
		session.removeAttribute("userName");
		return SUCCESS;
	}
}
