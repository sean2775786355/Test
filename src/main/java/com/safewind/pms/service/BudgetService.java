package com.safewind.pms.service;

import java.util.List;

import com.safewind.pms.po.Budget;
import com.safewind.pms.po.BudgetUsgae;

public interface BudgetService {

	public void BudgetCreate(Budget budget);
	
	public Budget BudgetFind(int boatId,int year);
	
	public List<BudgetUsgae> BudgetUsgaeList(int boatId,int year);
	
	public List<Integer> allYearFind();
}
