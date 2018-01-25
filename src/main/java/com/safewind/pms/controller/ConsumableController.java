package com.safewind.pms.controller;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.alibaba.fastjson.JSONObject;
import com.safewind.pms.po.*;
import com.safewind.pms.service.BudgetService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.safewind.pms.service.ConsumableService;
import com.safewind.pms.service.SailorService;

@Controller
@RequestMapping("/consumable")
public class ConsumableController {

	@Autowired
	private BudgetService budgetService;
	
	@Autowired
	private ConsumableService consumableService;
	
	@Autowired
	private SailorService sailorService;
	
	@Autowired
	private Msg msg;
	
	@RequestMapping(value = "/consumableInfo",method=RequestMethod.GET)
    public String consumableInfo(Model model) {
        List<Consumable> consumableList = consumableService.consumableList();
        model.addAttribute("consumableList", consumableList);
        System.out.println(consumableList);
        model.addAttribute("active", "consumableInfo");
        return "/consumable/consumableInfo";
    }
	
	@RequestMapping(value = "/consumableDelete",method=RequestMethod.GET)
    public String consumableDelete(Model model,int id) {
		consumableService.consumableDelete(id);
        return "/consumable/consumableInfo";
    }
	
	@RequestMapping(value = "/consumableDetail",method=RequestMethod.GET)
    public String consumableDetail(Model model,int id) {
		Consumable consumable = consumableService.consumableFindDetail(id);
        model.addAttribute("consumable",consumable);
        model.addAttribute("active", "consumableDetail");
        return "/consumable/consumableDetail";
    }
	
	@RequestMapping(value = "/consumablePost",method=RequestMethod.POST)
    public @ResponseBody Msg consumableCreate(Model model,Consumable consumable) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        System.out.println(create_id);
		consumable.setCreate_id(create_id);
		
		consumable.setCreate_time(new Date());
		consumableService.consumableCreate(consumable);
		msg.setMsg("okok1");
		return msg;
    }
	
	@RequestMapping(value = "/consumableSubmit",method=RequestMethod.POST)
    public @ResponseBody Msg consumableSubmit(Model model,Consumable consumable) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        
		consumable.setCreate_id(create_id);
		consumable.setCreate_time(new Date());
		
		System.out.println(consumable);
		consumableService.consumableSubmit(consumable);
		msg.setMsg("okok2");
		return msg;
    }
	
	@RequestMapping(value = "/consumableCreate",method=RequestMethod.GET)
    public String consumableCreate(Model model) {
        return "/consumable/consumableCreate";
    }
	
	@RequestMapping(value = "/consumableApplyCreate",method=RequestMethod.GET)
    public String consumableApplyCreate(Model model) {
		List<Consumable> consumableList = consumableService.consumableList();
        model.addAttribute("consumableList", consumableList);
        System.out.println(consumableList);
        model.addAttribute("active", "consumableApplyCreate");
        return "/consumable/consumableApplyCreate";
    }

	
	@RequestMapping(value = "/consumableApplyPost",method=RequestMethod.POST)
	public @ResponseBody Msg consumableApplyPost(Model model,ConsumableApply consumableApply){
		//获取用户id
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        //获取对应船id
        Attemper attemper = sailorService.BoatSailor(create_id);
        consumableApply.setBoat_id(attemper.getBoat_id()); 
        
		consumableApply.setCreate_id(create_id);
		consumableApply.setCreate_time(new Date());
		consumableService.consumableApplyCreate(consumableApply);
		msg.setMsg("okok3");
		return msg;
	}
	
	@RequestMapping(value = "/purchaseInfo",method=RequestMethod.GET)
	public String purchaseInfo(Model model){
		List<ConsumableApply> consumableApplyList = consumableService.consumableApplyList();

        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
        
        if (attemper.getDuty() == 1 || attemper.getDuty() == 6) {
            int boatId = attemper.getBoat_id();
            for (int i = 0; i < consumableApplyList.size(); i++) {
            	ConsumableApply consumableApply = consumableApplyList.get(i);
                if(consumableApply.getBoat_id()!=boatId){
                	consumableApplyList.remove(i);
                    i--;
                }
            }
        }
        model.addAttribute("consumableApplyList", consumableApplyList);
        model.addAttribute("active", "purchaseInfo");
        
		return "/consumable/purchaseInfo";
	}
	
	@RequestMapping(value = "/consumableApplyPrecheck",method=RequestMethod.GET)
	public String consumableApplyPrecheck(Model model,int id){
		ConsumableApply consumableApply = consumableService.consumableApplyFindDetail(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());

		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		
		model.addAttribute("active","consumableApplyPrecheck");
		return "/consumable/consumableApplyPrecheck";
	}
	
	
	@RequestMapping(value = "/consumableApplyPrecheckYes", method = RequestMethod.POST)
	public String consumableApplyPrecheckYes(Model model,int id,String precheck_content){
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String check_id = subject.getPrincipal().toString();
        int i = 1;
        consumableService.consumableApplyUpdate(i, id, precheck_content, check_id);
		return "redirect:/consumable/purchaseInfo";
	}
	
	@RequestMapping(value = "/consumableApplyPrecheckNo", method = RequestMethod.POST)
	public String consumableApplyPrecheckNo(Model model,int id,String precheck_content){
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String check_id = subject.getPrincipal().toString();
        int i = 2;
        consumableService.consumableApplyUpdate(i, id, precheck_content, check_id);
		return "redirect:/consumable/purchaseInfo";
	}



	//---------------------------------------------------
	//询价
	@RequestMapping(value = "/consumableApplyQuote")
	public String consumableApplyQuote(Model model,int id){
		ConsumableApply consumableApply = consumableService.getConsumableApplyById(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());

		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		return "/consumable/consumableApplyQuote";
	}
	//询价提交
	@RequestMapping(value = "/consumableApplyQuoteDo")
	public String consumableApplyQuoteDo(Model model,Date deadline,int id){
		consumableService.consumableApplyQuoteDo(deadline,id);
		return "redirect:/consumable/purchaseInfo";
	}

	//采购分配
	@RequestMapping(value = "/consumablePurchase")
	public String consumablePurchase(Model model,int id){
		ConsumableApply consumableApply = consumableService.getConsumableApplyById(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(consumableApply.getBoat_id(),calendar.get(Calendar.YEAR));
		List<ConsumableQuote> consumableQuoteList = consumableService.getConsumableQuoteByApplyId(id);
		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		model.addAttribute("budget",budget);
		model.addAttribute("consumableQuoteList",consumableQuoteList);

		return "/consumable/consumablePurchase";
	}
	//采购分派的ajax
	@RequestMapping(value = "/quoteChange")
	public @ResponseBody String quoteChange(String quote){
		ConsumableQuote consumableQuote = consumableService.getConsumableQuoteById(Integer.parseInt(quote));
		String jsonString = JSONObject.toJSONString(consumableQuote);
		System.out.println(jsonString);
		return jsonString;
	}
	//采购分配提交
	@RequestMapping(value = "/consumablePurchaseDo")
	public String consumablePurchaseDo(int id,int quote_id,int current_count,int price,String purchase_content,double remained,int boatId){
		consumableService.consumablePurchaseDo(id,quote_id,purchase_content,current_count,price,boatId,remained);
		return "redirect:/consumable/purchaseInfo";
	}

	//高价二核
	@RequestMapping(value = "/consumableFinalCheck")
	public String consumableFinalCheck(Model model,int id){
		ConsumableApply consumableApply = consumableService.getConsumableApplyById(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(consumableApply.getBoat_id(),calendar.get(Calendar.YEAR));
		ConsumablePurchase consumablePurchase = consumableService.getConsumablePurchaseByApplyId(id);
		ConsumableQuote consumableQuote = consumableService.getConsumableQuoteById(consumablePurchase.getConsumableQuoteId());
		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		model.addAttribute("budget",budget);
		model.addAttribute("consumablePurchase",consumablePurchase);
		model.addAttribute("consumableQuote",consumableQuote);

		return "/consumable/consumableFinalCheck";
	}
	//高价二核提交
	@RequestMapping(value = "/consumableFinalCheckDo")
	public String consumableFinalCheckDo(int id,String tag,String check_content){
		if("yes".equals(tag)){
			consumableService.consumableFinalCheckYes(id,check_content);
		}else if("no".equals(tag)){
			consumableService.consumableFinalCheckNo(id,check_content);
		}
		return "redirect:/consumable/purchaseInfo";
	}

	//采购执行界面
	@RequestMapping(value = "/consumablePurchaseDid")
	public String consumablePurchaseDid(Model model,int id){
		ConsumableApply consumableApply = consumableService.getConsumableApplyById(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(consumableApply.getBoat_id(),calendar.get(Calendar.YEAR));
		ConsumablePurchase consumablePurchase = consumableService.getConsumablePurchaseByApplyId(id);
		ConsumableQuote consumableQuote = consumableService.getConsumableQuoteById(consumablePurchase.getConsumableQuoteId());
		String checkName = consumableService.SailorFindById(consumablePurchase.getCheckId());
		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		model.addAttribute("budget",budget);
		model.addAttribute("consumablePurchase",consumablePurchase);
		model.addAttribute("consumableQuote",consumableQuote);
		model.addAttribute("checkName",checkName);


		return "/consumable/consumablePurchaseDid";
	}

	//采购执行提交
	@RequestMapping(value = "/consumablePurchaseDidDo")
	public String consumablePurchaseDidDo(int id){
		consumableService.consumablePurchaseDidDo(id);
		return "redirect:/consumable/purchaseInfo";
	}
	//采购入库
	@RequestMapping(value = "/consumablePurchaseIncome")
	public String consumablePurchaseIncome(Model model,int id){
		ConsumableApply consumableApply = consumableService.getConsumableApplyById(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());
		ConsumablePurchase consumablePurchase = consumableService.getConsumablePurchaseByApplyId(id);
		ConsumableQuote consumableQuote = consumableService.getConsumableQuoteById(consumablePurchase.getConsumableQuoteId());
		String checkName = consumableService.SailorFindById(consumablePurchase.getCheckId());
		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		model.addAttribute("consumablePurchase",consumablePurchase);
		model.addAttribute("consumableQuote",consumableQuote);
		model.addAttribute("checkName",checkName);


		return "/consumable/consumablePurchaseIncome";
	}

	//采购入库提交
	@RequestMapping(value = "/consumablePurchaseIncomeDo")
	public String consumablePurchaseIncomeDo(int applyId, BigDecimal incomeCount, String incomeContent, int boatId, int consumableId){
		consumableService.consumablePurchaseIncomeDo(applyId,incomeCount,incomeContent,boatId,consumableId);
		return "redirect:/consumable/purchaseInfo";
	}
	@RequestMapping(value = "/consumablePurchaseView")
	public String consumablePurchaseView(Model model,int id){
		ConsumableApply consumableApply = consumableService.getConsumableApplyById(id);
		Consumable consumable = consumableService.consumableFindDetail(consumableApply.getConsumable_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(consumableApply.getBoat_id(),calendar.get(Calendar.YEAR));
		ConsumablePurchase consumablePurchase = consumableService.getConsumablePurchaseByApplyId(id);
		ConsumableQuote consumableQuote = consumableService.getConsumableQuoteById(consumablePurchase.getConsumableQuoteId());
		String checkName = consumableService.SailorFindById(consumablePurchase.getCheckId());
		String createName = consumableService.SailorFindById(consumableApply.getCreate_id());
		model.addAttribute("consumableApply",consumableApply);
		model.addAttribute("consumable",consumable);
		model.addAttribute("budget",budget);
		model.addAttribute("consumablePurchase",consumablePurchase);
		model.addAttribute("consumableQuote",consumableQuote);
		model.addAttribute("checkName",checkName);
		model.addAttribute("createName",createName);


		return "/consumable/consumablePurchaseView";
	}

}
