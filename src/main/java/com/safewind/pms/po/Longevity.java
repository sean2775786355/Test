package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Longevity {
	private Long id;			//主键ID
	
	private String sailor_id;	//海员编号（对应hh_sailor表中的sailor_id）
	
	private int belong;			//船舶所属：0.本公司船舶，1.其他船舶
	
	private int duty;			//职务：0.水手；1.船长；2.大副；3.二副；4.三副；5.水手长；6.轮机长；7.大管轮；8.二管轮；9.三管轮；10.机工；11.机匠；12.实习生；13.大厨；14.二厨；15.电机员；16.船医；17.政委；18.铜匠；19.木匠；80.其他1；81.其他2；82.其他3；83.岸基管理员；99.面试生
	
	private Date onboard_time;	//上船时间
	
	private Date ashore_time;	//下船时间
	
	private int boat_id;		//boat表id
	
	private String boat_name;	//船舶名称
	
	private String boat_IMO;	//船舶IMO代码
	
	private int boat_type;		//船舶类型
	
	private int tonnage;		//吨位（吨）

	private int horsepower;		//主机马力
	
	private String model;		//主机型号
	
	private String company;		//船舶公司
	
	private int create_id;		//创建ID
	
	private int create_time;	//创建时间
	
	private String content;		//说明
	
	private String lane;		//航线

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSailor_id() {
		return sailor_id;
	}

	public void setSailor_id(String sailor_id) {
		this.sailor_id = sailor_id;
	}

	
	public int getBelong() {
		return belong;
	}

	public void setBelong(int belong) {
		this.belong = belong;
	}

	public int getDuty() {
		return duty;
	}

	public void setDuty(int duty) {
		this.duty = duty;
	}

	

	public Date getOnboard_time() {
		return onboard_time;
	}

	public void setOnboard_time(Date onboard_time) {
		this.onboard_time = onboard_time;
	}

	public Date getAshore_time() {
		return ashore_time;
	}

	public void setAshore_time(Date ashore_time) {
		this.ashore_time = ashore_time;
	}

	public int getBoat_id() {
		return boat_id;
	}

	public void setBoat_id(int boat_id) {
		this.boat_id = boat_id;
	}

	public String getBoat_name() {
		return boat_name;
	}

	public void setBoat_name(String boat_name) {
		this.boat_name = boat_name;
	}

	public String getBoat_IMO() {
		return boat_IMO;
	}

	public void setBoat_IMO(String boat_IMO) {
		this.boat_IMO = boat_IMO;
	}

	public int getBoat_type() {
		return boat_type;
	}

	public void setBoat_type(int boat_type) {
		this.boat_type = boat_type;
	}

	public int getTonnage() {
		return tonnage;
	}

	public void setTonnage(int tonnage) {
		this.tonnage = tonnage;
	}

	public int getHorsepower() {
		return horsepower;
	}

	public void setHorsepower(int horsepower) {
		this.horsepower = horsepower;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getCreate_id() {
		return create_id;
	}

	public void setCreate_id(int create_id) {
		this.create_id = create_id;
	}

	public int getCreate_time() {
		return create_time;
	}

	public void setCreate_time(int create_time) {
		this.create_time = create_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLane() {
		return lane;
	}

	public void setLane(String lane) {
		this.lane = lane;
	}

	@Override
	public String toString() {
		return "Longevity [id=" + id + ", sailor_id=" + sailor_id + ", belong="
				+ belong + ", duty=" + duty + ", onboard_time=" + onboard_time
				+ ", ashore_time=" + ashore_time + ", boat_id=" + boat_id
				+ ", boat_name=" + boat_name + ", boat_IMO=" + boat_IMO
				+ ", boat_type=" + boat_type + ", tonnage=" + tonnage
				+ ", horsepower=" + horsepower + ", model=" + model
				+ ", company=" + company + ", create_id=" + create_id
				+ ", create_time=" + create_time + ", content=" + content
				+ ", lane=" + lane + "]";
	}

	
	
}
