package com.safewind.pms.po;

public class Level {
	private int id;
	
	private char level;
	
	private int min_lack_date;
	
	private int max_Lack_date;
	
	private int date;
	
	private int hour;
	
	private int min_lack_hour;
	
	private int max_lack_hour;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public char getLevel() {
		return level;
	}

	public void setLevel(char level) {
		this.level = level;
	}

	public int getMin_lack_date() {
		return min_lack_date;
	}

	public void setMin_lack_date(int min_lack_date) {
		this.min_lack_date = min_lack_date;
	}

	public int getMax_Lack_date() {
		return max_Lack_date;
	}

	public void setMax_Lack_date(int max_Lack_date) {
		this.max_Lack_date = max_Lack_date;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMin_lack_hour() {
		return min_lack_hour;
	}

	public void setMin_lack_hour(int min_lack_hour) {
		this.min_lack_hour = min_lack_hour;
	}

	public int getMax_lack_hour() {
		return max_lack_hour;
	}

	public void setMax_lack_hour(int max_lack_hour) {
		this.max_lack_hour = max_lack_hour;
	}

	@Override
	public String toString() {
		return "Level [id=" + id + ", level=" + level + ", min_lack_date="
				+ min_lack_date + ", max_Lack_date=" + max_Lack_date
				+ ", date=" + date + ", hour=" + hour + ", min_lack_hour="
				+ min_lack_hour + ", max_lack_hour=" + max_lack_hour
				+ ", getId()=" + getId() + ", getLevel()=" + getLevel()
				+ ", getMin_lack_date()=" + getMin_lack_date()
				+ ", getMax_Lack_date()=" + getMax_Lack_date() + ", getDate()="
				+ getDate() + ", getHour()=" + getHour()
				+ ", getMin_lack_hour()=" + getMin_lack_hour()
				+ ", getMax_lack_hour()=" + getMax_lack_hour()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	

}
