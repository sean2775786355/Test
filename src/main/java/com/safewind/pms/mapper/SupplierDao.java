package com.safewind.pms.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.safewind.pms.po.Supplier;
@Repository
public interface SupplierDao {

	public List<Supplier> supplierList();
	
	public void SupplierPost (Supplier supplier);
	
	public Supplier supplierFindById (int id);
	
	public void updateSupplier(Supplier supplier);
	
	public void deleteSupplier(int id);

	public List<String> getAllEmail();
}
