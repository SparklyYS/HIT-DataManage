package com.account.manage;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.manage.*;

public class LoginIn extends ActionSupport{
	private String userName, userPasswd;
	private String status;
	
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
	
	public String matchAccount() {
		try {
			String sqlcmd = "";
			SQLManage mysql = new SQLManage(sqlcmd);
			
			mysql.close();
		}
		catch(ClassNotFoundException e){
			status = ERROR;
			e.printStackTrace();
		}	
		catch(SQLException e){
			status = ERROR;
			e.printStackTrace();
		}	
		
		return status;
	}
}
