package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

@Repository
public class Time {
	
	private int id;								//id值
	
	private int equipment_id;					//设备表id
	
	private int boat_id;							//船舶表id
	
	private String service_level;				//设备维护级别：A,B,C,D,E,F,G,H
	
	private int day;								//当前运行日期
	
	private int hour;							//当前运行小时
	
	private int is_del;							//是否被删除
	
	private int count_type;						//维护类型，0按天数计算；1，按运行时间计算

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEquipment_id() {
		return equipment_id;
	}

	public void setEquipment_id(int equipment_id) {
		this.equipment_id = equipment_id;
	}

	public int getBoat_id() {
		return boat_id;
	}

	public void setBoat_id(int boat_id) {
		this.boat_id = boat_id;
	}


	public String getService_level() {
		return service_level;
	}

	public void setService_level(String service_level) {
		this.service_level = service_level;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getIs_del() {
		return is_del;
	}

	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}

	public int getCount_type() {
		return count_type;
	}

	public void setCount_type(int count_type) {
		this.count_type = count_type;
	}

	
	@Override
	public String toString() {
		return "TimeReduce [id=" + id + ", equipment_id=" + equipment_id
				+ ", boat_id=" + boat_id + ", service_level=" + service_level
				+ ", day=" + day + ", hour=" + hour + ", is_del=" + is_del
				+ ", count_type=" + count_type + ", getId()=" + getId()
				+ ", getEquipment_id()=" + getEquipment_id()
				+ ", getBoat_id()=" + getBoat_id() + ", getService_level()="
				+ getService_level() + ", getDay()=" + getDay()
				+ ", getHour()=" + getHour() + ", getIs_del()=" + getIs_del()
				+ ", getCount_type()=" + getCount_type() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
