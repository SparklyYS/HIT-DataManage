package com.myfile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;
public class ShowPDO extends ActionSupport implements ServletRequestAware {
	private String status;
	private List<PDO> pdos = new ArrayList<PDO>();
	private HttpServletRequest request;
	
	public HttpServletRequest getServletRequest() {
		return request;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public List<PDO> getPdos() {
		return pdos;
	}
	public void setPdos(List<PDO> pdos) {
		this.pdos = pdos;
	}
	
	public String showPDO() {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		try {
			String sqlcmd = "select * from pdos where userName=?";
			SQLManage mysql = new SQLManage(sqlcmd);
			mysql.setString(1, userName);
			ResultSet mypdo = mysql.executeQuery();
			status = SUCCESS;
			while(mypdo.next()) {
				String pdoName = mypdo.getString("PDOName");
				Timestamp t = mypdo.getTimestamp("PDOTime");
				int count = mypdo.getInt("counts");
				pdos.add(new PDO(pdoName, t,count));
			}
			mysql.close();
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
