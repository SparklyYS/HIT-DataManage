package com.search;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class ShowLink extends ActionSupport implements ServletRequestAware {
	private String status;
	private HttpServletRequest request;
	private String link;
	private ArrayList<String> headers = new ArrayList<>();
	private ArrayList<String> value = new ArrayList<>();
	
	public ArrayList<String> getHeaders() {
		return headers;
	}

	public void setHeaders(ArrayList<String> headers) {
		this.headers = headers;
	}

	public ArrayList<String> getValue() {
		return value;
	}

	public void setValue(ArrayList<String> value) {
		this.value = value;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String show() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/msexcel;charset=UTF-8");
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd;
			SQLManage mysql;
			ResultSet mydata;
			ResultSetMetaData column;
			int columnCount;
			headers.add(link.substring(0, link.indexOf("_")));
			String tableName = userName+"_"+link.substring(0, link.indexOf("_"));
			String eventID = link.substring(link.indexOf("_") + 1);
			sqlcmd = "select * from " + tableName + " where eventID=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setInteger(1, Integer.parseInt(eventID));
			mydata = mysql.executeQuery();
			column = mydata.getMetaData();
			columnCount = column.getColumnCount();
			List<String> head = new ArrayList<>();
			for (int i = 2; i <= columnCount; i++) {
				headers.add(column.getColumnName(i));
				head.add(column.getColumnName(i));
			}
			if(mydata.next()) {
				for (String h : head) {
					value.add(mydata.getString(h));
				}
			}
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
