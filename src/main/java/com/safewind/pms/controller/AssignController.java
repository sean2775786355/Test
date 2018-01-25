package com.safewind.pms.controller;

import com.safewind.pms.constant.MsgAlertConstant;
import com.safewind.pms.po.*;
import com.safewind.pms.service.AssignService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.EquipmentService;
import com.safewind.pms.service.TimeReduceService;
import org.omg.PortableInterceptor.SUCCESSFUL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2016/11/12.
 */
@Controller
@RequestMapping("/Assign")
public class AssignController {

    private static Logger logger = LoggerFactory.getLogger(SystemController.class);

    @Autowired
    private AssignService assignService;
    @Autowired
    private TimeReduceService timeReduceService;
    @Autowired
    private BoatService boatService;
    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private Msg msg;


    @RequestMapping("serviceDateAssign")
    @RequiresPermissions("Assign:serviceDateAssign")
    public String serviceDateAssign(Model model){
        Attemper attemper = assignService.getOperator();
        Byte e_type = 0;
        if(attemper.getDuty()==1){
            e_type  = 1;
        }else if(attemper.getDuty()==6){
            e_type = 0;
        }
        //准备任务
        List<ServiceDateAll> serviceDateAllList = assignService.getTask(e_type,attemper.getBoat_id(),0,0);
        //准备人员
        List<AttemperAll> attemperAllList = assignService.getAvailableAttemperAll(attemper.getBoat_id());


        model.addAttribute("serviceDateAllList",serviceDateAllList);
        model.addAttribute("attemperAllList",attemperAllList);

        model.addAttribute("active","serviceDateAssign");
        return "assign/serviceDateAssign";
    }
    @RequestMapping("serviceDateAssignOk")
    public String serviceDateAssignOk(@RequestParam("id")String s_id,@RequestParam("serviceContent")String serviceContent,@RequestParam("bandContent")String bandContent,@RequestParam("didId")String didId ){
        int id = Integer.parseInt(s_id);
        assignService.serviceDateAssignOk(id,serviceContent,didId);
        return "redirect:serviceDateAssign";
    }


    @RequestMapping("giveUp")
    public String giveUp(@RequestParam("id")String s_id,@RequestParam("bandContent")String bandContent,@RequestParam("boatId")int boatId){
        int id = Integer.parseInt(s_id);
        assignService.giveUp(id,bandContent,boatId);
        return "redirect:serviceDateAssign";
    }






    @RequestMapping("serviceDateBocheck")
    @RequiresPermissions("Assign:serviceDateBocheck")
    public String serviceDateBocheck(Model model){
        Attemper attemper = assignService.getOperator();
        Byte e_type= 0;
        if(attemper.getDuty()==1){
            e_type=1;
        }else if(attemper.getDuty()==6){
            e_type=0;
        }
        //准备任务
        List<ServiceDateAll> serviceDateAllList = assignService.getTask(e_type,attemper.getBoat_id(),2,6);

        model.addAttribute("serviceDateAllList",serviceDateAllList);
        model.addAttribute("active","serviceDateBocheck");
        return "assign/serviceDateBocheck";
    }
    @RequestMapping("serviceDateBocheckOk")
    public String serviceDateBocheckOK(@RequestParam("id")String s_id,@RequestParam("boatId")int boatId){
        int id = Integer.parseInt(s_id);
        assignService.serviceDateBocheckOk(id,boatId);
        return "redirect:serviceDateBocheck";
    }
    @RequestMapping("serviceDateBocheckNo")
    public String serviceDateBocheckNo(@RequestParam("id")String s_id,@RequestParam("checkContent")String checkContent){
        int id = Integer.parseInt(s_id);
        assignService.serviceDateBocheckNo(id,checkContent);
        return "redirect:serviceDateBocheck";
    }



    @RequestMapping("serviceDateReport")
    public String serviceDateReport(Model model){

        List<ServiceDateAll> serviceDateAllList = assignService.getTask2();
        model.addAttribute("serviceDateAllList",serviceDateAllList);
        model.addAttribute("active","serviceDateReport");
        return "assign/serviceDateReport";
    }
    @RequestMapping("serviceDateReportOk")
    public String serviceDateReportOk(@RequestParam("id")String s_id,@RequestParam("content")String content,@RequestParam("didTime")Date didTime){
        int id = Integer.parseInt(s_id);
        assignService.serviceDateReportOk(id,didTime,content);
        return "redirect:serviceDateReport";
    }


    @RequestMapping("serviceDateShcheck")
    @RequiresPermissions("Assign:serviceDateShcheck")
    public String serviceDateShcheck(Model model){
        //准备可审核任务
        List<ServiceDateAll> serviceDateAllList =assignService.getServiceDateByAshoreId();

        model.addAttribute("serviceDateAllList",serviceDateAllList);
        model.addAttribute("active","serviceDateShcheck");
        return "assign/serviceDateShcheck";
    }

    @RequestMapping("serviceDateShcheckOk")
    public String serviceDateShcheckOk(@RequestParam("id")String s_id,@RequestParam("shoreContent")String shoreContent){
        int id = Integer.parseInt(s_id);
        assignService.serviceDateShcheckOk(id,shoreContent);

        return "redirect:serviceDateShcheck";
    }

    @RequestMapping("serviceDateShcheckNo")
    public String serviceDateShcheckNo(@RequestParam("id")String s_id,@RequestParam("shoreContent")String shoreContent){
        int id = Integer.parseInt(s_id);
        assignService.serviceDateShcheckNo(id,shoreContent);

        return "redirect:serviceDateShcheck";
    }


    @RequestMapping("serviceDateTemp")
    public String serviceDateTemp(Model model){
        List<Boat> BoatInfo = boatService.BoatNameInfo();
        //将参数BoatInfo传入表中
        model.addAttribute("BoatInfo", BoatInfo);
        List<Equipment> EquipmentInfo = equipmentService.getEquipmentList();
        //将参数传入表中
        model.addAttribute("EquipmentInfo", EquipmentInfo);
        model.addAttribute("action","serviceDateTemp");
        return "assign/serviceDateTemp";
    }

    @RequestMapping(value = "serviceDateTempSubmit" , method = RequestMethod.POST)
    public @ResponseBody Msg serviceDateTempSubmit(Model model , ServiceDate serviceDate){
        timeReduceService.dateInsert(serviceDate.getEquipmentId(),serviceDate.getBoatId(),serviceDate.getServiceLevel(),
                serviceDate.getEstimatedTime(),serviceDate.getServiceContent(),serviceDate.getType());
        model.addAttribute("action","serviceDateTempSubmit");
        msg.setMsg(MsgAlertConstant.SERVICEDATETEMP_CREATE_SUCCESS);
        logger.info(MsgAlertConstant.SERVICEDATETEMP_CREATE_SUCCESS + "工作卡:" + serviceDate);
        return msg;
    }

}
