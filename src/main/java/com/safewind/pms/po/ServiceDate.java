package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

import java.util.Date;
@Repository
public class ServiceDate {

	private int id;

	private int equipmentId;

	private int bcrId;

	private Date finishTime;

	private String didId;

	private String checkId;

	private Byte checkStatus;

	private Byte isBand;

	private Byte isDel;

	private Byte isDone;

	private String content;

	private Date didTime;

	private Date checkTime;

	private Byte dateType;

	private Byte checkType;

	private Byte status;

	private String serviceLevel;

	private String serviceContent;

	private String shoreId;

	private int boatId;

	private Date shoreTime;

	private Date estimatedTime;

	private String shoreContent;

	private int preId;

	private Byte type;

	private String checkContent;

	private Byte eType;

	private String bandContent;

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder("ServiceDate{");
		sb.append("id=").append(id);
		sb.append(", equipmentId='").append(equipmentId).append('\'');
		sb.append(", bcrId='").append(bcrId).append('\'');
		sb.append(", finishTime='").append(finishTime).append('\'');
		sb.append(", didId='").append(didId).append('\'');
		sb.append(", checkId='").append(checkId).append('\'');
		sb.append(", checkStatus='").append(checkStatus).append('\'');
		sb.append(", isBand='").append(isBand).append('\'');
		sb.append(", isDel='").append(isDel).append('\'');
		sb.append(", isDone=").append(isDone).append('\'');
		sb.append(", content=").append(content).append('\'');
		sb.append(", didTime=").append(didTime).append('\'');
		sb.append(", checkTime=").append(checkTime).append('\'');
		sb.append(", dateType=").append(dateType).append('\'');
		sb.append(", checkType=").append(checkType).append('\'');
		sb.append(", status=").append(status).append('\'');
		sb.append(", serviceLevel=").append(serviceLevel).append('\'');
		sb.append(", serviceContent=").append(serviceContent).append('\'');
		sb.append(", shoreId=").append(shoreId).append('\'');
		sb.append(", boatId=").append(boatId).append('\'');
		sb.append(", shoreTime=").append(shoreTime).append('\'');
		sb.append(", estimatedTime=").append(estimatedTime).append('\'');
		sb.append(", shoreContent=").append(shoreContent).append('\'');
		sb.append(", preId=").append(preId).append('\'');
		sb.append(", type=").append(type).append('\'');
		sb.append(", checkContent=").append(checkContent).append('\'');
		sb.append(", eType=").append(eType).append('\'');
		sb.append(", bandContent=").append(bandContent).append('\'');
		sb.append('}');
		return sb.toString();
	}



	public String getCheckContent() {
		return checkContent;
	}

	public void setCheckContent(String checkContent) {
		this.checkContent = checkContent;
	}

	public String getBandContent() {
		return bandContent;
	}

	public void setBandContent(String bandContent) {
		this.bandContent = bandContent;
	}

	public String getShoreContent() {
		return shoreContent;
	}

	public void setShoreContent(String shoreContent) {
		this.shoreContent = shoreContent;
	}

	public String getServiceContent() {
		return serviceContent;
	}

	public void setServiceContent(String serviceContent) {
		this.serviceContent = serviceContent;
	}

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

	public int getEquipmentId() {
		return equipmentId;
	}

	public void setEquipmentId(int equipmentId) {
		this.equipmentId = equipmentId;
	}

	public int getBcrId() {
		return bcrId;
	}

	public void setBcrId(int bcrId) {
		this.bcrId = bcrId;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public String getDidId() {
		return didId;
	}

	public void setDidId(String didId) {
		this.didId = didId;
	}

	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

	public Byte getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Byte checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Byte getIsBand() {
		return isBand;
	}

	public void setIsBand(Byte isBand) {
		this.isBand = isBand;
	}

	public Byte getIsDel() {
		return isDel;
	}

	public void setIsDel(Byte isDel) {
		this.isDel = isDel;
	}

	public Byte getIsDone() {
		return isDone;
	}

	public void setIsDone(Byte isDone) {
		this.isDone = isDone;
	}

	public Date getDidTime() {
		return didTime;
	}

	public void setDidTime(Date didTime) {
		this.didTime = didTime;
	}

	public Date getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	public Byte getDateType() {
		return dateType;
	}

	public void setDateType(Byte dateType) {
		this.dateType = dateType;
	}

	public Byte getCheckType() {
		return checkType;
	}

	public void setCheckType(Byte checkType) {
		this.checkType = checkType;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public String getServiceLevel() {
		return serviceLevel;
	}

	public void setServiceLevel(String serviceLevel) {
		this.serviceLevel = serviceLevel == null ? null : serviceLevel.trim();
	}

	public String getShoreId() {
		return shoreId;
	}

	public void setShoreId(String shoreId) {
		this.shoreId = shoreId;
	}

	public int getBoatId() {
		return boatId;
	}

	public void setBoatId(int boatId) {
		this.boatId = boatId;
	}

	public Date getShoreTime() {
		return shoreTime;
	}

	public void setShoreTime(Date shoreTime) {
		this.shoreTime = shoreTime;
	}

	public Date getEstimatedTime() {
		return estimatedTime;
	}

	public void setEstimatedTime(Date estimatedTime) {
		this.estimatedTime = estimatedTime;
	}

	public int getPreId() {
		return preId;
	}

	public void setPreId(int preId) {
		this.preId = preId;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Byte geteType() {
		return eType;
	}

	public void seteType(Byte eType) {
		this.eType = eType;
	}
	

}
