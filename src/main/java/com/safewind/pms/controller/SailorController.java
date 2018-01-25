package com.safewind.pms.controller;


import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safewind.pms.constant.MsgAlertConstant;
import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.Boat;
import com.safewind.pms.po.Certificate;
import com.safewind.pms.po.Longevity;
import com.safewind.pms.po.Msg;
import com.safewind.pms.po.Sailor;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.SailorService;


@Controller
@RequestMapping("/Sailor")
public class SailorController {
	private static Logger logger = LoggerFactory.getLogger(SystemController.class);
	@Autowired private SailorService sailorService;
    @Autowired private Msg msg;
    @Autowired private BoatService boatService;
    
	/**
	 * 跳转到新增人员页面
	 * @param model
	 * @return
	 */
    @RequiresPermissions("sailor:sailorAdd")
    @RequestMapping(value = "SailorAdd",method = RequestMethod.GET)
	public String SailorAdd(Model model){
    	
        //将active高亮菜单传入前台
		model.addAttribute("active","SailorAdd");
        return "Sailor/SailorAdd";
	}
    
    /**
     * 提交人员信息
     * @param model
     * @param sailor
     * @return
     */
	@RequiresPermissions("sailor:sailorAdd")
	@RequestMapping(value = "SailorPost",method = RequestMethod.POST)
	public @ResponseBody Msg SailorPost(Model model,Sailor sailor){
		//新增人员信息
		Sailor sailor_create = sailorService.SailorAdd(sailor);
        model.addAttribute("sailor_create",sailor_create);

		msg.setMsg(MsgAlertConstant.SAILOR_INSERT_SUCCESS);
        logger.info(MsgAlertConstant.SAILOR_INSERT_SUCCESS + "人员:" + sailor);
        return msg;
	}
	
	
	/**
	 * 跳转到人员列表界面:/SailorList
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sailor:sailorList")
	@RequestMapping(value = "SailorList",method = RequestMethod.GET)
	public String SailorList(Model model){
		List<Sailor> sailor_list = sailorService.SailorList();
		
		model.addAttribute("sailor_list", sailor_list);
		//将active高亮菜单传入前台
		model.addAttribute("active","SailorList");
		return "Sailor/SailorList";
	}
	
	/**
	 * 跳转到新增证书界面
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sailor:certificateAdd")
	@RequestMapping(value = "CertificateAdd",method = RequestMethod.GET)
	public String CertificateAdd(Model model,@RequestParam("sailor_id")String sailor_id){
    	
        
		model.addAttribute("sailor_id", sailor_id);
		//将active高亮菜单传入前台
		model.addAttribute("active","CertificateAdd");
        return "Sailor/CertificateAdd";
	}
    
    /**
     * 提交证书信息
     * @param model
     * @param certificate
     * @return
     */
	@RequiresPermissions("sailor:certificateAdd")
	@RequestMapping(value = "CertificatePost",method = RequestMethod.POST)
	public @ResponseBody Msg CertificatePost(Model model,Certificate certificate){
		//新增证书信息
		Certificate certificate_create = sailorService.CertificateAdd(certificate);
        model.addAttribute("certificate_create",certificate_create);
		
		msg.setMsg(MsgAlertConstant.CERTIFICATE_INSERT_SUCCESS);
        logger.info(MsgAlertConstant.CERTIFICATE_INSERT_SUCCESS + "证书:" + certificate);
        return msg;
	}
	
	/**
	 * 跳转到新增海历界面
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sailor:longevityAdd")
	@RequestMapping(value = "LongevityAdd",method = RequestMethod.GET)
	public String LongevityAdd(Model model,@RequestParam("sailor_id")String sailor_id){
    	
		
		model.addAttribute("sailor_id", sailor_id);
        //将active高亮菜单传入前台
		model.addAttribute("active","LongevityAdd");
        return "Sailor/LongevityAdd";
	}
    
    /**
     * 提交海历信息
     * @param model
     * @param certificate
     * @return
     */
	@RequiresPermissions("sailor:longevityAdd")
	@RequestMapping(value = "LongevityPost",method = RequestMethod.POST)
	public @ResponseBody Msg LongevityPost(Model model,Longevity longevity){
		//新增海历信息
		Longevity longevity_create = sailorService.LongevityAdd(longevity);
        model.addAttribute("certificate_create",longevity_create);
		
		msg.setMsg(MsgAlertConstant.LONGEVITY_INSERT_SUCCESS);
        logger.info(MsgAlertConstant.LONGEVITY_INSERT_SUCCESS + "海历:" + longevity);
        return msg;
	}
	
	/**
	 * 查看信息
	 * 
	 */
	@RequiresPermissions("sailor:sailorInfo")
	@RequestMapping(value = "SailorInfo",method = RequestMethod.GET)
	public String SailorInfo(Model model,String sailor_id){
		Sailor sailor_info_message = sailorService.SailorInfoMessage(sailor_id);
		//将船员基本信息放入表中
		model.addAttribute("sailor_info_message", sailor_info_message);
		System.out.println(sailor_info_message);
		List<Certificate> sailor_info_certificate = sailorService.SailorInfoCertificate(sailor_id);
		//将船员证书信息放入表中
		model.addAttribute("sailor_info_certificate", sailor_info_certificate);
		
		List<Longevity> sailor_info_longevity = sailorService.SailorInfoLongevity(sailor_id);
		//将船员海历信息放入表中
		model.addAttribute("sailor_info_longevity", sailor_info_longevity);
		
		//将active高亮菜单传入前台
		model.addAttribute("active", "SailorInfo");
		return "Sailor/SailorInfo";
	}
	
	
	/**
	 * 假删除船员信息
	 * 
	 */
	@RequiresPermissions("sailor:sailorInfoDelete")
	@RequestMapping(value="SailorInfoDelete",method = RequestMethod.GET)
	public String SailorInfoDelete(Model model,String sailor_id){
		//将active高亮菜单传入前台
		model.addAttribute("active", "SailorInfoDelete");
		sailorService.SailorInfoDelete(sailor_id);		
		return "redirect:/Sailor/SailorList";
	}
	
	 
	/**
	 * 假删除证书信息
	 * 
	 */
	@RequiresPermissions("sailor:sailorInfoCertificateDelete")
	@RequestMapping(value="SailorInfo_certificateDelete",method = RequestMethod.GET)
	public String SailorInfo_certificateDelete(Model model,int certificate_id,String sailor_id){
		//将active高亮菜单传入前台
		model.addAttribute("active", "SailorInfo_certificateDelete");
		sailorService.SailorInfo_certificateDelete(certificate_id);	
		//将船员id放入表中
		model.addAttribute("sailor_id", sailor_id);
		return "redirect:/Sailor/SailorInfo";
	}
	
	/**
	 * 假删除海历信息
	 * 
	 */
	@RequiresPermissions("sailor:sailorInfoLongevityDelete")
	@RequestMapping(value="SailorInfo_longevityDelete",method = RequestMethod.GET)
	public String SailorInfo_longevityDelete(Model model,int longevity_id,String sailor_id){
		//将active高亮菜单传入前台
		model.addAttribute("active", "SailorInfo_longevityDelete");
		sailorService.SailorInfo_longevityDelete(longevity_id);	
		//将船员id放入表中
		model.addAttribute("sailor_id", sailor_id);
		return "redirect:/Sailor/SailorInfo";
	}
	
	 
	
	
	/**
	 * 跳转到人员调配界面
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sailor:sailorAttemper")
	@RequestMapping(value = "SailorAttemper",method = RequestMethod.GET)
	public String SailorAttemper(Model model,@RequestParam("sailor_id")String sailor_id){
    	
		model.addAttribute("sailor_id", sailor_id);
        //将active高亮菜单传入前台
		List<Boat> BoatInfo = boatService.BoatNameInfo();
		model.addAttribute("BoatInfo", BoatInfo);
		model.addAttribute("active","SailorAttemper");
        return "Sailor/SailorAttemper";
	}
    
    /**
     * 提交人员调配信息
     * @param model
     * @param Attemper
     * @return
     */
	@RequiresPermissions("sailor:sailorAttemper")
	@RequestMapping(value = "SailorAttemperPost",method = RequestMethod.POST)
	public @ResponseBody Msg SailorAttemperPost(Model model,Attemper attemper){
		//人员调配信息
		Attemper sailor_attemper = sailorService.SailorAttemper(attemper);
        model.addAttribute("sailor_attemper",sailor_attemper);
		
		msg.setMsg(MsgAlertConstant.SAILOR_ATTEMPER_SUCCESS);
        logger.info(MsgAlertConstant.SAILOR_ATTEMPER_SUCCESS + "人员调配:" + attemper);
        return msg;
	}
	
	@RequestMapping(value = "SailorAsHore",method = RequestMethod.GET)
	public String SailorAsHore(Model model,int AttemperId){
		sailorService.DeleteAttemper(AttemperId);
		Attemper attemper = sailorService.AttemperFind(AttemperId);
		Date ashore_time = new Date();
		sailorService.AsHoreLongrvity(attemper.getBoat_id(),ashore_time);
		
		List<Boat> boatList = boatService.getBoatList();
		model.addAttribute("boatList", boatList);
		return "boat/list";
	}
	
	
	/**
     * 修改人员信息
     * @param model
     * @param sailor
     * @return
     */
	@RequestMapping(value = "SailorRePost",method = RequestMethod.POST)
	public @ResponseBody Msg SailorRePost(Model model,Sailor sailor){
		//修改人员信息
		sailorService.SailorRePost(sailor);

		msg.setMsg(MsgAlertConstant.SAILOR_REPOST_SUCCESS);
        logger.info(MsgAlertConstant.SAILOR_REPOST_SUCCESS + "人员:" + sailor);
        return msg;
	}
}
