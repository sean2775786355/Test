package com.safewind.pms.service.impl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.BoatDao;
import com.safewind.pms.po.Boat;
import com.safewind.pms.service.BoatService;
@Service
public class BoatServiceImpl implements BoatService {
    @Autowired private BoatDao boatDao;

	@Override
	public int insertBoat(Boat boat) {
		Date date = new Date();
		date.getTime() ;
		boat.setCreateTime(date);
		if(boat.getCreateId()==null)
			boat.setCreateId(0);
		if(boat.getIsDel()==null)
		    boat.setIsDel(0);
		if(boat.getStatus()==null)
			boat.setStatus(1);
		if(boat.getType()==null)
			boat.setType(0);
		if(boat.getTonnage()==null)
			boat.setTonnage(0);
		if(boat.getHorsepower()==null)
			boat.setHorsepower(0);
		return boatDao.insertBoat(boat);
	}

	@Override
	public Boat getBoatInfo(Integer id) {
		return boatDao.getBoatInfo(id);
	}

	@Override
	public List<Boat> getBoatList() {
		return boatDao.getBoatList();
	}

	@Override
	public int updateBoatInfo(Boat boat) {
		if(boat.getCreateId()==null)
			boat.setCreateId(0);
		if(boat.getIsDel()==null)
		    boat.setIsDel(0);
		if(boat.getStatus()==null)
			boat.setStatus(1);
		if(boat.getType()==null)
			boat.setType(0);
		if(boat.getTonnage()==null)
			boat.setTonnage(0);
		if(boat.getHorsepower()==null)
			boat.setHorsepower(0);
		return boatDao.updateBoatInfo(boat);
	}

	@Override
	public int deleteBoatByBoatId(Integer boatId){
		return boatDao.deleteBoatByBoatId(boatId);
	}
	
	
	/**
	 * author Ahui
	 * 根据船舶名称获取详细信息
	 * @param BoatName
	 * @return 
	 */
	@Override
	public Boat BoatInfo(String BoatName) {
		return boatDao.BoatInfo(BoatName);
	}

	@Override
	public List<Boat> BoatNameInfo() {
		return boatDao.BoatNameInfo();
	}

	@Override
	public String boatNameFindById(int id) {
		
		return boatDao.boatNameFindById(id);
	}
	
}
