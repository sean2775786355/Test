package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

import java.util.Date;

/**
 * 
 * @author Ahui
 * 船员调配表
 *
 */
@Repository
public class Attemper {
	private Long id;			//主键ID
	
	private String sailor_id;	//海员ID（对应hh_sailor表中的salior_id）
	
	private String name;		//船员姓名
	
	private int status;			//当前状态：0.待派；1.在船；2.休假
	
	private Long longevity_id;	//当前海历id（对应hh_longevity表中的主键id）
	
	private int update_id;		//更新ID
	
	private Date update_time;	//更新时间
	
	private Date time;			//就任时间（月）
	
	private int is_del;			//是否删除：0.否；1.是
	
	private int boat_id;		//当前船舶ID（默认为0）
	
	private int duty;			//职务：0，水手；1，船长；2，大副；3，二副；4，三幅；5，水手长；6，轮机长；7，大管轮；8，二管轮；9，三管轮；10，机工长；11，机匠；12，实习生；13，大厨；14，二厨；15，电机员；16，船医；17，政委；18，铜匠；19，木匠；80，其他1；81，其他2；83，其他3；84，岸基管理员；90，待派；99，面试生
	
	private String content;		//说明

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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Long getLongevity_id() {
		return longevity_id;
	}

	public void setLongevity_id(Long longevity_id) {
		this.longevity_id = longevity_id;
	}

	public int getUpdate_id() {
		return update_id;
	}

	public void setUpdate_id(int update_id) {
		this.update_id = update_id;
	}

	

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getIs_del() {
		return is_del;
	}

	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}

	public int getBoat_id() {
		return boat_id;
	}

	public void setBoat_id(int boat_id) {
		this.boat_id = boat_id;
	}

	public int getDuty() {
		return duty;
	}

	public void setDuty(int duty) {
		this.duty = duty;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Attemper [id=" + id + ", sailor_id=" + sailor_id + ", name="
				+ name + ", status=" + status + ", longevity_id="
				+ longevity_id + ", update_id=" + update_id + ", update_time="
				+ update_time + ",time="+ time + ", is_del=" + is_del + ", boat_id=" + boat_id
				+ ", duty=" + duty + ", content=" + content + "]";
	}
	
	
	
}
