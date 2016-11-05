package com.account;

import java.sql.Timestamp;

public class Message {
	private String mess;
	private Timestamp t;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}
	
	public Message(String mess, Timestamp t) {
		this.mess = mess;
		this.t = t;
	}
	
	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	public Timestamp getT() {
		return t;
	}

	public void setT(Timestamp t) {
		this.t = t;
	}
	
}
