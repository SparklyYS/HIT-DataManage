package com.myfile;

import java.io.File;
import java.io.FileInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sql.SQLManage;

public class ImportPDO extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private String status;
	private File excelFile;
	private String excelFileFileName;

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

	public String toFormat(Cell cell) {
		String result = "";
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_NUMERIC:
			short format = cell.getCellStyle().getDataFormat();
			SimpleDateFormat sdf = null;
			if (format == 14 || format == 31 || format == 57 || format == 58) {
				sdf = new SimpleDateFormat("yyyy-MM-dd");
				double value = cell.getNumericCellValue();
				Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
				result = sdf.format(date);
			} else if (format == 20 || format == 32) {
				sdf = new SimpleDateFormat("HH:mm");
				double value = cell.getNumericCellValue();
				Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
				result = sdf.format(date);
			} else if (format == 22){
				sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				double value = cell.getNumericCellValue();
				Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
				result = sdf.format(date);
			}
			else {
				double value = cell.getNumericCellValue();
				int tmp = (int) value;
				result = Double.toString(value);
				if (result.endsWith(".0")) {
					result = Integer.toString(tmp);
				}
			}
			break;
		case Cell.CELL_TYPE_STRING:
			result = cell.getRichStringCellValue().toString();
			break;
		case Cell.CELL_TYPE_BLANK:
			result = "";
		default:
			result = "";
			break;
		}
		return result;
	}

	public String importPDO() {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/msexcel;charset=UTF-8");
		String userName = session.getAttribute("userName").toString();
		SQLManage mysql = null;
		String sqlcmd, tag;
		ResultSet mydata = null;
		try {
			Workbook book = WorkbookFactory.create((new FileInputStream(excelFile)));
			int sheetNum = book.getNumberOfSheets();
			for (int i = 0; i < sheetNum; i++) {
				tag = "000";
				Sheet sheet = book.getSheetAt(i);
				String sheetName = sheet.getSheetName();
				sqlcmd = "select * from pdos where userName=? and PDOName=?";
				mysql = new SQLManage(sqlcmd);
				mysql.setString(1, userName);
				mysql.setString(2, sheetName);
				mydata = mysql.executeQuery();
				if (mydata.next()) {
					int count = mydata.getInt("counts");
					sqlcmd = "update pdos set counts=? where userName=? and PDOName=?";
					mysql = new SQLManage(sqlcmd);
					mysql.setInteger(1, count+sheet.getLastRowNum());
					mysql.setString(2, userName);
					mysql.setString(3, sheetName);
					mysql.executeUpdate();
					sqlcmd = "insert into " + userName + "_" + sheetName + " (";
					Row ros = sheet.getRow(0);
					int columnNum = ros.getLastCellNum();
					for (int j = 0; j < columnNum; j++) {
						sqlcmd += ros.getCell(j).getRichStringCellValue().toString() + ",";
					}
					sqlcmd += "link";
					sqlcmd += ") values (";
					String sql_copy = sqlcmd;
					for (int j = 1; j <= sheet.getLastRowNum(); j++) {
						sqlcmd = sql_copy;
						ros = sheet.getRow(j);
						for (int k = 0; k < columnNum; k++) {
							sqlcmd += "?,";
						}
						sqlcmd += "?)";
						mysql = new SQLManage(sqlcmd);
						for (int k = 0; k < columnNum; k++) {
							String result = toFormat(ros.getCell(k));
							mysql.setString(k + 1, result);
						}
						mysql.setString(columnNum + 1, "");
						mysql.executeUpdate();
					}
				} else {
					sqlcmd = "insert into pdos (PDOName,PDOTime,userName,counts,tag) values (?,?,?,?,?)";
					mysql = new SQLManage(sqlcmd);
					Timestamp t = new Timestamp(new Date().getTime());
					Row ros = sheet.getRow(0);
					int columnNum = ros.getLastCellNum();
					for (int j = 0; j < columnNum; j++) {
						switch (ros.getCell(j).getRichStringCellValue().toString()) {
						case "时间":
							tag = "1" + tag.substring(1);
							break;
						case "地点":
							tag = tag.substring(0, 1) + "1" + tag.substring(2);
							break;
						case "人物":
							tag = tag.substring(0, 2) + "1";
							break;
						default:
							;
						}
					}
					mysql.setString(1, sheetName);
					mysql.setTimestamp(2, t);
					mysql.setString(3, userName);
					mysql.setInteger(4, sheet.getLastRowNum());
					mysql.setString(5, tag);
					mysql.executeUpdate();
					sqlcmd = "create table " + userName + "_" + sheetName + " (";
					sqlcmd += "eventID int not null auto_increment,";
					for (int j = 0; j < columnNum; j++) {
						if (!ros.getCell(j).getRichStringCellValue().toString().equals("时间")
								&& !ros.getCell(j).getRichStringCellValue().toString().equals("地点")
								&& !ros.getCell(j).getRichStringCellValue().toString().equals("人物")) {
							sqlcmd += ros.getCell(j).getRichStringCellValue().toString() + " varchar(100) not null,";
						}
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
					sqlcmd += "link varchar(100) not null,primary key (eventID)) charset=utf8";
					mysql = new SQLManage(sqlcmd);
					mysql.executeUpdate();
					sqlcmd = "insert into " + userName + "_" + sheetName + " (";
					ros = sheet.getRow(0);
					for (int j = 0; j < columnNum; j++) {
						sqlcmd += ros.getCell(j).toString() + ",";
					}
					sqlcmd = sqlcmd + "link";
					sqlcmd += ") values (";
					String sql_copy = sqlcmd;
					for (int j = 1; j <= sheet.getLastRowNum(); j++) {
						sqlcmd = sql_copy;
						ros = sheet.getRow(j);
						for (int k = 0; k < columnNum; k++) {
							sqlcmd += "?,";
						}
						sqlcmd += "?)";
						mysql = new SQLManage(sqlcmd);
						for (int k = 0; k < columnNum; k++) {
							String result = toFormat(ros.getCell(k));
							mysql.setString(k + 1, result);
						}
						mysql.setString(columnNum + 1, "");
						mysql.executeUpdate();
					}
				}
			}
			sqlcmd = "insert into messages (message,messageTime,userName) values (?,?,?)";
			mysql = new SQLManage(sqlcmd);
			Timestamp t = new Timestamp(new Date().getTime());
			mysql.setString(1, "从excel文件导入PDO：" + excelFileFileName);
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
		} catch (Exception e) {
			status = ERROR;
			e.printStackTrace();
		}
		return status;
	}
}
