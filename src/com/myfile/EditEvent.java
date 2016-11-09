package com.myfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class EditEvent extends ActionSupport implements ServletRequestAware {
	private String status;
	private HashMap<String, String> new_event;
	private String PDOName;
	private int eventID;
	private HttpServletRequest request;

	public void setEventID(int eventID) {
		this.eventID = eventID;
	}

	public HashMap<String, String> getNew_event() {
		return new_event;
	}

	public void setNew_event(HashMap<String, String> new_event) {
		this.new_event = new_event;
	}

	public String getPDOName() {
		return PDOName;
	}

	public void setPDOName(String pDOName) {
		PDOName = pDOName;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String editEvent() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd = "update " + userName + "_" + PDOName + " set ";
			for (String header : new_event.keySet()) {
				sqlcmd = sqlcmd + header + "=?,";
			}
			sqlcmd = sqlcmd.substring(0, sqlcmd.length() - 1);
			sqlcmd += "where eventID=?";
			SQLManage mysql = new SQLManage(sqlcmd);
			int i = 1;
			for (String header : new_event.keySet()) {
				mysql.setString(i, new_event.get(header));
				i++;
			}
			mysql.setInteger(i, eventID);
			mysql.executeUpdate();
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
