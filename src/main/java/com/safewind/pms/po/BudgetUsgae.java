package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class BudgetUsgae {
	private int id;
	private Date useTime;
	private double count;
	private String sailorId;
	private String createId;
	private Date createTime;
	private int boatId;
	private int year;
	private int is_del;
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getUseTime() {
		return useTime;
	}
	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = count;
	}
	public String getSailorId() {
		return sailorId;
	}
	public void setSailorId(String sailorId) {
		this.sailorId = sailorId;
	}
	public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createId) {
		this.createId = createId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public int getIs_del() {
		return is_del;
	}
	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}
	@Override
	public String toString() {
		return "BudgetUsgae [id=" + id + ", useTime=" + useTime + ", count="
				+ count + ", sailorId=" + sailorId + ", createId=" + createId
				+ ", createTime=" + createTime + ", boatId=" + boatId
				+ ", year=" + year + ", is_del=" + is_del 
				+ ", content=" + content + "]";
	}
	
	
}
