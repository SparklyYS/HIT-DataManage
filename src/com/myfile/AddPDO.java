package com.myfile;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class AddPDO extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private String status;
	private List<String> headers = new ArrayList<String>();
	private String PDOName;
	
	public String getPDOName() {
		return PDOName;
	}
	public void setPDOName(String pDOName) {
		PDOName = pDOName;
	}
	public List<String> getHeaders() {
		return headers;
	}
	public void setHeaders(List<String> headers) {
		this.headers = headers;
	}
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String addPDO() {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpSession session = req.getSession(); 
		String userName = session.getAttribute("userName").toString();
		
		try {
			String sqlcmd = "insert into pdos (PDOName,PDOTime,userName) values (?,?,?)";
			SQLManage mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, PDOName);
			mysql.setTimestamp(2, t);
			mysql.setString(3, userName);
			mysql.executeUpdate();
			String PDOTable = userName + "_" + PDOName;
			sqlcmd = "create table ? ";
			sqlcmd += "(";
			for(int i = 0;i < headers.size() - 1;i++) {
				sqlcmd += "?,";
			}
			sqlcmd += "?)";
			mysql = new SQLManage(sqlcmd);
			for(int i = 0;i < headers.size();i++) {
				mysql.setString(i+1, headers.get(i));
			}
			mysql.executeUpdate();
			status = SUCCESS;
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
