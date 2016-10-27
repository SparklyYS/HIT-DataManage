package com.account;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class LoginIn extends ActionSupport implements ServletRequestAware{
	private String userName, userPasswd;
	private String status;
	private HttpServletRequest request; 
	
	private final String NO_MATCH = "noMatch";
	
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String matchAccount() {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpSession session = req.getSession(); 
		try {
			String sqlcmd = "";
			if(userName.contains("@")) {
				sqlcmd = "select * from users where userEmail=?";
			}
			else {
				sqlcmd = "select * from users where userName=?";
			}
			SQLManage mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			ResultSet mydata = mysql.executeQuery();
			if(mydata.next()) {
				String passwd = mydata.getString("userPasswd");
				if(passwd.equals(userPasswd)) {
					status = SUCCESS;
					session.setAttribute("status", "success");
				}
				else {
					status = NO_MATCH;
					session.setAttribute("status", "fail");
				}
			}
			else {
				status = NO_MATCH;
				session.setAttribute("status", "non");
			}
			mysql.close();
		}
		catch(ClassNotFoundException e) {
			status = ERROR;
			e.printStackTrace();
		}	
		catch(SQLException e) {
			status = ERROR;
			e.printStackTrace();
		}	
		return status;
	}
}