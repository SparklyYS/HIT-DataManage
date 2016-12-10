package com.myfile;

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

public class ShowHeader extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<String> choosedPDO = new ArrayList<String>();
	private HashMap<String, ArrayList<String>> pdoHeaders = new HashMap<>();
	private HttpServletRequest request;

	public List<String> getChoosedPDO() {
		return choosedPDO;
	}

	public void setChoosedPDO(List<String> choosedPDO) {
		this.choosedPDO = choosedPDO;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HashMap<String, ArrayList<String>> getPdoHeaders() {
		return pdoHeaders;
	}

	public void setPdoHeaders(HashMap<String, ArrayList<String>> pdoHeaders) {
		this.pdoHeaders = pdoHeaders;
	}

	public String showHeader() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd;
			SQLManage mysql;
			ResultSet mydata;
			ResultSetMetaData column;
			int columnCount;
			ArrayList<String> tmp;
			for (String pdoName : choosedPDO) {
				tmp = new ArrayList<String>();
				sqlcmd = "select * from " + userName + "_" + pdoName;
				mysql = new SQLManage(sqlcmd);
				mydata = mysql.executeQuery();
				column = mydata.getMetaData();
				columnCount = column.getColumnCount();
				for (int i = 2; i < columnCount; i++) {
					tmp.add(column.getColumnName(i));
				}
				pdoHeaders.put(pdoName, tmp);
				mysql.close();
			}
			status = SUCCESS;
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
