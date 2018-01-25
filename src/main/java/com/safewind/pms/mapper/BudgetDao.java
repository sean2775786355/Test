package com.safewind.pms.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.safewind.pms.po.Budget;
import com.safewind.pms.po.BudgetUsgae;
@Repository
public interface BudgetDao {

	public void BudgetCreate(Budget budget);
	
	public Budget BudgetFind(int boatId,int year);

	public void updateRemained(int boatId,int year,double remained);
	
	public List<BudgetUsgae> BudgetUsgaeList(int boatId,int year);
	
	public List<Integer> allYearFind();

}
