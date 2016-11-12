package com.myfile;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class AddPDO extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<String> headers = new ArrayList<String>();
	private String PDOName;
	private HttpServletRequest request;
	private String tag;
	private String[] dimension;
	
	
	public String[] getDimension() {
		return dimension;
	}

	public void setDimension(String[] dimension) {
		this.dimension = dimension;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

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

	public String addPDO() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/msexcel;charset=UTF-8");
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd = "insert into pdos (PDOName,PDOTime,userName,counts,tag) values (?,?,?,?,?)";
			SQLManage mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, PDOName);
			mysql.setTimestamp(2, t);
			mysql.setString(3, userName);
			mysql.setInteger(4, 0);
			mysql.setString(5, tag);
			mysql.executeUpdate();
			String PDOTable = userName + "_" + PDOName;
			sqlcmd = "create table " + PDOTable + " (";
			sqlcmd += "eventID int not null auto_increment,";
			for (String header : headers) {
				sqlcmd += header + " varchar(100) not null,";
			}
			if (tag.charAt(0) == '1') {
				sqlcmd += "时间 date not null,";
			}
			if (tag.charAt(1) == '1') {
				sqlcmd += "地点 varchar(100) not null,";
			}
			if (tag.charAt(2) == '1') {
				sqlcmd += "人物 varchar(100) not null,";
			}
			sqlcmd += "link varchar(100) not null,";
			sqlcmd += "primary key (eventID)) charset=utf8";
			mysql = new SQLManage(sqlcmd);
			mysql.executeUpdate();
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			mysql.setString(1, "添加了一个PDO：" + PDOName);
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
