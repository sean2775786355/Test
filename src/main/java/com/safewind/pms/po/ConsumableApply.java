package com.safewind.pms.po;

import java.util.Date;

public class ConsumableApply{
	private int id;
	
	private int boat_id;
	
	private int consumable_id;
	
	private int count;
	
	private Date eta;
	
	private String port;
	
	private int status;
	
	private String precheck_content;
	
	private String check_id;
	
	private String create_id;
	
	private Date create_time;
	
	private String content;
	
	private int is_del;
	
	private String boat_name;
	
	private String consumable_name;
	
	private String sailor_name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBoat_id() {
		return boat_id;
	}

	public void setBoat_id(int boat_id) {
		this.boat_id = boat_id;
	}

	public int getConsumable_id() {
		return consumable_id;
	}

	public void setConsumable_id(int consumable_id) {
		this.consumable_id = consumable_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getEta() {
		return eta;
	}

	public void setEta(Date eta) {
		this.eta = eta;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPrecheck_content() {
		return precheck_content;
	}

	public void setPrecheck_content(String precheck_content) {
		this.precheck_content = precheck_content;
	}

	public String getCheck_id() {
		return check_id;
	}

	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}

	public String getCreate_id() {
		return create_id;
	}

	public void setCreate_id(String create_id) {
		this.create_id = create_id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getIs_del() {
		return is_del;
	}

	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}

	public String getBoat_name() {
		return boat_name;
	}

	public void setBoat_name(String boat_name) {
		this.boat_name = boat_name;
	}

	public String getConsumable_name() {
		return consumable_name;
	}

	public void setConsumable_name(String consumable_name) {
		this.consumable_name = consumable_name;
	}

	public String getSailor_name() {
		return sailor_name;
	}

	public void setSailor_name(String sailor_name) {
		this.sailor_name = sailor_name;
	}

	@Override
	public String toString() {
		return "ConsumableApply [id=" + id + ", boat_id=" + boat_id + ", consumable_id=" + consumable_id + ", count="
				+ count + ", eta=" + eta + ", port=" + port + ", status=" + status + ", precheck_content="
				+ precheck_content + ", check_id=" + check_id + ", create_id=" + create_id + ", create_time="
				+ create_time + ", content=" + content + ", is_del=" + is_del + ", boat_name=" + boat_name
				+ ", consumable_name=" + consumable_name + ", sailor_name=" + sailor_name + ", getId()=" + getId()
				+ ", getBoat_id()=" + getBoat_id() + ", getConsumable_id()=" + getConsumable_id() + ", getCount()="
				+ getCount() + ", getEta()=" + getEta() + ", getPort()=" + getPort() + ", getStatus()=" + getStatus()
				+ ", getPrecheck_content()=" + getPrecheck_content() + ", getCheck_id()=" + getCheck_id()
				+ ", getCreate_id()=" + getCreate_id() + ", getCreate_time()=" + getCreate_time() + ", getContent()="
				+ getContent() + ", getIs_del()=" + getIs_del() + ", getBoat_name()=" + getBoat_name()
				+ ", getConsumable_name()=" + getConsumable_name() + ", getSailor_name()=" + getSailor_name()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
