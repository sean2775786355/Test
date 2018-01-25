package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Supplier {

	private int id;
	
	private String supplierName;
	
	private String principal;
	
	private String email;
	
	private String companyPhone;
	
	private String fax;
	
	private String companyType;
	
	private String linkmanName;
	
	private String linkmanMobliePhone;
	
	private String content;
	
	private String badContent;
	
	private int createId;
	
	private Date createTime;
	
	private int is_del;

	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getSupplierName() {
		return supplierName;
	}



	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}



	public String getPrincipal() {
		return principal;
	}



	public void setPrincipal(String principal) {
		this.principal = principal;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getCompanyPhone() {
		return companyPhone;
	}



	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}



	public String getFax() {
		return fax;
	}



	public void setFax(String fax) {
		this.fax = fax;
	}



	public String getCompanyType() {
		return companyType;
	}



	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}



	public String getLinkmanName() {
		return linkmanName;
	}



	public void setLinkmanName(String linkmanName) {
		this.linkmanName = linkmanName;
	}



	public String getLinkmanMobliePhone() {
		return linkmanMobliePhone;
	}



	public void setLinkmanMobliePhone(String linkmanMobliePhone) {
		this.linkmanMobliePhone = linkmanMobliePhone;
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
		return "Supplier [id=" + id + ", supplierName=" + supplierName
				+ ", principal=" + principal + ", email=" + email
				+ ", companyPhone=" + companyPhone + ", fax=" + fax
				+ ", companyType=" + companyType + ", linkmanName="
				+ linkmanName + ", linkmanMobliePhone=" + linkmanMobliePhone
				+ ", content=" + content + ", badContent=" + badContent
				+ ", createId=" + createId + ", createTime=" + createTime
				+ ", is_del=" + is_del + "]";
	}
	
	
}
