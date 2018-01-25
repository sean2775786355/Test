package com.safewind.pms.mapper;

import java.util.Date;
import java.util.List;

import com.safewind.pms.po.Level;
import com.safewind.pms.po.Time;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeReduceDao {
	
	public List<Time> timeList ();
	
	public void timeReduceHour(int a,int b);
	
	public void timeReduceDay(int a,int b);
	
	public Level levelSelect(String ch);
	
	public void dateInsert(@Param("equipment_id")int equipment_id, @Param("boat_id")int boat_id, @Param("service_level")String service_level, @Param("estimated_time")Date estimated_time,@Param("service_content")String service_content,@Param("type")int type);
	
	public void dateUpdate(int equipment_id,int boat_id,String service_level,Date estimated_time ,String service_content,int type);

	public void timeUpdateHour(int equipment_id,int boat_id,String service_level,int hour);

	public void timeUpdateDay(int equipment_id,int boat_id,String service_level,int day);
}
