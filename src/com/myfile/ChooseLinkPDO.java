package com.myfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class ChooseLinkPDO extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<String> choosedPDO = new ArrayList<String>();
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

	public String choose() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("application/msexcel;charset=UTF-8"); 
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd = "select * from pdos where userName=?";
			SQLManage mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			ResultSet pdos = mysql.executeQuery();
			while (pdos.next()) {
				choosedPDO.add(pdos.getString("PDOName"));
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
