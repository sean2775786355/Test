package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class RepairFactory {
	
	private int id;
	
	private String name;		//维修厂名称
	
	private String linkman;		//联系人姓名
	
	private int fax;			//维修厂传真
	
	private String phone;		//联系电话
	
	private String mobilePhone;	//移动电话
	
	private String email;		//维修厂邮箱
	
	private String location;	//维修厂地址
	
	private String content;		//维修厂说明
	
	private String badContent;	//污点记录
	
	private int createId;		//创建者id
	
	private Date createTime;	//创建时间
	
	private int is_del;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public int getFax() {
		return fax;
	}

	public void setFax(int fax) {
		this.fax = fax;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBadContent() {
		return badContent;
	}

	public void setBadContent(String badContent) {
		this.badContent = badContent;
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
		return "RepairFactory [id=" + id + ", name=" + name + ", linkman="
				+ linkman + ", fax=" + fax + ", phone=" + phone
				+ ", mobilePhone=" + mobilePhone + ", email=" + email
				+ ", location=" + location + ", content=" + content
				+ ", badContent=" + badContent + ", createId=" + createId
				+ ", createTime=" + createTime + ", is_del=" + is_del + "]";
	}
	
	
}
