package com.account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.*;
import java.util.Date;

public class SignUp extends ActionSupport {
	private String userName, userPasswd, userEmail;
	private String status;
	private final String EXISTED = "existed";

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
				mysql.setString(1, "create account");
				mysql.setTimestamp(2, t);
				mysql.setString(3, userName);
				mysql.executeUpdate();
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