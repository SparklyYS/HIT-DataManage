package com.account;

public class Counts {
	private int pdos;
	private int events;
	
	public Counts() {
		// TODO Auto-generated constructor stub
	}
	
	public Counts(int pdos,int events) {
		this.pdos = pdos;
		this.events = events;
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
	
}
