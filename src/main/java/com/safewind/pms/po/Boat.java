package com.safewind.pms.po;

import java.util.Date;

public class Boat {
	private Integer id;
	private String name;
	private String eName;
	private String imo;
	private Date createTime;
	private Integer createId;
	private Integer isDel;
	private Integer status;
	private Integer type;
	private Integer tonnage;
	private Integer horsepower;
	private String model;
	private String callName;
	private String country;
	private String lane;

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public Integer getIsDel() {
		return isDel;
	}

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

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getImo() {
		return imo;
	}

	public void setImo(String imo) {
		this.imo = imo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getCreateId() {
		return createId;
	}

	public void setCreateId(Integer createId) {
		this.createId = createId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getTonnage() {
		return tonnage;
	}

	public void setTonnage(Integer tonnage) {
		this.tonnage = tonnage;
	}

	public Integer getHorsepower() {
		return horsepower;
	}

	public void setHorsepower(Integer horsepower) {
		this.horsepower = horsepower;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCallName() {
		return callName;
	}

	public void setCallName(String callName) {
		this.callName = callName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getLane() {
		return lane;
	}

	public void setLane(String lane) {
		this.lane = lane;
	}

	@Override
	public String toString() {
		return "Boat [id=" + id + ", name=" + name + ", eName=" + eName
				+ ", imo=" + imo + ", createTime=" + createTime + ", createId="
				+ createId + ", isDel=" + isDel + ", status=" + status
				+ ", type=" + type + ", tonnage=" + tonnage + ", horsepower="
				+ horsepower + ", model=" + model + ", callName=" + callName
				+ ", country=" + country + ", lane=" + lane + "]";
	}

}
