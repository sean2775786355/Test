package com.safewind.pms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safewind.pms.po.Msg;
import com.safewind.pms.po.Supplier;
import com.safewind.pms.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private Msg msg;
	
	@RequestMapping(value = "/supplierInfo",method=RequestMethod.GET)
    public String supplierInfo(Model model) {
        List<Supplier> supplierList = supplierService.supplierList();
        model.addAttribute("supplierList", supplierList);
        System.out.println(supplierList);
        model.addAttribute("active", "supplierInfo");
        return "/supplier/supplierInfo";
    }
	
	@RequestMapping(value = "/supplierCreate",method=RequestMethod.GET)
	public String supplierCreate(Model model){
		model.addAttribute("active", "supplierCreate");
		return "/supplier/supplierCreate";
	}
	
	@RequestMapping(value = "/supplierPost",method=RequestMethod.POST)
	public @ResponseBody Msg supplierPost(Model model,Supplier supplier){
		supplierService.SupplierPost(supplier);
		return msg;
	}
	
	@RequestMapping(value = "/supplierDetail",method=RequestMethod.GET)
	public String supplierDetail(Model model,int id){
		Supplier supplier = supplierService.supplierFindById(id);
		model.addAttribute("supplier", supplier);
		return "/supplier/supplierDetail";
	}
	
	@RequestMapping(value = "/supplierDetailPost",method=RequestMethod.POST)
	public @ResponseBody Msg supplierDetailPost(Model model,Supplier supplier){
		supplierService.updateSupplier(supplier);
		
		return msg;
	}
	
	@RequestMapping(value = "/supplierDelete",method=RequestMethod.GET)
	public String supplierDelete (Model model,int id){
		supplierService.deleteSupplier(id);
		return "/supplier/supplierInfo";
	}
}
