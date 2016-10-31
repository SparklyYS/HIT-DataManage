package com.myfile;

import java.sql.Timestamp;

public class PDO {
	private String pdoName;
	private Timestamp t;
	
	public PDO() {
		// TODO Auto-generated constructor stub
	}
	
	public PDO(String pdoName,Timestamp t) {
		this.pdoName = pdoName;
		this.t = t;
	}
	
	public String getPdoName() {
		return pdoName;
	}
	
	public void setPdoName(String pdoName) {
		this.pdoName = pdoName;
	}
	
	public Timestamp getT() {
		return t;
	}
	
	public void setT(Timestamp t) {
		this.t = t;
	}
}
