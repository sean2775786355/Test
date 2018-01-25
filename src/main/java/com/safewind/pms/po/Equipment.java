package com.safewind.pms.po;

import java.util.Date;

public class Equipment {
     private Integer id;
     private String name;
     private String producer;
     private String type;
     private Date productTime;
     private String createId;
     private Date createTime;
     private Integer isDel;
     private Integer boatId;
     private Integer cwbtId;
     private Integer status;
     private Integer dailyHour;
     private String cwbtCode;
     private String cwbtCode4;
     private Integer eType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getProductTime() {
		return productTime;
	}
	public void setProductTime(Date productTime) {
		this.productTime = productTime;
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
	public Integer getIsDel() {
		return isDel;
	}
	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}
	public Integer getBoatId() {
		return boatId;
	}
	public void setBoatId(Integer boatId) {
		this.boatId = boatId;
	}
	public Integer getCwbtId() {
		return cwbtId;
	}
	public void setCwbtId(Integer cwbtId) {
		this.cwbtId = cwbtId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDailyHour() {
		return dailyHour;
	}
	public void setDailyHour(Integer dailyHour) {
		this.dailyHour = dailyHour;
	}
	public String getCwbtCode() {
		return cwbtCode;
	}
	public void setCwbtCode(String cwbtCode) {
		this.cwbtCode = cwbtCode;
	}
	public String getCwbtCode4() {
		return cwbtCode4;
	}
	public void setCwbtCode4(String cwbtCode4) {
		this.cwbtCode4 = cwbtCode4;
	}
	public Integer geteType() {
		return eType;
	}
	public void seteType(Integer eType) {
		this.eType = eType;
	}
	@Override
	public String toString() {
		return "Equipment [id=" + id + ", name=" + name + ", producer="
				+ producer + ", type=" + type + ", productTime=" + productTime
				+ ", createId=" + createId + ", createTime=" + createTime
				+ ", isDel=" + isDel + ", boatId=" + boatId + ", cwbtId="
				+ cwbtId + ", status=" + status + ", dailyHour=" + dailyHour
				+ ", cwbtCode=" + cwbtCode + ", cwbtCode4=" + cwbtCode4
				+ ", eType=" + eType + "]";
	}
     
}
