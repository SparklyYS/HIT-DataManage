package com.myfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;
public class AddEvent extends ActionSupport implements ServletRequestAware {
	private String status;
	private ArrayList<HashMap<String, String>> events = new ArrayList<>();
	private HttpServletRequest request;
	
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public ArrayList<HashMap<String, String>> getEvents() {
		return events;
	}
	public void setEvents(ArrayList<HashMap<String, String>> events) {
		this.events = events;
	}
	
	public String addEvent() {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		HashMap<String, Integer> linkdata = new HashMap<>();
		try {
			String sqlcmd,tableName,value,PDOName;
			SQLManage mysql;
			ResultSet mydata;
			Timestamp t = new Timestamp(new Date().getTime());
			for(HashMap<String, String> event :	events) {
				PDOName = event.get("PDOName");
				tableName = userName + "_" + PDOName;
				event.remove("PDOName");
				sqlcmd = "insert into " + tableName;
				sqlcmd += "(";
				for(String header : event.keySet()) {
					sqlcmd += header + ",";
				}
				sqlcmd = sqlcmd.substring(0, sqlcmd.length()-1);
				sqlcmd += ") values (";
				for(int i = 0;i < event.size() - 1;i++) {
					sqlcmd += "?,";
				}
				sqlcmd += "?)";
				mysql = new SQLManage(sqlcmd);
				int j = 1;
				for(String header : event.keySet()) {
					value = event.get(header);
					mysql.setString(j, value);
					j++;
				}
				mysql.executeUpdate();
				sqlcmd = "select max(eventID) from " + tableName;
				mysql = new SQLManage(sqlcmd);
				mydata = mysql.executeQuery();
				if(mydata.next()) {
					linkdata.put(PDOName, mydata.getInt("eventID"));
				}
			}
			String linkformat;
			for(String pdo1 : linkdata.keySet()) {
				sqlcmd = "update " + userName + "_" + pdo1 + " set link=? where eventID=?";
				mysql = new SQLManage(sqlcmd);
				linkformat = "";
				for(String pdo2 : linkdata.keySet()) {
					if(!pdo1.equals(pdo2)) {
						linkformat = linkformat + pdo2 + "_" + linkdata.get(pdo2) + "&";
					}
				}
				linkformat = linkformat.substring(0, linkformat.length()-1);
				mysql.setString(1, linkformat);
				mysql.setInteger(2, linkdata.get(pdo1));
				mysql.executeUpdate();
			}
			linkformat = "";
			for(String pdo : linkdata.keySet()) {
				linkformat = linkformat + pdo + "_" + linkdata.get(pdo) + "&";
			}
			linkformat = linkformat.substring(0, linkformat.length()-1);
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
	        mysql = new SQLManage(sqlcmd);
	        mysql.setString(1, "add some event linked each other,they are "+linkformat);
	        mysql.setTimestamp(2, t);
	        mysql.setString(3, userName);
	        mysql.executeUpdate();
			status = SUCCESS;
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
