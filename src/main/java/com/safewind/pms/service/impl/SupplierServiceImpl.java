package com.safewind.pms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.SupplierDao;
import com.safewind.pms.po.Supplier;
import com.safewind.pms.service.SupplierService;
@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierDao supplierDao;
	
	@Override
	public List<Supplier> supplierList() {
		return supplierDao.supplierList();
	}

	@Override
	public void SupplierPost(Supplier supplier) {
		supplier.setCreateTime(new Date());
		supplierDao.SupplierPost(supplier);
	}

	@Override
	public Supplier supplierFindById(int id) {

		return supplierDao.supplierFindById(id);
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		supplierDao.updateSupplier(supplier);
	}
	
	public void deleteSupplier(int id){
		supplierDao.deleteSupplier(id);
	}

}
