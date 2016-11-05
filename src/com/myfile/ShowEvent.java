package com.myfile;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;
public class ShowEvent extends ActionSupport implements ServletRequestAware {
	private String status;
	private String PDOName;
	private List<String> headers = new ArrayList<String>();
	private List<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
	private HttpServletRequest request;
	
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
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
	public List<ArrayList<String>> getData() {
		return data;
	}
	public void setData(List<ArrayList<String>> data) {
		this.data = data;
	}
	
	public String showEvent() {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		try {
			String pdoName = userName + "_" + PDOName;
			String sqlcmd = "select * from " + pdoName;
			SQLManage mysql = new SQLManage(sqlcmd);
			ResultSet myevent = mysql.executeQuery();
			ResultSetMetaData column = myevent.getMetaData();
			int columnCount = column.getColumnCount(); 
			for(int i = 1;i <= columnCount;i++) {
				headers.add(column.getColumnName(i));
			}
			while(myevent.next()) {
				ArrayList<String> single = new ArrayList<String>();
				for(int i = 1;i <= columnCount;i++) {
					single.add(myevent.getString(i));
				}
				data.add(single);
			}
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
