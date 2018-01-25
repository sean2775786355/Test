package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Certificate {
	
	private Long id;			//主键id
	
	private String sailor_id;	//人员编号（对应hh_sailor表中的sailor_id）
	
	private String name;		//证书名称
	
	private int num;			//证书编号
	
	private int level;			//证书等级：0.甲级；1.乙级；2.丙级；3.丁级
	
	private int duty;			//职务：0，水手；1，船长；2，大副；3，二副；4，三幅；5，水手长；6，轮机长；7，大管轮；8，二管轮；9，三管轮；10，机工长；11，机匠；12，实习生；13，大厨；14，二厨；15，电机员；16，船医；17，政委；18，铜匠；19，木匠；80，其他1；81，其他2；83，其他3；84，岸基管理员；
	
	private Date work_date;		//发证日期
	
	private Date out_date;		//过期日期
	
	private int create_id;		//创建id
	
	private Date create_time;	//创建时间

	
	
	

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getDuty() {
		return duty;
	}

	public void setDuty(int duty) {
		this.duty = duty;
	}

	

	public Date getWork_date() {
		return work_date;
	}

	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}

	public Date getOut_date() {
		return out_date;
	}

	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public int getCreate_id() {
		return create_id;
	}

	public void setCreate_id(int create_id) {
		this.create_id = create_id;
	}

	@Override
	public String toString() {
		return "Certificate [id=" + id + ", sailor_id=" + sailor_id + ", name="
				+ name + ", num=" + num + ", level=" + level + ", duty=" + duty
				+ ", work_date=" + work_date + ", out_date=" + out_date
				+ ", create_id=" + create_id + ", create_time=" + create_time
				+ "]";
	}

	
	
}
