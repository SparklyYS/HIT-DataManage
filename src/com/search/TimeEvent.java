package com.search;

import java.util.ArrayList;

public class TimeEvent implements Comparable<TimeEvent> {
	private String PDOName;
	private ArrayList<String> headers = new ArrayList<>();
	private ArrayList<String> values = new ArrayList<>();
	private ArrayList<String> link = new ArrayList<>();
	private String year;
	private String md;
	
	

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMd() {
		return md;
	}

	public void setMd(String md) {
		this.md = md;
	}

	public ArrayList<String> getLink() {
		return link;
	}

	public void setLink(ArrayList<String> link) {
		this.link = link;
	}

	public TimeEvent(String PDOName, ArrayList<String> headers, ArrayList<String> values, ArrayList<String> link,String year,String md) {
		this.PDOName = PDOName;
		this.headers = headers;
		this.values = values;
		this.link = link;
		this.year = year;
		this.md = md;
	}

	public String getPDOName() {
		return PDOName;
	}

	public void setPDOName(String pDOName) {
		PDOName = pDOName;
	}

	public ArrayList<String> getHeaders() {
		return headers;
	}

	public void setHeaders(ArrayList<String> headers) {
		this.headers = headers;
	}

	public ArrayList<String> getValues() {
		return values;
	}

	public void setValues(ArrayList<String> values) {
		this.values = values;
	}

	public int compareTo(TimeEvent t) {
		int timeIndex1 = 0, timeIndex2 = 0;
		for (int i = 0; i < this.getHeaders().size(); i++) {
			if (this.getHeaders().get(i).equals("时间")) {
				timeIndex1 = i;
			}
		}

		for (int i = 0; i < t.getHeaders().size(); i++) {
			if (t.getHeaders().get(i).equals("时间")) {
				timeIndex2 = i;
			}
		}
		return this.getValues().get(timeIndex1).compareTo(t.getValues().get(timeIndex2));
	}

}
