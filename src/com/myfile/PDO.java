package com.myfile;

import java.sql.Timestamp;

public class PDO {
	private String pdoName;
	private Timestamp t;
	private int count;

	public PDO() {
		// TODO Auto-generated constructor stub
	}

	public PDO(String pdoName, Timestamp t, int count) {
		this.pdoName = pdoName;
		this.t = t;
		this.count = count;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
