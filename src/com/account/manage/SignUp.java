package com.account.manage;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.manage.*;

public class SignUp extends ActionSupport {
	private String userName, userPasswd, userEmail;
	private String status;
	
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
	
	public String createAccount() {
		try {
			String sqlcmd = "";
			SQLManage mysql = new SQLManage(sqlcmd);
			
			mysql.close();
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
			status = ERROR;
		}	
		catch(SQLException e){
			e.printStackTrace();
			status = ERROR;
		}	
		return status;
	}
}
