package com.safewind.pms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.RepairFactoryDao;
import com.safewind.pms.po.RepairFactory;
import com.safewind.pms.service.RepairFactoryService;
@Service
public class RepairFactoryServiceImpl implements RepairFactoryService {

	@Autowired
	private RepairFactoryDao repairFactoryDao;
	
	@Override
	public RepairFactory RepairFactoryCreate(RepairFactory repairFactory) {
		repairFactory.setCreateTime(new Date());
		repairFactoryDao.RepairFactoryCreate(repairFactory);
		return repairFactory;
	}

	@Override
	public List<RepairFactory> RepairFactoryList() {
		return repairFactoryDao.RepairFactoryList();
	}

	@Override
	public RepairFactory RepairFactoryFind(int id) {
		return repairFactoryDao.RepairFactoryFind(id);
	}

	@Override
	public void RepairFactoryDelete(int id) {
		repairFactoryDao.RepairFactoryDelete(id);
	}

	@Override
	public void RepairFactoryUpdate(RepairFactory repairFactory) {
		repairFactoryDao.RepairFactoryUpdate(repairFactory);
	}

	@Override
	public List<String> findAllRepairFactoryName() {
		return repairFactoryDao.findAllRepairFactoryName();
	}

	@Override
	public RepairFactory RepairFactoryFindByName(String name) {
		return repairFactoryDao.RepairFactoryFindByName(name);
	}

}
