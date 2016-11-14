package com.search;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.mysql.fabric.xmlrpc.base.Array;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class Search extends ActionSupport implements ServletRequestAware {
	private String status;
	private HttpServletRequest request;
	private String choice;
	private ArrayList<TimeEvent> results = new ArrayList<>();

	public ArrayList<TimeEvent> getResults() {
		return results;
	}

	public void setResults(ArrayList<TimeEvent> results) {
		this.results = results;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public boolean belongTo(String s1, String s2) {
		boolean judge = true;
		for (int i = 0; i < s1.length(); i++) {
			if (s1.charAt(i) == '1') {
				if (s2.charAt(i) != '1') {
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
		// 前台编码格式为111/*&*/*/*
		try {
			String sqlcmd;
			SQLManage mysql;
			ResultSet mydata;
			ResultSetMetaData column;
			int columnCount;
			String[] parse = choice.split("\\/");
			HashMap<String, String> pdos = new HashMap<>();
			sqlcmd = "select * from pdos where userName=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			mydata = mysql.executeQuery();
			while (mydata.next()) {
				pdos.put(mydata.getString("PDOName"), mydata.getString("tag"));
			}
			// 开始遍历各个pdo
			for (String PDOName : pdos.keySet()) {
				if (belongTo(parse[0], pdos.get(PDOName))) {
					ArrayList<String> value = new ArrayList<>();
					ArrayList<String> head = new ArrayList<>();
					ArrayList<String> link = new ArrayList<>();
					sqlcmd = "select * from " + userName + "_" + PDOName;
					if (choice.charAt(1) == '1') {
						sqlcmd += " where 地点=?";
						if (choice.charAt(2) == '1') {
							sqlcmd += " and 人物=?";
						}
					} else if (choice.charAt(2) == '1') {
						sqlcmd += " where 人物=?";
					}
					mysql = new SQLManage(sqlcmd);
					if (choice.charAt(1) == '1') {
						mysql.setString(1, parse[2]);
						if (choice.charAt(2) == '1') {
							mysql.setString(2, parse[3]);
						}
					} else if (choice.charAt(2) == '1') {
						mysql.setString(1, parse[3]);
					}
					mydata = mysql.executeQuery();
					column = mydata.getMetaData();
					columnCount = column.getColumnCount();
					for (int i = 2; i < columnCount; i++) {
						head.add(column.getColumnName(i));
					}
					while (mydata.next()) {
						if (choice.charAt(0) == '1') {
							String[] times = parse[1].split("\\&");
							String time = mydata.getString("时间");
							if (time.compareTo(times[0]) >= 0 && time.compareTo(times[1]) <= 0) {
								for (String h : head) {
									value.add(mydata.getString(h));
								}
								String[] l = mydata.getString("link").split("\\&");
								for (int i = 0; i < l.length; i++) {
									link.add(l[i]);
								}
							}
						} else {
							for (String h : head) {
								value.add(mydata.getString(h));
							}
							String[] l = mydata.getString("link").split("\\&");
							for (int i = 0; i < l.length; i++) {
								link.add(l[i]);
							}
						}
						if (!value.isEmpty()) {
							results.add(new TimeEvent(PDOName, head, value,link));
						}
					}
				}
			}
			if(choice.charAt(0) == '1') {
				Collections.sort(results);
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
