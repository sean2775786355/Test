package com.safewind.pms.controller;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.safewind.pms.po.*;
import com.safewind.pms.service.BudgetService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safewind.pms.service.MaterielService;
import com.safewind.pms.service.SailorService;

@Controller
@RequestMapping("/materiel")
public class MaterielController {

	@Autowired
	private BudgetService budgetService;
	
	@Autowired
	private MaterielService materielService;
	
	@Autowired
	private SailorService sailorService;
	
	@Autowired
	private Msg msg;
	
	@RequestMapping(value = "/materielInfo",method=RequestMethod.GET)
    public String materielInfo(Model model) {
        List<Materiel> materielList = materielService.materielList();
        model.addAttribute("materielList", materielList);
        System.out.println(materielList);
        model.addAttribute("active", "materielInfo");
        return "/materiel/materielInfo";
    }
	
	@RequestMapping(value = "/materielDelete",method=RequestMethod.GET)
    public String materielDelete(Model model,int id) {
		materielService.materielDelete(id);
        return "/materiel/materielInfo";
    }
	
	@RequestMapping(value = "/materielDetail",method=RequestMethod.GET)
    public String materielDetail(Model model,int id) {
		Materiel materiel = materielService.materielFindDetail(id);
        model.addAttribute("materiel",materiel);
        model.addAttribute("active", "materielDetail");
        return "/materiel/materielDetail";
    }
	
	@RequestMapping(value = "/materielPost",method=RequestMethod.POST)
    public @ResponseBody Msg materielCreate(Model model,Materiel materiel) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        System.out.println(create_id);
		materiel.setCreate_id(create_id);
		
		materiel.setCreate_time(new Date());
		materielService.materielCreate(materiel);
		msg.setMsg("okok1");
		return msg;
    }
	
	@RequestMapping(value = "/materielSubmit",method=RequestMethod.POST)
    public @ResponseBody Msg materielSubmit(Model model,Materiel materiel) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        
		materiel.setCreate_id(create_id);
		materiel.setCreate_time(new Date());
		
		System.out.println(materiel);
		materielService.materielSubmit(materiel);
		msg.setMsg("okok2");
		return msg;
    }
	
	@RequestMapping(value = "/materielCreate",method=RequestMethod.GET)
    public String materielCreate(Model model) {
        return "/materiel/materielCreate";
    }
	
	@RequestMapping(value = "/materielApplyCreate",method=RequestMethod.GET)
    public String materielApplyCreate(Model model) {
		List<Materiel> materielList = materielService.materielList();
        model.addAttribute("materielList", materielList);
        System.out.println(materielList);
        model.addAttribute("active", "materielApplyCreate");
        return "/materiel/materielApplyCreate";
    }

	
	@RequestMapping(value = "/materielApplyPost",method=RequestMethod.POST)
	public @ResponseBody Msg materielApplyPost(Model model,MaterielApply materielApply){
		//获取用户id
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        //获取对应船id
        Attemper attemper = sailorService.BoatSailor(create_id);
        materielApply.setBoat_id(attemper.getBoat_id()); 
        
		materielApply.setCreate_id(create_id);
		materielApply.setCreate_time(new Date());
		materielService.materielApplyCreate(materielApply);
		msg.setMsg("okok3");
		return msg;
	}
	
	@RequestMapping(value = "/purchaseInfo",method=RequestMethod.GET)
	public String purchaseInfo(Model model){
		List<MaterielApply> materielApplyList = materielService.materielApplyList();

        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
        
        if (attemper.getDuty() == 1 || attemper.getDuty() == 6) {
            int boatId = attemper.getBoat_id();
            for (int i = 0; i < materielApplyList.size(); i++) {
            	MaterielApply materielApply = materielApplyList.get(i);
                if(materielApply.getBoat_id()!=boatId){
                	materielApplyList.remove(i);
                    i--;
                }
            }
        }
        model.addAttribute("materielApplyList", materielApplyList);
        model.addAttribute("active", "purchaseInfo");
        
		return "/materiel/purchaseInfo";
	}
	
	@RequestMapping(value = "/materielApplyPrecheck",method=RequestMethod.GET)
	public String materielApplyPrecheck(Model model,int id){
		MaterielApply materielApply = materielService.materielApplyFindDetail(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());

		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		
		model.addAttribute("active","materielApplyPrecheck");
		return "/materiel/materielApplyPrecheck";
	}
	
	
	@RequestMapping(value = "/materielApplyPrecheckYes", method = RequestMethod.POST)
	public String materielApplyPrecheckYes(Model model,int id,String precheck_content){
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String check_id = subject.getPrincipal().toString();
        int i = 1;
        System.out.println(i + "  " + id + "  " + precheck_content + "  " + check_id);
        materielService.materielApplyUpdate(i, id, precheck_content, check_id);
		return "redirect:/materiel/purchaseInfo";
	}
	
	@RequestMapping(value = "/materielApplyPrecheckNo", method = RequestMethod.POST)
	public String materielApplyPrecheckNo(Model model,int id,String precheck_content){
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String check_id = subject.getPrincipal().toString();
        int i = 2;
        materielService.materielApplyUpdate(i, id, precheck_content, check_id);
		return "redirect:/materiel/purchaseInfo";
	}



	//---------------------------------------------------
	//询价
	@RequestMapping(value = "/materielApplyQuote")
	public String materielApplyQuote(Model model,int id){
		MaterielApply materielApply = materielService.getMaterielApplyById(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());

		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		return "/materiel/materielApplyQuote";
	}
	//询价提交
	@RequestMapping(value = "/materielApplyQuoteDo")
	public String materielApplyQuoteDo(Model model,Date deadline,int id){
		materielService.materielApplyQuoteDo(deadline,id);
		return "redirect:/materiel/purchaseInfo";
	}

	//采购分配
	@RequestMapping(value = "/materielPurchase")
	public String materielPurchase(Model model,int id){
		MaterielApply materielApply = materielService.getMaterielApplyById(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(materielApply.getBoat_id(),calendar.get(Calendar.YEAR));
		List<MaterielQuote> materielQuoteList = materielService.getMaterielQuoteByApplyId(id);
		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		model.addAttribute("budget",budget);
		model.addAttribute("materielQuoteList",materielQuoteList);

		return "/materiel/materielPurchase";
	}
	//采购分派的ajax
	@RequestMapping(value = "/quoteChange")
	public @ResponseBody String quoteChange(String quote){
		MaterielQuote materielQuote = materielService.getMaterielQuoteById(Integer.parseInt(quote));
		String jsonString = JSONObject.toJSONString(materielQuote);
		System.out.println(jsonString);
		return jsonString; 
	}
	//采购分配提交
	@RequestMapping(value = "/materielPurchaseDo",method=RequestMethod.POST)
	public String materielPurchaseDo(@RequestBody Map<String,Object> data){
		System.out.println(data.get("id") + "  " + data.get("boatId") + "  " + data.get("purchase_content") + "  " + data.get("current_count") + "  " + data.get("price") + "  " + data.get("quote_id") + "  " + data.get("hidden_remained"));
		materielService.materielPurchaseDo(Integer.parseInt(data.get("id").toString()),
							Integer.parseInt(data.get("quote_id").toString()),
							data.get("purchase_content").toString(),
							Integer.parseInt(data.get("current_count").toString()),
							Integer.parseInt(data.get("price").toString()),
							Integer.parseInt(data.get("boatId").toString()),
							Double.parseDouble(data.get("hidden_remained").toString()));
		return "redirect:/materiel/purchaseInfo";
	}

	//高价二核
	@RequestMapping(value = "/materielFinalCheck")
	public String materielFinalCheck(Model model,int id){
		MaterielApply materielApply = materielService.getMaterielApplyById(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(materielApply.getBoat_id(),calendar.get(Calendar.YEAR));
		MaterielPurchase materielPurchase = materielService.getMaterielPurchaseByApplyId(id);
		MaterielQuote materielQuote = materielService.getMaterielQuoteById(materielPurchase.getMaterielQuoteId());
		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		model.addAttribute("budget",budget);
		model.addAttribute("materielPurchase",materielPurchase);
		model.addAttribute("materielQuote",materielQuote);

		return "/materiel/materielFinalCheck";
	}
	//高价二核提交
	@RequestMapping(value = "/materielFinalCheckDo")
	public String materielFinalCheckDo(int id,String tag,String check_content){
		if("yes".equals(tag)){
			materielService.materielFinalCheckYes(id,check_content);
		}else if("no".equals(tag)){
			materielService.materielFinalCheckNo(id,check_content);
		}
		return "redirect:/materiel/purchaseInfo";
	}

	//采购执行界面
	@RequestMapping(value = "/materielPurchaseDid")
	public String materielPurchaseDid(Model model,int id){
		MaterielApply materielApply = materielService.getMaterielApplyById(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(materielApply.getBoat_id(),calendar.get(Calendar.YEAR));
		MaterielPurchase materielPurchase = materielService.getMaterielPurchaseByApplyId(id);
		MaterielQuote materielQuote = materielService.getMaterielQuoteById(materielPurchase.getMaterielQuoteId());
		String checkName = materielService.SailorFindById(materielPurchase.getCheckId());
		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		model.addAttribute("budget",budget);
		model.addAttribute("materielPurchase",materielPurchase);
		model.addAttribute("materielQuote",materielQuote);
		model.addAttribute("checkName",checkName);


		return "/materiel/materielPurchaseDid";
	}

	//采购执行提交
	@RequestMapping(value = "/materielPurchaseDidDo")
	public String materielPurchaseDidDo(int id){
		materielService.materielPurchaseDidDo(id);
		return "redirect:/materiel/purchaseInfo";
	}
	//采购入库
	@RequestMapping(value = "/materielPurchaseIncome")
	public String materielPurchaseIncome(Model model,int id){
		MaterielApply materielApply = materielService.getMaterielApplyById(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());
		MaterielPurchase materielPurchase = materielService.getMaterielPurchaseByApplyId(id);
		MaterielQuote materielQuote = materielService.getMaterielQuoteById(materielPurchase.getMaterielQuoteId());
		String checkName = materielService.SailorFindById(materielPurchase.getCheckId());
		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		model.addAttribute("materielPurchase",materielPurchase);
		model.addAttribute("materielQuote",materielQuote);
		model.addAttribute("checkName",checkName);


		return "/materiel/materielPurchaseIncome";
	}

	//采购入库提交
	@RequestMapping(value = "/materielPurchaseIncomeDo")
	public String materielPurchaseIncomeDo(int applyId, BigDecimal incomeCount, String incomeContent, int boatId, int materielId){
		materielService.materielPurchaseIncomeDo(applyId,incomeCount,incomeContent,boatId,materielId);
		return "redirect:/materiel/purchaseInfo";  
	}
	@RequestMapping(value = "/materielPurchaseView")
	public String materielPurchaseView(Model model,int id){
		MaterielApply materielApply = materielService.getMaterielApplyById(id);
		Materiel materiel = materielService.materielFindDetail(materielApply.getMateriel_id());
		Calendar calendar =Calendar.getInstance();
		Budget budget = budgetService.BudgetFind(materielApply.getBoat_id(),calendar.get(Calendar.YEAR));
		MaterielPurchase materielPurchase = materielService.getMaterielPurchaseByApplyId(id);
		MaterielQuote materielQuote = materielService.getMaterielQuoteById(materielPurchase.getMaterielQuoteId());
		String checkName = materielService.SailorFindById(materielPurchase.getCheckId());
		String createName = materielService.SailorFindById(materielApply.getCreate_id());
		model.addAttribute("materielApply",materielApply);
		model.addAttribute("materiel",materiel);
		model.addAttribute("budget",budget);
		model.addAttribute("materielPurchase",materielPurchase);
		model.addAttribute("materielQuote",materielQuote);
		model.addAttribute("checkName",checkName);
		model.addAttribute("createName",createName);


		return "/materiel/materielPurchaseView";
	}

}
