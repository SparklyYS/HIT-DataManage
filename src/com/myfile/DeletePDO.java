package com.myfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class DeletePDO extends ActionSupport implements ServletRequestAware {
	private String status;
	private String PDOName;
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

	public String deletePDO() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		try {
			HashMap<Integer, String> link = new HashMap<>();
			String sqlcmd = "select * from " + userName + "_" + PDOName;
			SQLManage mysql = new SQLManage(sqlcmd);
			ResultSet mypdo = mysql.executeQuery();
			while (mypdo.next()) {
				link.put(mypdo.getInt("eventID"), mypdo.getString("link"));
			}
			Pattern splitLink = Pattern.compile("&");
			for (int id : link.keySet()) {
				String[] links = splitLink.split(link.get(id));
				for (String s : links) {
					if(!s.equals("")) {
						String new_link = "";
						for (String t : links) {
							if (!s.equals(t)) {
								new_link += t + "&";
							}
						}
						if (!new_link.equals("")) {
							new_link = new_link.substring(0, new_link.length() - 1);
						}
						String pdoName = userName + "_" + s.substring(0, s.indexOf("_"));
						int eventID = Integer.parseInt(s.substring(s.indexOf("_") + 1));
						sqlcmd = "update " + pdoName + " set link=? where eventID=?";
						mysql = new SQLManage(sqlcmd);
						mysql.setString(1, new_link);
						mysql.setInteger(2, eventID);
						mysql.executeUpdate();
					}
				}
			}
			sqlcmd = "drop table " + userName + "_" + PDOName;
			mysql = new SQLManage(sqlcmd);
			mysql.executeUpdate();
			sqlcmd = "delete from pdos where PDOName=? and userName=?";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, PDOName);
			mysql.setString(2, userName);
			mysql.executeUpdate();
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, "删除了一个PDO："+PDOName);
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
