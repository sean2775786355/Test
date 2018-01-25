package com.safewind.pms.service;

import java.util.Date;
import java.util.List;

import com.safewind.pms.po.Level;
import com.safewind.pms.po.Time;

public interface TimeReduceService {
	
	//拿出表中元素
	public List<Time> timeList();
	//拿出对应等级维修等级信息
	public Level levelSelect(String ch);
	//定时减时间（小时）
	public void timeReduceHour(int a,int b);
	//定时减时间（天数）
	public void timeReduceDay(int a,int b);
	//到时限给工作表插数据
	public void dateInsert(int equipment_id, int boat_id, String service_level,Date estimated_time,String service_content,int type);
	//等级高时，更新维护等级
	public void dateUpdate(int equipment_id, int boat_id, String service_level,Date estimated_time,String service_content,int type);
	//更新date_count的时间
	public void timeUpdateHour(int equipment_id,int boat_id,String service_level,int hour);
	public void timeUpdateDay(int equipment_id,int boat_id,String service_level,int day);
}
