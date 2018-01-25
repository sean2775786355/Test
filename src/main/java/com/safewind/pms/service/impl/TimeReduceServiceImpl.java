package com.safewind.pms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.TimeReduceDao;
import com.safewind.pms.service.TimeReduceService;
import com.safewind.pms.po.Level;
import com.safewind.pms.po.Time;

@Service
public class TimeReduceServiceImpl implements TimeReduceService{
	@Autowired private TimeReduceDao timeReduceDao;
	
	
	@Override
	public List<Time> timeList() {		
		List<Time> time_List = timeReduceDao.timeList();
		return time_List;
	}


	

	@Override
	public void timeReduceHour(int a,int b) {
		timeReduceDao.timeReduceHour(a, b);
		
	}



	@Override
	public void timeReduceDay(int a,int b) {
		timeReduceDao.timeReduceDay(a, b);
		
	}



	@Override
	public Level levelSelect(String ch) {
		return timeReduceDao.levelSelect(ch);
	}



	@Override
	public void dateInsert(int equipment_id,int boat_id,String service_level,Date estimated_time,String service_content,int type) {
		timeReduceDao.dateInsert(equipment_id,boat_id,service_level,estimated_time,service_content,type);
	}



	public void dateUpdate(int equipment_id, int boat_id,String service_level,Date estimated_time,String service_content,int type) {
		timeReduceDao.dateUpdate(equipment_id, boat_id,service_level,estimated_time,service_content,type);
	}

	@Override
	public void timeUpdateHour(int equipment_id,int boat_id,String service_level,int hour) {
		timeReduceDao.timeUpdateHour(equipment_id,boat_id,service_level,hour);

	}

	@Override
	public void timeUpdateDay(int equipment_id,int boat_id,String service_level,int day) {
		timeReduceDao.timeUpdateDay(equipment_id, boat_id,service_level, day);

	}


}
