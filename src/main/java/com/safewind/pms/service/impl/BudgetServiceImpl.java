package com.safewind.pms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.BudgetDao;
import com.safewind.pms.po.Budget;
import com.safewind.pms.po.BudgetUsgae;
import com.safewind.pms.service.BudgetService;
@Service
public class BudgetServiceImpl implements BudgetService {

	@Autowired
	private BudgetDao budgetDao;
	
	@Override
	public void BudgetCreate(Budget budget) {
		budget.setCreateTime(new Date());
		budgetDao.BudgetCreate(budget);
	}

	@Override
	public Budget BudgetFind(int boatId,int year) {
		
		return budgetDao.BudgetFind(boatId,year);
	}
	
	@Override
	public List<BudgetUsgae> BudgetUsgaeList(int boatId,int year){
		
		return budgetDao.BudgetUsgaeList(boatId,year);
	}

	@Override
	public List<Integer> allYearFind() {
		
		return budgetDao.allYearFind();
	}

}
