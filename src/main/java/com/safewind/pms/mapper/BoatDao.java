package com.safewind.pms.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.safewind.pms.po.Boat;
@Repository
public interface BoatDao {
    public int insertBoat(Boat boat);    
	public Boat getBoatInfo(Integer id);
	public List<Boat> getBoatList();
	public int updateBoatInfo(Boat boat);
	public Boat getBoatInfoByName(String name);
	public int deleteBoatByBoatId(Integer boatId);
	
	
	/**
	 * author Ahui
	 * 根据船舶名称获取详细信息
	 * @param BoatName
	 * @return 
	 */
	public Boat BoatInfo(String BoatName);
	public List<Boat> BoatNameInfo();
	public String boatNameFindById(int id);
}
