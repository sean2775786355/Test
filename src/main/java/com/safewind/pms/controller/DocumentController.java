package com.safewind.pms.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safewind.pms.po.Boat;
import com.safewind.pms.po.Certificate;
import com.safewind.pms.po.Consumable;
import com.safewind.pms.po.Document;
import com.safewind.pms.po.DocumentApply;
import com.safewind.pms.po.Longevity;
import com.safewind.pms.po.Msg;
import com.safewind.pms.po.Sailor;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.DocumentService;

@Controller
@RequestMapping("/document")
public class DocumentController {
    @Autowired private Msg msg;
	@Autowired BoatService boatService;
	@Autowired DocumentService documentService;
	
    @RequestMapping(value = "documentAdd",method = RequestMethod.GET)
	public String documentAdd(Model model){
    	List<Boat> boatList = boatService.BoatNameInfo();
    	model.addAttribute("boatList", boatList);
        //将active高亮菜单传入前台
		model.addAttribute("active","documentAdd");
        return "document/documentAdd";
	}
    	
	@RequestMapping(value = "/documentPost",method=RequestMethod.POST)
    public @ResponseBody Msg documentPost(Model model,Document document) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        System.out.println(create_id);
		document.setCreate_id(create_id);
		   
		document.setCreate_time(new Date());
		String boatName = boatService.boatNameFindById((int)document.getBoat_id());
		document.setBoat_name(boatName);
		documentService.documentAdd(document);
		msg.setMsg("资料新增ok");
		return msg;
    }
	
    @RequestMapping(value = "documentList",method = RequestMethod.GET)
	public String documentList(Model model){
    	List<Document> documentList = documentService.documentList();
    	model.addAttribute("documentList", documentList);
        //将active高亮菜单传入前台
		model.addAttribute("active","documentList");
        return "document/documentList";
	}
    
	@RequestMapping(value = "documentInfo",method = RequestMethod.GET)
	public String documentInfo(Model model,int document_id){
		Document document = documentService.FindDocumentByid(document_id);
		//将船员基本信息放入表中
		model.addAttribute("document", document);
		
		//将active高亮菜单传入前台
		model.addAttribute("active", "documentInfo");
		return "document/documentInfo";
	}
	
	@RequestMapping(value = "documentUpdate",method = RequestMethod.GET)
	public String documentUpdate(Model model,int document_id){
		Document document = documentService.FindDocumentByid(document_id);
		//将船员基本信息放入表中
		model.addAttribute("document", document);
		
    	List<Boat> boatList = boatService.BoatNameInfo();
    	model.addAttribute("boatList", boatList);
		//将active高亮菜单传入前台
		model.addAttribute("active", "documentUpdate");
		return "document/documentUpdate";
	}
	
	@RequestMapping(value = "/documentUpdateCheck",method=RequestMethod.POST)
    public @ResponseBody Msg documentUpdateCheck(Model model,Document document) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        System.out.println(create_id);
		document.setCreate_id(create_id);
		   
		document.setCreate_time(new Date());
		String boatName = boatService.boatNameFindById((int)document.getBoat_id());
		document.setBoat_name(boatName);
		documentService.UpdateDocument(document);
		msg.setMsg("资料更新ok");
		return msg;
    }
	
	@RequestMapping(value = "documentDelete",method = RequestMethod.GET)
	public String documentDelete(Model model,int document_id){
		documentService.DeleteDocument(document_id);
		//将active高亮菜单传入前台
		model.addAttribute("active", "documentList");
		return "redirect:/document/documentList";
	}
	
    @RequestMapping(value = "documentApply",method = RequestMethod.GET)
	public String documentApply(Model model){
    	List<Boat> boatList = boatService.BoatNameInfo();
    	model.addAttribute("boatList", boatList);
        //将active高亮菜单传入前台
		model.addAttribute("active","documentApply");
        return "document/documentApply";
	}
    
	@RequestMapping(value = "/documentApplyPost",method=RequestMethod.POST)
    public @ResponseBody Msg documentApplyPost(Model model,DocumentApply documentApply) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String create_id = subject.getPrincipal().toString();
        System.out.println(create_id);
        documentApply.setCreate_id(create_id);
		   
        documentApply.setCreate_time(new Date());
		String boatName = boatService.boatNameFindById((int)documentApply.getBoat_id());
		documentApply.setBoat_name(boatName);
		documentService.documentApplyAdd(documentApply);
		msg.setMsg("资料申请新增ok");
		return msg;
    }
    
    @RequestMapping(value = "documentApplyList",method = RequestMethod.GET)
	public String documentApplyList(Model model){
    	List<DocumentApply> documentApplyList = documentService.documentApplyList();
    	model.addAttribute("documentApplyList", documentApplyList);
        //将active高亮菜单传入前台
		model.addAttribute("active","documentApplyList");
        return "document/documentApplyList";
	}
    
    @RequestMapping(value = "documentApplyView",method = RequestMethod.GET)
	public String documentApplyView(Model model,int id){
		DocumentApply documentApply = documentService.FindDocumentApplyByid(id);
		model.addAttribute("documentApply", documentApply);
		//将active高亮菜单传入前台
		model.addAttribute("active", "documentApplyView");
		return "document/documentApplyView";
	}
    
    @RequestMapping(value = "documentApplyCheck",method = RequestMethod.GET)
	public String documentApplyCheck(Model model,int id){
		DocumentApply documentApply = documentService.FindDocumentApplyByid(id);
		model.addAttribute("documentApply", documentApply);
		//将active高亮菜单传入前台
		model.addAttribute("active", "documentApplyCheck");
		return "document/documentApplyCheck";
	}
    
    @RequestMapping(value = "documentApplyCheckYes",method = RequestMethod.POST)
	public String documentApplyCheckYes(Model model,int id, String content_check){
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String check_id = subject.getPrincipal().toString();
        int i = 2;
        documentService.UpdateDocumentApply(i, id, content_check, check_id);
		return "redirect:/document/documentApplyList";
	}
    
    @RequestMapping(value = "documentApplyCheckNo",method = RequestMethod.POST)
	public String documentApplyCheckNo(Model model,int id,String content_check){
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String check_id = subject.getPrincipal().toString();
        int i = 1;
        documentService.UpdateDocumentApply(i, id, content_check, check_id);
		return "redirect:/document/documentApplyList";
	}
}
