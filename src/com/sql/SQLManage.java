package com.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.opensymphony.xwork2.ActionSupport;

public class SQLManage extends ActionSupport {
	private Connection con = null;
	private PreparedStatement pstmt = null;

	public SQLManage(String sqlCmd) throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/Account?characterEncoding=utf8";
		String username = "root";
		String password = "zhi";
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password);
		pstmt = con.prepareStatement(sqlCmd);
	}

	public void setString(int index, String str) throws SQLException {
		pstmt.setString(index, str);
	}

	public void setTimestamp(int index, Timestamp date) throws SQLException {
		pstmt.setTimestamp(index, date);
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
		if (con != null) {
			con.close();
		}
	}
}