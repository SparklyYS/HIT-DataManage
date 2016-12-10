package com.myfile;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class AddEvent extends ActionSupport implements ServletRequestAware {
	private String status;
	private HttpServletRequest request;
	private String data;
	
	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String addEvent() throws UnsupportedEncodingException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
//		Cookie allCookie[] = request.getCookies();
//		String data="";
//		if(allCookie != null && allCookie.length != 0) {
//			for(int i = 0; i < allCookie.length;i++) {
//				if(allCookie[i].getName().equals("data")) {
//					data = allCookie[i].getValue();
//					break;
//				}
//			}
//		}
//		String data = "饮食&开心&随便&30&2016-11-13&HIT&I/TEST&test2&HIT/Fuck&2001-1-1&2001-1-1&3&4";
		try {
			String sqlcmd, tableName, PDOName;
			Timestamp t = new Timestamp(new Date().getTime());
			ResultSet mydata;
			String[] events = data.split("\\/");
			SQLManage mysql;
			ResultSetMetaData column;
			HashMap<String, Integer> linkdata = null;
			linkdata = new HashMap<>();
			int count = 0;
			for (String event : events) {
				String[] detail = event.split("\\&");
				PDOName = detail[0];
				tableName = userName + "_" + PDOName;
				ArrayList<String> header = new ArrayList<String>();
				sqlcmd = "select * from pdos where userName=? and PDOName=?";
				mysql = new SQLManage(sqlcmd);
				mysql.setString(1, userName);
				mysql.setString(2, PDOName);
				mydata = mysql.executeQuery();
				if(mydata.next()) {
					count = mydata.getInt("counts");
				}
				sqlcmd = "select * from " + userName + "_" + PDOName;
				mysql = new SQLManage(sqlcmd);
				mydata = mysql.executeQuery();
				column = mydata.getMetaData();
				int columnCount = column.getColumnCount();
				for (int i = 2; i <= columnCount; i++) {
					header.add(column.getColumnName(i));
				}
				sqlcmd = "insert into " + tableName + " (";
				for (int i = 0; i < header.size(); i++) {
					sqlcmd += header.get(i) + ",";
				}
				sqlcmd = sqlcmd.substring(0, sqlcmd.length() - 1);
				sqlcmd += ") values (";
				for (int i = 0; i < header.size() - 1; i++) {
					sqlcmd += "?,";
				}
				sqlcmd += "?)";
				mysql = new SQLManage(sqlcmd);
				for (int i = 1; i < detail.length; i++) {
					mysql.setString(i, detail[i]);
				}
				mysql.setString(detail.length, "");
				mysql.executeUpdate();
				sqlcmd = "select max(eventID) from " + tableName;
				mysql = new SQLManage(sqlcmd);
				mydata = mysql.executeQuery();
				if (mydata.next()) {
					linkdata.put(PDOName, mydata.getInt("max(eventID)"));
				}
				sqlcmd = "update pdos set counts=? where userName=? and PDOName=?";
				mysql = new SQLManage(sqlcmd);
				mysql.setInteger(1, count+1);
				mysql.setString(2, userName);
				mysql.setString(3, PDOName);
				mysql.executeUpdate();
			}
			String linkformat;
			for (String pdo1 : linkdata.keySet()) {
				sqlcmd = "update " + userName + "_" + pdo1 + " set link=? where eventID=?";
				mysql = new SQLManage(sqlcmd);
				linkformat = "";
				for (String pdo2 : linkdata.keySet()) {
					if (!pdo1.equals(pdo2)) {
						linkformat = linkformat + pdo2 + "_" + linkdata.get(pdo2) + "&";
					}
				}
				if(!linkformat.equals("")){
					linkformat = linkformat.substring(0, linkformat.length() - 1);
				}
				mysql.setString(1, linkformat);
				mysql.setInteger(2, linkdata.get(pdo1));
				mysql.executeUpdate();
			}
			linkformat = "";
			for (String pdo : linkdata.keySet()) {
				linkformat = linkformat + pdo + ",";
			}
			linkformat = linkformat.substring(0, linkformat.length() - 1);
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, "" + "为PDO("+linkformat+")添加了事件，并且相互关联");
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
