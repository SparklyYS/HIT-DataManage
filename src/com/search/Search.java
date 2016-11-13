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

public class Search extends ActionSupport implements ServletRequestAware {
	private String status;
	private HttpServletRequest request;
//	private String choice;
	private ArrayList<HashMap<String, String>> results = new ArrayList<>();
	
	public ArrayList<HashMap<String, String>> getResults() {
		return results;
	}

	public void setResults(ArrayList<HashMap<String, String>> results) {
		this.results = results;
	}

//	public String getChoice() {
//		return choice;
//	}
//
//	public void setChoice(String choice) {
//		this.choice = choice;
//	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public boolean belongTo(String s1, String s2) {
		boolean judge = true;
		for(int i = 0;i < s1.length();i++) {
			if(s1.charAt(i) == '1') {
				if(s2.charAt(i) != '1') {
					judge = false;
					break;
				}
			}
		}
		return judge;
	}
	
	public String searchResult() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		//前台编码格式为111/*&*/*/*
		String choice = "101/as&1/ /哈工大";
		try {
			String sqlcmd;
			SQLManage mysql;
			ResultSet mydata;
			ResultSetMetaData column;
			int columnCount;
			String[] parse = choice.split("\\/");
			HashMap<String , String> pdos = new HashMap<>();
			sqlcmd="select * from pdos where userName=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			mydata = mysql.executeQuery();
			while(mydata.next()) {
				pdos.put(mydata.getString("PDOName"), mydata.getString("tag"));
			}
			
			//开始遍历各个pdo
			for(String PDOName : pdos.keySet()) {
				if(belongTo(parse[0], pdos.get(PDOName))) {
					HashMap<String, String> tmp = new HashMap<>();
					tmp.put("PDOName", PDOName);
					sqlcmd = "select * from " + userName+"_"+PDOName;
					if(choice.charAt(1) == '1') {
						sqlcmd = " 地点=?";
						if(choice.charAt(2) == '1') {
							sqlcmd = " and 人物=?";
						}
					}
					else if(choice.charAt(2) == '1') {
						sqlcmd = " 人物=?";
					}
					mysql = new SQLManage(sqlcmd);
					for(int i = 2;i < parse.length; i++) {
						if(choice.charAt(i-1) == '1') {
							mysql.setString(i-1, parse[i]);
						}
					}
					mydata = mysql.executeQuery();
					column = mydata.getMetaData();
					columnCount = column.getColumnCount();
					List<String> headers = new ArrayList<>();
					for (int i = 2; i <= columnCount; i++) {
						headers.add(column.getColumnName(i));
					}
					while(mydata.next()) {
						for(String head : headers) {
							tmp.put(head, mydata.getString(head));
						}
					}
					results.add(tmp);
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
