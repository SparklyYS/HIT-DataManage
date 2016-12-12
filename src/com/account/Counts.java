package com.account;

public class Counts {
	private int pdos;
	private int events;
	private int messages;
	
	public Counts() {
		// TODO Auto-generated constructor stub
	}
	
	public Counts(int pdos,int events,int messages) {
		this.pdos = pdos;
		this.events = events;
		this.messages = messages;
	}

	public int getPdos() {
		return pdos;
	}

	public void setPdos(int pdos) {
		this.pdos = pdos;
	}

	public int getEvents() {
		return events;
	}

	public void setEvents(int events) {
		this.events = events;
	}

	public int getMessages() {
		return messages;
	}

	public void setMessages(int messages) {
		this.messages = messages;
	}
	
}
