package com.safewind.pms.controller;

import com.safewind.pms.constant.MsgAlertConstant;
import com.safewind.pms.po.*;
import com.safewind.pms.service.*;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Boat")
public class BoatController {
    @Autowired
    private BoatService boatServiceImpl;
    @Autowired
    private Msg msg;
    @Autowired
    private EquipmentService equipmentServiceImpl;
    @Autowired
    private BoatDateCount boatDateCount;
    @Autowired
    private CwbtService cwbtServiceImpl;
    @Autowired
    private SailorService sailorService;

    //得到创建船舶的页面
    @RequestMapping("/createBoat")
    public String createBoat(Model model) {
        model.addAttribute("active", "createBoat");
        return "boat/createBoat";
    }


    //从后台获取船舶的数据，插入数据库，返回信息
    @RequestMapping(value = "/insertBoat", method = RequestMethod.POST)
    @ResponseBody
    public Msg insertBoat(Boat boat) {
        if (boat.geteName() != "" && boat.getImo() != "" && boat.getCallName() != "" &&
                boat.getCountry() != "" && boat.geteName() != "" && boat.getHorsepower() != null
                && boat.getLane() != "" && boat.getType() != null && boat.getStatus() != null && boat.getTonnage() != null) {
            boatServiceImpl.insertBoat(boat);
            msg.setMsg(MsgAlertConstant.BOAT_INSERT_SUCCESS);
            return msg;
        } else {
            msg.setMsg(MsgAlertConstant.BOAT_INSERT_FAIL);
            return msg;
        }
    }


    //返回船舶列表
    @RequestMapping("/boatList")
    public String getBoatList(Model model) {
        List<Boat> boatList = boatServiceImpl.getBoatList();
        model.addAttribute("boatList", boatList);
        model.addAttribute("active", "boatList");
        return "boat/list";
    }

    //获取某一船舶的信息
    @RequestMapping("/boatInfo/{id}")
    public String getBoatInfo(Model model, @PathVariable("id") Integer id) {
        Boat boat = boatServiceImpl.getBoatInfo(id);
        List<Equipment> equipments = equipmentServiceImpl.getEquipmentByBoatId(id);
        for (Equipment equipment : equipments) {
            String FullCwbtCode = equipment.getCwbtCode() + "-" + equipment.getCwbtCode4();
            equipment.setCwbtCode(FullCwbtCode);
        }
        List<Cwbt> cwbts = cwbtServiceImpl.getAllCwbt();
        List<String> cwbtCodes = new ArrayList<String>();
        //int i = 0;
        for (Cwbt cwbt : cwbts) {
            cwbtCodes.add(cwbt.getCode1() + "-" + cwbt.getCode2() + "-" + cwbt.getCode3());
        }
        
        //获取船上的人员列表
        List<Attemper> attemperList = sailorService.SailorBoat(id);
        
        
        model.addAttribute("boat", boat);
        model.addAttribute("equipments", equipments);
        model.addAttribute("cwbtCodes", cwbtCodes);
        model.addAttribute("attemperList", attemperList);
        return "boat/boatDetails";

    }

    //更新船舶信息
    @RequestMapping("/updateBoat")
    @ResponseBody
    public Msg updateBoat(Boat boat) {
        if (boat.geteName() != "" && boat.getImo() != "") {
            boatServiceImpl.updateBoatInfo(boat);
            msg.setMsg(MsgAlertConstant.BOAT_UPDATE_SUCCESS);
            return msg;
        } else {
            msg.setMsg(MsgAlertConstant.BOAT_UPDATE_FAIL);
            return msg;

        }
    }

    //新建设备
    @RequestMapping("/initEquipment")
    @ResponseBody
    public Msg initEquipment(Equipment equipment,HttpServletRequest request) {

        equipmentServiceImpl.insert(equipment);
        msg.setMsg(MsgAlertConstant.EQUIPMENT_INIT_SUCCESS);
        System.out.println(equipment.getId());
        String serviceLevelA = request.getParameter("serviceLevelA");
        String serviceLevelB = request.getParameter("serviceLevelB");
        String serviceLevelC = request.getParameter("serviceLevelC");
        String serviceLevelD = request.getParameter("serviceLevelD");
        String serviceLevelE = request.getParameter("serviceLevelE");
        String serviceLevelF = request.getParameter("serviceLevelF");
        String serviceLevelG = request.getParameter("serviceLevelG");
        String serviceLevelH = request.getParameter("serviceLevelH");
        if (serviceLevelA == null) serviceLevelA = "";
        if (serviceLevelB == null) serviceLevelB = "";
        if (serviceLevelC == null) serviceLevelC = "";
        if (serviceLevelD == null) serviceLevelD = "";
        if (serviceLevelE == null) serviceLevelE = "";
        if (serviceLevelF == null) serviceLevelF = "";
        if (serviceLevelG == null) serviceLevelG = "";
        if (serviceLevelH == null) serviceLevelH = "";


        if (serviceLevelA.equals("A")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelA);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(1);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(24);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }

        }
        if (serviceLevelB.equals("B")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelB);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(7);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(168);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelC.equals("C")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelC);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(30);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(500);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelD.equals("D")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelD);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(90);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(1500);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelE.equals("E")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelE);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(180);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(3000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelF.equals("F")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelF);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(360);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(6000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelG.equals("G")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelG);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(900);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(15000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelH.equals("H")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelH);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(1800);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(30000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }

        return msg;
    }


    //根据cwbt代码从数据库获取维护等级和维护内容
    @RequestMapping("/getEquipmentFixService")
    @ResponseBody
    public List<BoatFixService> getEquipmentFixService(HttpServletRequest request) {
        String cwbtCode = request.getParameter("cwbtCode");
        List<BoatFixService> boatFixServices = equipmentServiceImpl.getBoatServiceInfoByCwbtCode(cwbtCode);
        return boatFixServices;
    }


    @RequestMapping("/equipmentDetails/{equipmentId}")
    public String equipmentDetails(Model model, @PathVariable("equipmentId") Integer equipmentId) {
        Equipment equipment = equipmentServiceImpl.getEquipment(equipmentId);
        String cwbtCode = equipment.getCwbtCode();
        BoatFixService contentA = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("A",cwbtCode);
        BoatFixService contentB = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("B",cwbtCode);
        BoatFixService contentC = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("C",cwbtCode);
        BoatFixService contentD = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("D",cwbtCode);
        BoatFixService contentE = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("E",cwbtCode);
        BoatFixService contentF = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("F",cwbtCode);
        BoatFixService contentG = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("G",cwbtCode);
        BoatFixService contentH = equipmentServiceImpl.getBoatServiceInfoByServiceLevel("H",cwbtCode);
        if (contentA != null) {
            if (contentA.getContent() == null) contentA.setContent("");
            model.addAttribute("contentA", contentA);
        }
        if (contentB != null) {
            if (contentB.getContent() == null) contentB.setContent("");
            model.addAttribute("contentB", contentB);
        }
        if (contentC != null) {
            if (contentC.getContent() == null) contentC.setContent("");
            model.addAttribute("contentC", contentC);
        }
        if (contentD != null) {
            if (contentD.getContent() == null) contentD.setContent("");
            model.addAttribute("contentD", contentD);
        }
        if (contentE != null) {
            if (contentE.getContent() == null) contentE.setContent("");
            model.addAttribute("contentE", contentE);
        }
        if (contentF != null) {
            if (contentF.getContent() == null) contentF.setContent("");
            model.addAttribute("contentF", contentF);
        }
        if (contentG != null) {
            if (contentG.getContent() == null) contentG.setContent("");
            model.addAttribute("contentG", contentG);
        }
        if (contentH != null) {
            if (contentH.getContent() == null) contentH.setContent("");
            model.addAttribute("contentH", contentH);
        }

        model.addAttribute("equipment", equipment);
        return "boat/equipmentDetails";
    }


    @RequestMapping("/updateEquipment")
    @ResponseBody
    public Msg updateEquipment(Equipment equipment, HttpServletRequest request) {
        equipmentServiceImpl.update(equipment);
        String serviceLevelA = request.getParameter("serviceLevelA");
        String serviceLevelB = request.getParameter("serviceLevelB");
        String serviceLevelC = request.getParameter("serviceLevelC");
        String serviceLevelD = request.getParameter("serviceLevelD");
        String serviceLevelE = request.getParameter("serviceLevelE");
        String serviceLevelF = request.getParameter("serviceLevelF");
        String serviceLevelG = request.getParameter("serviceLevelG");
        String serviceLevelH = request.getParameter("serviceLevelH");
        if (serviceLevelA == null) serviceLevelA = "";
        if (serviceLevelB == null) serviceLevelB = "";
        if (serviceLevelC == null) serviceLevelC = "";
        if (serviceLevelD == null) serviceLevelD = "";
        if (serviceLevelE == null) serviceLevelE = "";
        if (serviceLevelF == null) serviceLevelF = "";
        if (serviceLevelG == null) serviceLevelG = "";
        if (serviceLevelH == null) serviceLevelH = "";

        equipmentServiceImpl.deleteServiceFromDateCountByEquipmentId(equipment.getId());

        if (serviceLevelA.equals("A")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelA);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(1);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(24);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }

        }
        if (serviceLevelB.equals("B")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelB);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(7);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(168);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelC.equals("C")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelC);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(30);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(500);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelD.equals("D")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelD);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(90);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(1500);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelE.equals("E")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelE);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(180);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(3000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelF.equals("F")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelF);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(360);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(6000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelG.equals("G")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelG);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(900);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(15000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        if (serviceLevelH.equals("H")) {
            boatDateCount.setBoatId(equipment.getBoatId());
            boatDateCount.setEquipmentId(equipment.getId());
            boatDateCount.setServiceLevel(serviceLevelH);
            if (equipment.getDailyHour() == 0) {
                boatDateCount.setDay(1800);
                equipmentServiceImpl.insertIntoBoatDateCount1(boatDateCount);
            } else {
                boatDateCount.setHour(30000);
                equipmentServiceImpl.insertIntoBoatDateCount2(boatDateCount);
            }
        }
        msg.setMsg(MsgAlertConstant.EQUIPMENT_UPDATE_SUCCESS);
        return msg;
    }


    //从数据库根据设备的id得到单个设备的维护级别
    @RequestMapping("/getSingleEquipmentService")
    @ResponseBody
    public List<BoatFixService> getSingleEquipmentService(HttpServletRequest request) {
        String id = request.getParameter("id");
        Integer equipmentId = Integer.parseInt(id);
        List<BoatFixService> singleBoatFixServices = equipmentServiceImpl.getSingleEquipmentService(equipmentId);
        return singleBoatFixServices;
    }


    //删除某一条船
    @RequestMapping("/deleteBoatByBoatId/{boatId}")
    public String deleteBoatByBoatId(@PathVariable("boatId") Integer boatId) {
        equipmentServiceImpl.deleteEquipmentByBoatId(boatId);//删除船上设备
        equipmentServiceImpl.deleteDateCountByBoatId(boatId);//删除设备维护周期表
        boatServiceImpl.deleteBoatByBoatId(boatId);

        return "boat/list";
    }


    //删除某个设备
    @RequestMapping("/deleteEquipmentByEquipmentId/{boatId}/{equipmentId}")
    public String deleteEquipmentByEquipmentId(@PathVariable("boatId") Integer boatId, @PathVariable("equipmentId") Integer equipmentId) {
        String boatId2 = String.valueOf(boatId);
        equipmentServiceImpl.deleteEquipment(equipmentId);
        equipmentServiceImpl.deleteDateCountByEquipmentId(equipmentId);
        return "redirect:/Boat/boatInfo/" + boatId2;
    }
    
    
    @RequestMapping("/boataa")
    public String boataa(Model model,int txt,HttpSession session) {
    	//从shiro中获取当前用户的sailor_id
    	Subject subject = SecurityUtils.getSubject();
    	String sailor_id = subject.getPrincipal().toString();
//    	System.out.println(sailor_id);
    	Attemper attemper = sailorService.BoatSailor(sailor_id);
//    	System.out.println(attemper);
    	
    	Boat boat = boatServiceImpl.getBoatInfo(attemper.getBoat_id());
        List<Equipment> equipments = equipmentServiceImpl.getEquipmentByBoatId(attemper.getBoat_id());
        for (Equipment equipment : equipments) {
            String FullCwbtCode = equipment.getCwbtCode() + "-" + equipment.getCwbtCode4();
            equipment.setCwbtCode(FullCwbtCode);
        }
        List<Cwbt> cwbts = cwbtServiceImpl.getAllCwbt();
        List<String> cwbtCodes = new ArrayList<String>();
        //int i = 0;
        for (Cwbt cwbt : cwbts) {
            cwbtCodes.add(cwbt.getCode1() + "-" + cwbt.getCode2() + "-" + cwbt.getCode3());
        }
        
        //获取船上的人员列表
        List<Attemper> attemperList = sailorService.SailorBoat(attemper.getBoat_id());
        
        
        model.addAttribute("boat", boat);
        model.addAttribute("equipments", equipments);
        model.addAttribute("cwbtCodes", cwbtCodes);
        model.addAttribute("attemperList", attemperList);
        model.addAttribute("txt", txt);
        return "boat/boatDetails";
    }
    
}
