package com.account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Result;
import com.sql.SQLManage;

public class HomePage extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<Message> messages = new ArrayList<Message>();
	private HttpServletRequest request;
	private Counts myCounts;

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

	public Counts getMyCounts() {
		return myCounts;
	}

	public void setMyCounts(Counts myCounts) {
		this.myCounts = myCounts;
	}

	public String showHome() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		try {
			int messCounts = 0;
			String sqlcmd = "select * from messages where userName=?";
			SQLManage mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			ResultSet mymess = mysql.executeQuery();
			while (mymess.next()) {
				messCounts ++;
				String mess = mymess.getString("message");
				Timestamp t = mymess.getTimestamp("messageTime");
				messages.add(new Message(mess, t));
			}
			
			int pdoCount = 0,eventCount = 0;
			sqlcmd = "select * from pdos where userName=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			mymess = mysql.executeQuery();
			status = SUCCESS;
			while(mymess.next()) {
				pdoCount ++;
				eventCount += mymess.getInt("counts");
			}
			myCounts = new Counts(pdoCount, eventCount, messCounts);
			mysql.close();
		} catch (ClassNotFoundException e) {
			status = ERROR;
			e.printStackTrace();
		} catch (SQLException e) {
			status = ERROR;
			e.printStackTrace();
		}
		return status;
	}
}
