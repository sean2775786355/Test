package com.safewind.pms.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.Budget;
import com.safewind.pms.po.BudgetUsgae;
import com.safewind.pms.po.Msg;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.BudgetService;
import com.safewind.pms.service.SailorService;

@Controller
@RequestMapping("/budget")
public class BudgetController {

	@Autowired
	private BudgetService budgetService;
	
	@Autowired
	private BoatService boatService;
	
	@Autowired
	private SailorService sailorService;
	
	@Autowired
	private Msg msg;
	
	@RequestMapping(value="/budgetCreate",method=RequestMethod.GET)
	public String budgetCreate(Model model){
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
		
		
		String boatName = boatService.boatNameFindById(attemper.getBoat_id());
		model.addAttribute("id", attemper.getBoat_id());
		model.addAttribute("boatName", boatName);
		return "/budget/budgetCreate";
	}
	
	@RequestMapping(value="/budgetPost",method=RequestMethod.POST)
	public @ResponseBody Msg budgetPost(Model model,Budget budget){

		budgetService.BudgetCreate(budget);
		msg.setMsg("okok");
		return msg;
	}
	
	@RequestMapping(value="/budgetInfo",method=RequestMethod.GET)
	public String budgetInfo(Model model,int year){
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
        
        String boatName = boatService.boatNameFindById(attemper.getBoat_id());
        
		List<Integer> yearList = budgetService.allYearFind();
        Budget budget = budgetService.BudgetFind(attemper.getBoat_id(),year);
		List<BudgetUsgae> budgetUsgaeList = budgetService.BudgetUsgaeList(attemper.getBoat_id(),year);
		model.addAttribute("yearList", yearList);
		model.addAttribute("budget", budget);
		model.addAttribute("boatName", boatName);
		model.addAttribute("budgetUsgaeList", budgetUsgaeList);
		return "/budget/budgetInfo";
	}
	
}
