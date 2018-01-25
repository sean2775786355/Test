package com.safewind.pms.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.safewind.pms.po.*;
import com.safewind.pms.service.RepairService;
import com.safewind.pms.service.SailorService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.safewind.pms.constant.MsgAlertConstant;
import com.safewind.pms.service.RepairFactoryService;

@Controller
@RequestMapping("/repair")
public class RepairController {

    @Autowired
    private RepairFactoryService repairFactoryService;
    @Autowired
    private RepairService repairService;
    @Autowired
    private SailorService sailorService;
    @Autowired
    private Msg msg;

    @RequestMapping(value = "/repairFactoryInfo")
    public String repairFactoryInfo(Model model) {
        List<RepairFactory> RepairFactoryList = repairFactoryService.RepairFactoryList();
        model.addAttribute("RepairFactoryList", RepairFactoryList);
        model.addAttribute("active", "repairFactoryInfo");
        return "/repair/repairFactoryInfo";
    }

    @RequestMapping(value = "/repairFactoryCreate")
    public String repairFactoryCreate(Model model) {
        model.addAttribute("active", "repairFactoryCreate");
        return "/repair/repairFactoryCreate";
    }

    @RequestMapping(value = "/repairFactoryPost", method = RequestMethod.POST)
    public
    @ResponseBody
    Msg repairFactoryPost(Model model, RepairFactory repairFactory) {
        repairFactoryService.RepairFactoryCreate(repairFactory);
        msg.setMsg(MsgAlertConstant.REPAIRFACTORY_CREATE_SUCCESS);
        return msg;
    }

    @RequestMapping(value = "/repairFactoryDetail", method = RequestMethod.GET)
    public String repairFactoryDetail(Model model, int id) {
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id);
        model.addAttribute("repairFactory", repairFactory);
        return "/repair/repairFactoryDetail";
    }

    @RequestMapping(value = "/repairFactoryUpdate", method = RequestMethod.POST)
    public
    @ResponseBody
    Msg repairFactoryUpdate(Model model, RepairFactory repairFactory) {
        repairFactoryService.RepairFactoryUpdate(repairFactory);
        msg.setMsg(MsgAlertConstant.REPAIRFACTORY_UPDATE_SUCCESS);
        return msg;
    }


    @RequestMapping(value = "/repairFactoryDelete", method = RequestMethod.GET)
    public String repairFactoryDelete(Model model, int id) {
        repairFactoryService.RepairFactoryDelete(id);
        List<RepairFactory> RepairFactoryList = repairFactoryService.RepairFactoryList();
        model.addAttribute("RepairFactoryList", RepairFactoryList);
        model.addAttribute("active", "repairFactoryInfo");
        return "/repair/repairFactoryInfo";
    }

    @RequestMapping(value = "/repairApplyCreate",method=RequestMethod.GET)
    public String repairApplyCreate(Model model) {
    	//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
        
        List<RepairFactory> repairFactoryList = repairFactoryService.RepairFactoryList();
        
        model.addAttribute("repairFactoryList", repairFactoryList);
        model.addAttribute("boat_id", attemper.getBoat_id());
        model.addAttribute("active", "repairApplyCreate");
        
        return "/repair/repairApplyCreate";
    }
    
    @RequestMapping(value = "/repairApplyPost", method = RequestMethod.POST)
    public @ResponseBody Msg repairApplyPost(Model model, RepairApplyAll repairApplyAll) {
        repairService.repairApplyPost(repairApplyAll);
        msg.setMsg(MsgAlertConstant.REPAIRFACTORY_CREATE_SUCCESS);
        return msg;
    }

    @RequestMapping(value = "/repairInfo")
    public String repairInfo(Model model) {
        List<RepairApplyAll> repairApplyAllList = repairService.getAllRepairApplyAlls();

        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper = sailorService.BoatSailor(sailorId);
        if (attemper.getDuty() == 1 || attemper.getDuty() == 6) {
            int boatId = attemper.getBoat_id();
            for (int i = 0; i < repairApplyAllList.size(); i++) {
                RepairApplyAll repairApplyAll = repairApplyAllList.get(i);
                if(repairApplyAll.getBoatId()!=boatId){
                    repairApplyAllList.remove(i);
                    i--;
                }
            }
        }
        model.addAttribute("repairApplyAllList", repairApplyAllList);
        model.addAttribute("active", "repairInfo");
        return "/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyDetail", method = RequestMethod.GET)
    public String repairApplyDetail(Model model ,Integer id) {
        RepairApplyWithBLOBs repairApplyWithBLOBs =repairService.getRepairApplyWithBloBsById(id);
        List<RepairFactory> repairFactoryList = repairFactoryService.RepairFactoryList();

        model.addAttribute("repairFactoryList", repairFactoryList);
        model.addAttribute("repairApplyWithBLOBs", repairApplyWithBLOBs);

        model.addAttribute("active", "repairApplyDetail");
        return "/repair/repairApplyDetail";
    }

    @RequestMapping(value = "/repairApplyDetailResult", method = RequestMethod.POST)
    public String repairApplyDetailResult(Model model ,RepairApplyWithBLOBs repairApplyWithBLOBs) {
        repairApplyWithBLOBs.setStatus(new Byte("0"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyCheck1", method = RequestMethod.GET)
    public String repairApplyCheck1(Model model ,Integer id) {
        RepairApplyAll repairApplyAll =repairService.getRepairApplyAllById(id);
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id.intValue());

        model.addAttribute("repairFactory", repairFactory);
        model.addAttribute("repairApplyAll", repairApplyAll);

        model.addAttribute("active", "repairApplyCheck1");
        return "/repair/repairApplyCheck1";
    }

    @RequestMapping(value = "/repairApplyCheck1Yes", method = RequestMethod.POST)
    public String repairApplyCheck1Yes(Model model ,Integer id, String check1Content) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setCheck1Time(date);
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        repairApplyWithBLOBs.setCheck1Id(sailorId);
        repairApplyWithBLOBs.setCheck1Content(check1Content);
        repairApplyWithBLOBs.setStatus(new Byte("2"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyCheck1No", method = RequestMethod.POST)
    public String repairApplyCheck1No(Model model ,Integer id,String check1Content) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setCheck1Time(date);

        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        repairApplyWithBLOBs.setCheck1Id(sailorId);
        repairApplyWithBLOBs.setCheck1Content(check1Content);
        repairApplyWithBLOBs.setStatus(new Byte("1"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyCheck2", method = RequestMethod.GET)
    public String repairApplyCheck2(Model model,Integer id) {
        RepairApplyAll repairApplyAll =repairService.getRepairApplyAllById(id);
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id.intValue());

        model.addAttribute("repairFactory", repairFactory);
        model.addAttribute("repairApplyAll", repairApplyAll);

        model.addAttribute("active", "repairApplyCheck2");
        return "/repair/repairApplyCheck2";
    }

    @RequestMapping(value = "/repairApplyCheck2Yes", method = RequestMethod.POST)
    public String repairApplyCheck2Yes(Model model ,Integer id, String check2Content) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setCheck2Time(date);
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        repairApplyWithBLOBs.setCheck2Id(sailorId);
        repairApplyWithBLOBs.setCheck2Content(check2Content);
        repairApplyWithBLOBs.setStatus(new Byte("4"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyCheck2No", method = RequestMethod.POST)
    public String repairApplyCheck2No(Model model ,Integer id,String check2Content) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setCheck2Time(date);

        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        repairApplyWithBLOBs.setCheck2Id(sailorId);
        repairApplyWithBLOBs.setCheck2Content(check2Content);
        repairApplyWithBLOBs.setStatus(new Byte("3"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }




    @RequestMapping(value = "/repairApplyCheck3", method = RequestMethod.GET)
    public String repairApplyCheck3(Model model,Integer id) {
        RepairApplyAll repairApplyAll =repairService.getRepairApplyAllById(id);
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id.intValue());

        model.addAttribute("repairFactory", repairFactory);
        model.addAttribute("repairApplyAll", repairApplyAll);

        model.addAttribute("active", "repairApplyCheck3");
        return "/repair/repairApplyCheck3";
    }

    @RequestMapping(value = "/repairApplyCheck3Yes", method = RequestMethod.POST)
    public String repairApplyCheck3Yes(Model model ,Integer id, String check3Content) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setCheck3Time(date);
        System.out.println(date);
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        repairApplyWithBLOBs.setCheck3Id(sailorId);
        repairApplyWithBLOBs.setCheck3Content(check3Content);
        repairApplyWithBLOBs.setStatus(new Byte("6"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyCheck3No", method = RequestMethod.POST)
    public String repairApplyCheck3No(Model model ,Integer id,String check3Content) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setCheck3Time(date);

        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        repairApplyWithBLOBs.setCheck3Id(sailorId);
        repairApplyWithBLOBs.setCheck3Content(check3Content);
        repairApplyWithBLOBs.setStatus(new Byte("9"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }



    @RequestMapping(value = "/repairApplyInput", method = RequestMethod.GET)
    public String repairApplyInput(Model model,Integer id) {
        RepairApplyAll repairApplyAll =repairService.getRepairApplyAllById(id);
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id.intValue());

        model.addAttribute("repairFactory", repairFactory);
        model.addAttribute("repairApplyAll", repairApplyAll);

        model.addAttribute("active", "repairApplyInput");
        return "/repair/repairApplyInput";
    }

    @RequestMapping(value = "/repairApplyInputYes", method = RequestMethod.POST)
    public String repairApplyInputYes(Model model,Integer id,String act_repair_content,String act_file) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setActTime(date);
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        repairApplyWithBLOBs.setActId(sailorId);
        repairApplyWithBLOBs.setActRepairContent(act_repair_content);
        repairApplyWithBLOBs.setActUrl(act_file);
        repairApplyWithBLOBs.setStatus(new Byte("7"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyOutput", method = RequestMethod.GET)
    public String repairApplyOutput(Model model,Integer id) {
        RepairApplyAll repairApplyAll =repairService.getRepairApplyAllById(id);
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id.intValue());

        model.addAttribute("repairFactory", repairFactory);
        model.addAttribute("repairApplyAll", repairApplyAll);

        model.addAttribute("active", "repairApplyOutput");
        return "/repair/repairApplyOutput";
    }

    @RequestMapping(value = "/repairApplyOutputYes", method = RequestMethod.POST)
    public String repairApplyOutputYes(Model model,Integer id,String finish_file,String finish_content,BigDecimal budget_usage_count) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        repairApplyWithBLOBs.setId(id);
        Date date = new Date();
        repairApplyWithBLOBs.setFinishTime(date);
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        repairApplyWithBLOBs.setFinishId(sailorId);
        repairApplyWithBLOBs.setFinishContent(finish_content);
        repairApplyWithBLOBs.setBudgetUsageCount(budget_usage_count);
        repairApplyWithBLOBs.setFinishUrl(finish_file);
        repairApplyWithBLOBs.setStatus(new Byte("8"));
        repairService.updateRepairApplyWithBLOBs(repairApplyWithBLOBs);
        return "redirect:/repair/repairInfo";
    }

    @RequestMapping(value = "/repairApplyView", method = RequestMethod.GET)
    public String repairApplyView(Model model,Integer id) {
        RepairApplyAll repairApplyAll =repairService.getRepairApplyAllById(id);
        RepairFactory repairFactory = repairFactoryService.RepairFactoryFind(id.intValue());

        model.addAttribute("repairFactory", repairFactory);
        model.addAttribute("repairApplyAll", repairApplyAll);

        model.addAttribute("active", "repairApplyView");
        return "/repair/repairApplyView";
    }
}
