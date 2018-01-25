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
import com.safewind.pms.po.Boat;
import com.safewind.pms.po.CheckBoatManage;
import com.safewind.pms.po.Msg;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.CheckBoatManageService;
import com.safewind.pms.service.SailorService;

@Controller
@RequestMapping("/checkBoatManage")
public class CheckBoatManageController {

	
	@Autowired
	private Msg msg;
	
	@Autowired
	private SailorService sailorService;
	
	@Autowired
	private BoatService boatService;
	
	@Autowired
	private CheckBoatManageService checkBoatManageService;
	
	@RequestMapping(value="/checkBoatManageCreate",method=RequestMethod.GET)
	public String checkBoatManageCreate(Model model){
		
		List<Boat> boatList = boatService.getBoatList();
		
		model.addAttribute("boatList", boatList);
		model.addAttribute("active", "checkBoatManageCreate");
		return "/checkBoatManage/checkBoatManageCreate";
	}
	
	@RequestMapping(value="/checkBoatManagePost",method=RequestMethod.POST)
	public @ResponseBody Msg checkBoatManagePost(Model model,CheckBoatManage checkBoatManage){
		
		checkBoatManageService.sendMessage(checkBoatManage);
		msg.setMsg("船舶检查");
		return msg;
	}
	
	@RequestMapping(value="/checkBoatManageList",method=RequestMethod.GET)
	public String checkBoatManageList(Model model){
		
		Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
        List<CheckBoatManage> checkBoatManageList = null;
        if (attemper.getDuty()!=84){
        	checkBoatManageList =  checkBoatManageService.receiveMessage(attemper.getBoat_id());
        	model.addAttribute("roles", "onboard");
        }else{
        	checkBoatManageList =  checkBoatManageService.AllcheckBoatManage();
        	model.addAttribute("roles", "onland");
        }
		
        model.addAttribute("active", "checkBoatManageList");
		model.addAttribute("checkBoatManageList", checkBoatManageList);
		
		return "/checkBoatManage/checkBoatManageList";
	}
	
	@RequestMapping(value="/checkBoatManageInfo",method=RequestMethod.GET)
	public String checkBoatManageInfo(Model model,int id){
		
		
		CheckBoatManage checkBoatManageInfo =  checkBoatManageService.CheckBoatManageInfo(id);
		
		Boat boat = boatService.getBoatInfo(checkBoatManageInfo.getBoatId());
		
		model.addAttribute("boatName", boat.getName());
		model.addAttribute("checkBoatManageInfo", checkBoatManageInfo);
		
		return "/checkBoatManage/checkBoatManageInfo";
	}
	
	@RequestMapping(value="/checkBoatManageReply",method=RequestMethod.GET)
	public String checkBoatManageReply(Model model,int id){
		CheckBoatManage checkBoatManageInfo =  checkBoatManageService.CheckBoatManageInfo(id);
		Boat boat = boatService.getBoatInfo(checkBoatManageInfo.getBoatId());
		
		model.addAttribute("boatName", boat.getName());
		model.addAttribute("checkBoatManageInfo", checkBoatManageInfo);
		
		return "/checkBoatManage/checkBoatManageReply";
	}
	
	@RequestMapping(value="/checkBoatManageReplyPost",method=RequestMethod.POST)
	public @ResponseBody Msg checkBoatManageReplyPost(Model model,CheckBoatManage checkBoatManage){
		
		checkBoatManageService.replyMessage(checkBoatManage);
		
		msg.setMsg("回复信息");
		return msg;
	}
	
	
	@RequestMapping(value="/checkBoatManageDelete",method=RequestMethod.GET)
	public String checkBoatManageDelete(Model model,int id){
		
		
		checkBoatManageService.deleteMessage(id);
		
		return "/checkBoatManage/checkBoatManageList";
	}
	
	
}
