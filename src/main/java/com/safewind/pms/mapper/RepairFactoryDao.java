package com.safewind.pms.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.safewind.pms.po.RepairFactory;
@Repository
public interface RepairFactoryDao {

	public void RepairFactoryCreate(RepairFactory repairFactory);
	
	public List<RepairFactory> RepairFactoryList();
	
	public RepairFactory RepairFactoryFind(int id);
	
	public void RepairFactoryDelete(int id);
	
	public void RepairFactoryUpdate(RepairFactory repairFactory);
	
	public List<String> findAllRepairFactoryName();
	
	public RepairFactory RepairFactoryFindByName(String name);
}
