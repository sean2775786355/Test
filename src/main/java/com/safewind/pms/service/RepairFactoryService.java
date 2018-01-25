package com.safewind.pms.service;

import java.util.List;

import com.safewind.pms.po.RepairFactory;

public interface RepairFactoryService {

	public RepairFactory RepairFactoryCreate(RepairFactory repairFactory);
	
	public List<RepairFactory> RepairFactoryList();
	
	public RepairFactory RepairFactoryFind(int id);
	
	public void RepairFactoryDelete(int id);
	
	public void RepairFactoryUpdate(RepairFactory repairFactory);
	
	public List<String> findAllRepairFactoryName();
	
	public RepairFactory RepairFactoryFindByName(String name);
}
