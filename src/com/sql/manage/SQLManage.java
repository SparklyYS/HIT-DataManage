package com.sql.manage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

public class SQLManage extends ActionSupport{
	private Connection con;
	private PreparedStatement pstmt;
	
	public SQLManage(String sqlCmd) throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/BookDB";
		String username = "root";
		String password = "******";
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password);
		pstmt = con.prepareStatement(sqlCmd);
	}
	
	public void setString(int index, String str) throws SQLException {
		pstmt.setString(index, str);
	}
	
	public void setDate(int index, Date date) throws SQLException {
		pstmt.setDate(index, date);
	}
	
	public void setDouble(int index, double d) throws SQLException {
		pstmt.setDouble(index, d);
	}
	
	public void setInteger(int index, int i) throws SQLException {
		pstmt.setInt(index, i);
	}
	
	public ResultSet executeQuery() throws SQLException {
		return pstmt.executeQuery();
	}
	
	public void executeUpdate() throws SQLException {
		pstmt.executeUpdate();
	}
	
	public void close() throws SQLException {
		if(con != null) {
			con.close();
		}
	}
}
