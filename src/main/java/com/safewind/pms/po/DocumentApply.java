package com.safewind.pms.po;

import java.util.Date;

public class DocumentApply {
	private long id;
	private long boat_id;        //船舶id
	private String boat_name;    //船舶名称
	private int num;      	 	 //资料数量
	private String name;         //资料名字
	private String author;		 //作者名字
	private String publish; 	 //出版社名字
	private int unit;			 //计量单位
	private Date pre_date;	     //预期到达时间
	private String pre_local;    //预期到达地点
	private String create_id;    //创建者id
	private Date create_time;	 //创建时间
	private int status;			 //状态
	private String content;		 //备注
	private String content_check;//审核说明
	private String check_id;     //审核id
	private byte is_del;		 //是否删除
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getBoat_id() {
		return boat_id;
	}
	public void setBoat_id(long boat_id) {
		this.boat_id = boat_id;
	}
	public String getBoat_name() {
		return boat_name;
	}
	public void setBoat_name(String boat_name) {
		this.boat_name = boat_name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public Date getPre_date() {
		return pre_date;
	}
	public void setPre_date(Date pre_date) {
		this.pre_date = pre_date;
	}
	public String getPre_local() {
		return pre_local;
	}
	public void setPre_local(String pre_local) {
		this.pre_local = pre_local;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent_check() {
		return content_check;
	}
	public void setContent_check(String content_check) {
		this.content_check = content_check;
	}
	public String getCheck_id() {
		return check_id;
	}
	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}
	public byte getIs_del() {
		return is_del;
	}
	public void setIs_del(byte is_del) {
		this.is_del = is_del;
	}
	@Override
	public String toString() {
		return "DocumentApply [id=" + id + ", boat_id=" + boat_id + ", boat_name=" + boat_name + ", num=" + num
				+ ", name=" + name + ", author=" + author + ", publish=" + publish + ", unit=" + unit + ", pre_date="
				+ pre_date + ", pre_local=" + pre_local + ", create_id=" + create_id + ", create_time=" + create_time
				+ ", status=" + status + ", content=" + content + ", content_check=" + content_check + ", check_id="
				+ check_id + ", is_del=" + is_del + ", getId()=" + getId() + ", getBoat_id()=" + getBoat_id()
				+ ", getBoat_name()=" + getBoat_name() + ", getNum()=" + getNum() + ", getName()=" + getName()
				+ ", getAuthor()=" + getAuthor() + ", getPublish()=" + getPublish() + ", getUnit()=" + getUnit()
				+ ", getPre_date()=" + getPre_date() + ", getPre_local()=" + getPre_local() + ", getCreate_id()="
				+ getCreate_id() + ", getCreate_time()=" + getCreate_time() + ", getStatus()=" + getStatus()
				+ ", getContent()=" + getContent() + ", getContent_check()=" + getContent_check() + ", getCheck_id()="
				+ getCheck_id() + ", getIs_del()=" + getIs_del() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	

}
