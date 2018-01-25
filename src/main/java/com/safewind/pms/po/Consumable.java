package com.safewind.pms.po;

import java.util.Date;

public class Consumable {
	private int id;
	private String name;				//耗材名称
	private String code;				//耗材编号
	private String productor_name;		//供应商名称
	private String type;				//耗材类型
	private String standard_code;		//标准号
	private String standard;			//规格
	private char level;					//级别
	private int duty;					//负责人id
	private int storage;				//库存
	private int unit;					//计量单位：0，个；1，条；2，根；3，套；4，米；5，升；6，公斤；7，组；8，桶；9，罐；10，艘；11，台；12，瓶；13，箱；14，英尺；15，磅；16，其他1；17，其他2；18，其他3
	private double cost;				//单价
	private String content;				//其他说明
	private String url;					//产品图片路径
	private int is_del;					//是否删除：0，否；1，是
	private String create_id;				//创建id
	private Date create_time;			//创建时间
	private int currency;			//创建时间
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getProductor_name() {
		return productor_name;
	}
	public void setProductor_name(String productor_name) {
		this.productor_name = productor_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStandard_code() {
		return standard_code;
	}
	public void setStandard_code(String standard_code) {
		this.standard_code = standard_code;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public char getLevel() {
		return level;
	}
	public void setLevel(char level) {
		this.level = level;
	}
	public int getDuty() {
		return duty;
	}
	public void setDuty(int duty) {
		this.duty = duty;
	}
	public int getStorage() {
		return storage;
	}
	public void setStorage(int storage) {
		this.storage = storage;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIs_del() {
		return is_del;
	}
	public void setIs_del(int is_del) {
		this.is_del = is_del;
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
	public int getCurrency() {
		return currency;
	}
	public void setCurrency(int currency) {
		this.currency = currency;
	}
	@Override
	public String toString() {
		return "Consumable [id=" + id + ", name=" + name + ", code=" + code + ", productor_name=" + productor_name
				+ ", type=" + type + ", standard_code=" + standard_code + ", standard=" + standard + ", level=" + level
				+ ", duty=" + duty + ", storage=" + storage + ", unit=" + unit + ", cost=" + cost + ", content="
				+ content + ", url=" + url + ", is_del=" + is_del + ", create_id=" + create_id + ", create_time="
				+ create_time + ", currency=" + currency + ", getId()=" + getId() + ", getName()=" + getName()
				+ ", getCode()=" + getCode() + ", getProductor_name()=" + getProductor_name() + ", getType()="
				+ getType() + ", getStandard_code()=" + getStandard_code() + ", getStandard()=" + getStandard()
				+ ", getLevel()=" + getLevel() + ", getDuty()=" + getDuty() + ", getStorage()=" + getStorage()
				+ ", getUnit()=" + getUnit() + ", getCost()=" + getCost() + ", getContent()=" + getContent()
				+ ", getUrl()=" + getUrl() + ", getIs_del()=" + getIs_del() + ", getCreate_id()=" + getCreate_id()
				+ ", getCreate_time()=" + getCreate_time() + ", getCurrency()=" + getCurrency() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	

}
