package com.myfile;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String addEvent() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		String pass = request.getParameter("data");
		try {
			String sqlcmd, tableName, value, PDOName;
			Timestamp t = new Timestamp(new Date().getTime());
			ResultSet mydata;
			String[] events = pass.split("\\/");
			SQLManage mysql;
			ResultSetMetaData column;
			HashMap<String, Integer> linkdata = null;
			for (String event : events) {
				linkdata = new HashMap<>();
				String[] data = event.split("\\&");
				PDOName = data[0];
				tableName = userName + "_" + PDOName;
				ArrayList<String> header = new ArrayList<String>();
				sqlcmd = "select * from " + userName + "_" + PDOName;
				mysql = new SQLManage(sqlcmd);
				mydata = mysql.executeQuery();
				column = mydata.getMetaData();
				int columnCount = column.getColumnCount();
				for (int i = 1; i <= columnCount; i++) {
					header.add(column.getColumnName(i));
				}
				sqlcmd = "insert into " + tableName + " (";
				for (int i = 1; i < header.size() - 1; i++) {
					sqlcmd += header.get(i) + ",";
				}
				sqlcmd = sqlcmd.substring(0, sqlcmd.length() - 1);
				sqlcmd += ") values (";
				for (int i = 1; i < data.length - 1; i++) {
					sqlcmd += "?,";
				}
				sqlcmd += "?)";
				mysql = new SQLManage(sqlcmd);
				for (int i = 1; i < data.length; i++) {
					mysql.setString(i, data[i]);
				}
				mysql.executeUpdate();
				sqlcmd = "select max(eventID) from " + tableName;
				mysql = new SQLManage(sqlcmd);
				mydata = mysql.executeQuery();
				if (mydata.next()) {
					linkdata.put(PDOName, mydata.getInt("eventID"));
				}
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
				linkformat = linkformat.substring(0, linkformat.length() - 1);
				mysql.setString(1, linkformat);
				mysql.setInteger(2, linkdata.get(pdo1));
				mysql.executeUpdate();
			}
			linkformat = "";
			for (String pdo : linkdata.keySet()) {
				linkformat = linkformat + pdo + "_" + linkdata.get(pdo) + "&";
			}
			linkformat = linkformat.substring(0, linkformat.length() - 1);
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, "" + linkformat);
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
