package com.myfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class DeleteEvent extends ActionSupport implements ServletRequestAware {
	private String status;
	private String PDOName;
	private int eventID;
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

	public int getEventID() {
		return eventID;
	}

	public void setEventID(int eventID) {
		this.eventID = eventID;
	}

	public String deleteEvent() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd = "select * from " + userName + "_" + PDOName + " where eventID=?";
			SQLManage mysql = new SQLManage(sqlcmd);
			mysql.setInteger(1, eventID);
			ResultSet mydata = mysql.executeQuery();
			String link = "";
			if (mydata.next()) {
				link = mydata.getString("link");
			}
			Pattern splitLink = Pattern.compile("&");
			String[] links = splitLink.split(link);
			for (String s : links) {
				String new_link = "";
				if(!s.equals("")) {
					for (String t : links) {
						if (!s.equals(t)) {
							new_link += t + "&";
						}
					}
					if (!new_link.equals("")) {
						new_link = new_link.substring(0, new_link.length() - 1);
					}
					String pdoName = userName + "_" + s.substring(0, s.indexOf("_"));
					int id = Integer.parseInt(s.substring(s.indexOf("_") + 1));
					sqlcmd = "update " + pdoName + " set link=? where eventID=?";
					mysql = new SQLManage(sqlcmd);
					mysql.setString(1, new_link);
					mysql.setInteger(2, id);
					mysql.executeUpdate();
				}
			}
			sqlcmd = "delete from " + userName + "_" + PDOName + " where eventID=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setInteger(1, eventID);
			mysql.executeUpdate();
			sqlcmd = "select * from pdos where userName=? and PDOName=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			mysql.setString(2, PDOName);
			mydata = mysql.executeQuery();
			int count = 0;
			if(mydata.next()) {
				count = mydata.getInt("counts");
			}
			sqlcmd = "update pdos set counts=? where userName=? and PDOName=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setInteger(1, count-1);
			mysql.setString(2, userName);
			mysql.setString(3, PDOName);
			mysql.executeUpdate();
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, "在PDO："+PDOName+"中删除了一个事件");
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
