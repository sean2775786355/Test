package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Budget {
	
	private int id;
	
	private int boatId;
	
	private int year;
	
	private double totaled;
	
	private double remained;
	
	private String content;
	
	private int createId;
	
	private Date createTime;
	
	private int is_del;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBoatId() {
		return boatId;
	}

	public void setBoatId(int boatId) {
		this.boatId = boatId;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public double getTotaled() {
		return totaled;
	}

	public void setTotaled(double totaled) {
		this.totaled = totaled;
	}

	public double getRemained() {
		return remained;
	}

	public void setRemained(double remained) {
		this.remained = remained;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCreateId() {
		return createId;
	}

	public void setCreateId(int createId) {
		this.createId = createId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getIs_del() {
		return is_del;
	}

	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}

	@Override
	public String toString() {
		return "Budget [id=" + id + ", boatId=" + boatId + ", year=" + year
				+ ", totaled=" + totaled + ", remained=" + remained
				+ ", content=" + content + ", createId=" + createId
				+ ", createTime=" + createTime + ", is_del=" + is_del + "]";
	}
	
	
}
