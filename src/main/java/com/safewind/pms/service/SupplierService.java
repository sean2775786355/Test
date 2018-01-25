package com.safewind.pms.service;

import java.util.List;

import com.safewind.pms.po.Supplier;

public interface SupplierService {

	public List<Supplier> supplierList();
	
	public void SupplierPost (Supplier supplier);
	
	public Supplier supplierFindById (int id);
	
	public void updateSupplier(Supplier supplier);
	
	public void deleteSupplier(int id);
}
