package com.myfile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class ImportPDO extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private String status;
	private File excelFile; // 涓婁紶鐨勬枃浠�
	private String excelFileFileName; // 淇濆瓨鍘熷鏂囦欢鍚�

	public File getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(File excelFile) {
		this.excelFile = excelFile;
	}

	public String getExcelFileFileName() {
		return excelFileFileName;
	}

	public void setExcelFileFileName(String excelFileFileName) {
		this.excelFileFileName = excelFileFileName;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String importPDO() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String userName = session.getAttribute("userName").toString();
		SQLManage mysql = null;
		String sqlcmd;
		ResultSet mydata = null;
		try {
			Workbook book = WorkbookFactory.create((new FileInputStream(excelFile)));
			int sheetNum = book.getNumberOfSheets();
			for (int i = 0; i < sheetNum; i++) {
				Sheet sheet = book.getSheetAt(i);
				String sheetName = sheet.getSheetName();
				sqlcmd = "select * from pdos where userName=? and PDOName=?";
				mysql = new SQLManage(sqlcmd);
				mysql.setString(1, userName);
				mysql.setString(2, sheetName);
				mydata = mysql.executeQuery();
				if (mydata.next()) {
					sqlcmd = "insert into " + userName + "_" + sheetName + " (";
					Row ros = sheet.getRow(0);
					for (int j = 0; j < ros.getLastCellNum(); j++) {
						sqlcmd += ros.getCell(j).toString() + ",";
					}
					sqlcmd+="link";
					sqlcmd += ") values (";
					String sql_copy = sqlcmd;
					for (int j = 1; j <= sheet.getLastRowNum(); j++) {
						sqlcmd = sql_copy;
						ros = sheet.getRow(j);
						for (int k = 0; k < ros.getLastCellNum(); k++) {
							sqlcmd += "?,";
						}
						sqlcmd += "?)";
						mysql = new SQLManage(sqlcmd);
						for (int k = 0; k < ros.getLastCellNum(); k++) {
							mysql.setString(k+1, ros.getCell(k).toString());
						}
						mysql.setString(ros.getLastCellNum()+1, "");
						mysql.executeUpdate();
					}
				} else {
					sqlcmd = "insert into pdos (PDOName,PDOTime,userName,counts) values (?,?,?,?)";
					mysql = new SQLManage(sqlcmd);
					Timestamp t = new Timestamp(new Date().getTime());
					mysql.setString(1, sheetName);
					mysql.setTimestamp(2, t);
					mysql.setString(3, userName);
					mysql.setInteger(4, 0);
					mysql.executeUpdate();
					sqlcmd = "create table " + userName + "_" + sheetName + " (";
					sqlcmd += "eventID int not null auto_increment,";
					Row ros = sheet.getRow(0);
					for (int j = 0; j < ros.getLastCellNum(); j++) {
						sqlcmd += ros.getCell(j).toString() + " varchar(100) not null,";
					}
					sqlcmd += "link varchar(100) not null,primary key (eventID))";
					mysql = new SQLManage(sqlcmd);
					mysql.executeUpdate();
					sqlcmd = "insert into " + userName + "_" + sheetName + " (";
					ros = sheet.getRow(0);
					for (int j = 0; j < ros.getLastCellNum(); j++) {
						sqlcmd += ros.getCell(j).toString() + ",";
					}
					sqlcmd = sqlcmd + "link";
					sqlcmd += ") values (";
					String sql_copy = sqlcmd;
					for (int j = 1; j <= sheet.getLastRowNum(); j++) {
						sqlcmd = sql_copy;
						ros = sheet.getRow(j);
						for (int k = 0; k < ros.getLastCellNum(); k++) {
							sqlcmd += "?,";
						}
						sqlcmd += "?)";
						mysql = new SQLManage(sqlcmd);
						for (int k = 0; k < ros.getLastCellNum(); k++) {
							mysql.setString(k+1, ros.getCell(k).toString());
						}
						mysql.setString(ros.getLastCellNum()+1, "");
						mysql.executeUpdate();
					}
				}
			} 
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, "瀵煎叆浜唀xcel鏂囦欢锛�"+excelFileFileName);
			mysql.setTimestamp(2, t);
			mysql.setString(3, userName);
			mysql.executeUpdate();
			status = SUCCESS;
			book.close();
			mysql.close();
		} catch (ClassNotFoundException e) {
			status = ERROR;
			e.printStackTrace();
		} catch (SQLException e) {
			status = ERROR;
			e.printStackTrace();
		} catch (Exception e) {
			status = ERROR;
			e.printStackTrace();
		}
		return status;
	}
}
