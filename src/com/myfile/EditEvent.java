package com.myfile;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class EditEvent extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<String> data = new ArrayList<>();
	private String PDOName;
	private int eventID;
	private HttpServletRequest request;

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}

	public void setEventID(int eventID) {
		this.eventID = eventID;
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
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd,link="";
			SQLManage mysql;
			ResultSet mydata;
			ResultSetMetaData column;
			int columnCount;
			ArrayList<String> head = new ArrayList<>();
			sqlcmd = "select * from " + userName + "_" + PDOName;
			mysql = new SQLManage(sqlcmd);
			mydata = mysql.executeQuery();
			column = mydata.getMetaData();
			columnCount = column.getColumnCount();
			for (int i = 2; i < columnCount; i++) {
				head.add(column.getColumnName(i));
			}
			sqlcmd = "select * from " + userName + "_" + PDOName + " where eventID=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setInteger(1, eventID);
			mydata = mysql.executeQuery();
			if(mydata.next()) {
				link = mydata.getString("link");
			}
			sqlcmd = "update " + userName + "_" + PDOName + " set ";
			for (String tmp : head) {
				sqlcmd = sqlcmd + tmp + "=?,";
			}
			sqlcmd += "link=?";
			sqlcmd += " where eventID=?";
			mysql = new SQLManage(sqlcmd);
			for(int i = 1;i <= data.size();i++) {
				mysql.setString(i, data.get(i-1));
			}
			mysql.setString(data.size()+1, link);
			mysql.setInteger(data.size()+2, eventID);
			mysql.executeUpdate();
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, "编辑了PDO："+PDOName);
			mysql.setTimestamp(2, t);
			mysql.setString(3, userName);
			mysql.executeUpdate();
			status = SUCCESS;
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
