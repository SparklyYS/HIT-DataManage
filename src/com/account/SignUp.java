package com.account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.*;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

public class SignUp extends ActionSupport implements ServletRequestAware {
	private String userName, userPasswd, userEmail;
	private String status;
	private final String EXISTED = "existed";
	private HttpServletRequest request;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPasswd() {
		return userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String createAccount() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		try {
			String sqlcmd = "select * from users where userName=? or userEmail=?";
			SQLManage mysql;
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			mysql.setString(2, userEmail);
			ResultSet mydata = mysql.executeQuery();
			if (mydata.next()) {
				status = EXISTED;
			} else {
				sqlcmd = "insert into users (userName,userPasswd,userEmail,createTime) values (?,?,?,?)";
				Timestamp t = new Timestamp(new Date().getTime());
				mysql = new SQLManage(sqlcmd);
				mysql.setString(1, userName);
				mysql.setString(2, userPasswd);
				mysql.setString(3, userEmail);
				mysql.setTimestamp(4, t);
				mysql.executeUpdate();
				sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
				mysql = new SQLManage(sqlcmd);
				mysql.setString(1, "创建用户："+userName+"，邮箱："+userEmail);
				mysql.setTimestamp(2, t);
				mysql.setString(3, userName);
				mysql.executeUpdate();
				session.setAttribute("status", "success");
				session.setAttribute("userName", userName);
				status = SUCCESS;
			}
			mysql.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			status = ERROR;
		} catch (SQLException e) {
			e.printStackTrace();
			status = ERROR;
		}
		return status;
	}
}