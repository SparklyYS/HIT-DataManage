package com.account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;
public class HomePage extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<Message> messages = new ArrayList<Message>();
	private HttpServletRequest request;
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public List<Message> getMessages() {
		return messages;
	}
	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	
	public String showHome() {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd = "select * from messages where userName=?";
			SQLManage mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			ResultSet mymess = mysql.executeQuery();
			status = SUCCESS;
			while(mymess.next()) {
				String mess = mymess.getString("message");
				Timestamp t = mymess.getTimestamp("messageTime");
				messages.add(new Message(mess, t));
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
