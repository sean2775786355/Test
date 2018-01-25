package com.safewind.pms.controller;

import com.safewind.pms.po.Cwbt;
import com.safewind.pms.po.CwbtMaintenanceAll;
import com.safewind.pms.po.ServiceCwbt;
import com.safewind.pms.po.SubCwbt;
import com.safewind.pms.service.impl.CwbtServiceImpl;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by lxy on 2016/9/23.
 */
@Controller
@RequestMapping("/cwbt")
public class CwbtController {

    @Autowired
    private CwbtServiceImpl cwbtServiceImpl;

    private final static String table1 = "hh_cwbt_1";
    private final static String table2 = "hh_cwbt_2";
    private final static String table3 = "hh_cwbt_3";
    private final static String table4 = "hh_cwbt_4";
    //cwbt代码表
    @RequiresPermissions("cwbt:codeInfo")
    @RequestMapping("/cwbtInfo")
    public String cwbtInfo(Model model) {
        List<Cwbt> list = cwbtServiceImpl.getAllCwbt();
        model.addAttribute("list",list);
        model.addAttribute("active","cwbtInfo");
        return "cwbt/cwbtInfo";
    }
    //新建cwbt代码
    @RequiresPermissions("cwbt:codeCreate")
    @RequestMapping("/cwbtCodeCreate")
    public String cwbtCodeCreate(Model model) {
        List<List<SubCwbt>> list = cwbtServiceImpl.getAllSubCwbt();
        List<SubCwbt> list1 = list.get(0);
        if (list1 != null) {
            model.addAttribute("list1", list1);
        }
        List<SubCwbt> list2 = list.get(1);
        if (list2 != null) {
            model.addAttribute("list2", list2);
        }
        List<SubCwbt> list3 = list.get(2);
        if (list3 != null) {
            model.addAttribute("list3", list3);
        }
        model.addAttribute("active","cwbtCodeCreate");
        return "cwbt/cwbtCodeCreate";
    }
    //更改cwbt代码
    @RequiresPermissions("cwbt:codeEdit")
    @RequestMapping("/cwbtCodeEdit")
    public String cwbtCodeEdit(Model model, @RequestParam("id") String id) {
        //选项
        List<List<SubCwbt>> list = cwbtServiceImpl.getAllSubCwbt();
        List<SubCwbt> list1 = list.get(0);
        if (list1 != null) {
            model.addAttribute("list1", list1);
        }
        List<SubCwbt> list2 = list.get(1);
        if (list2 != null) {
            model.addAttribute("list2", list2);
        }
        List<SubCwbt> list3 = list.get(2);
        if (list3 != null) {
            model.addAttribute("list3", list3);
        }


        //维护内容
        CwbtMaintenanceAll cwbtMaintenanceAll = cwbtServiceImpl.getCwbtMaintenanceAll(id);



        Cwbt cwbt = cwbtServiceImpl.getCwbtById(id);

        model.addAttribute("cwbtMaintenanceAll",cwbtMaintenanceAll);
        model.addAttribute("cwbt",cwbt);
        model.addAttribute("active","cwbtInfo");
        return "cwbt/cwbtCodeEdit";
    }
    //cwbt代码删除————转给cwbt代码表
    @RequiresPermissions("cwbt:codeDelete")
    @RequestMapping("cwbtDelete")
    public String cwbtDelete(Model model, @RequestParam("id") String id) {
        model.addAttribute("active","cwbtInfo");
        cwbtServiceImpl.DeleteFalseCwbt(id);
        return "redirect:/cwbt/cwbtInfo";
    }
    //cwbt代码编辑结果
    @RequiresPermissions("cwbt:codeEdit")
    @RequestMapping("/cwbtCodeEditResult")
    public String cwbtCodeEditResult(Model model,@RequestParam("id") String s_id,@RequestParam("cwbt_1")String code1,@RequestParam("cwbt_2")String code2, @RequestParam("cwbt_3")String code3,@RequestParam("name")String name,@RequestParam("content")String content ,@RequestParam("defaultDuty")int defaultDuty ,@ModelAttribute CwbtMaintenanceAll cwbtMaintenanceAll){
        int id = Integer.parseInt(s_id);
        Cwbt cwbt =new Cwbt();
        cwbt.setId(id);
        cwbt.setCode1(code1);
        cwbt.setCode2(code2);
        cwbt.setCode3(code3);
        cwbt.setName(name);
        cwbt.setDefaultDuty(defaultDuty);
        cwbt.setContent(content);
        cwbtServiceImpl.updateCwbt(cwbt);


        cwbtServiceImpl.updateByCwbtIdAndLevel("A",id,cwbtMaintenanceAll.getA());
        cwbtServiceImpl.updateByCwbtIdAndLevel("B",id,cwbtMaintenanceAll.getB());
        cwbtServiceImpl.updateByCwbtIdAndLevel("C",id,cwbtMaintenanceAll.getC());
        cwbtServiceImpl.updateByCwbtIdAndLevel("D",id,cwbtMaintenanceAll.getD());
        cwbtServiceImpl.updateByCwbtIdAndLevel("E",id,cwbtMaintenanceAll.getE());
        cwbtServiceImpl.updateByCwbtIdAndLevel("F",id,cwbtMaintenanceAll.getF());
        cwbtServiceImpl.updateByCwbtIdAndLevel("G",id,cwbtMaintenanceAll.getG());
        cwbtServiceImpl.updateByCwbtIdAndLevel("H",id,cwbtMaintenanceAll.getH());




        model.addAttribute("active","cwbtInfo");
        return "redirect:/cwbt/cwbtInfo";
    }
    //cwbt代码新建结果
    @RequiresPermissions("cwbt:codeCreate")
    @RequestMapping("/cwbtCreateResult")
    public String cwbtCreateResult(Model model, @RequestParam("cwbt_1")String code1, @RequestParam("cwbt_2")String code2, @RequestParam("cwbt_3")String code3, @RequestParam("name")String name, @RequestParam("content")String content ,@RequestParam("defaultDuty")int defaultDuty ,@ModelAttribute CwbtMaintenanceAll cwbtMaintenanceAll){
        Cwbt temp = cwbtServiceImpl.getCwbtByCode(code1,code2,code3);
        if(temp==null) {
            Cwbt cwbt = new Cwbt();
            cwbt.setCode1(code1);
            cwbt.setCode2(code2);
            cwbt.setCode3(code3);
            cwbt.setName(name);
            cwbt.setDefaultDuty(defaultDuty);
            cwbt.setContent(content);
            cwbtServiceImpl.insertCwbt(cwbt);
            int id = cwbtServiceImpl.getCwbtByCode(code1, code2, code3).getId();

            ServiceCwbt serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getA());
            serviceCwbt.setServiceLevel("A");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getB());
            serviceCwbt.setServiceLevel("B");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getC());
            serviceCwbt.setServiceLevel("C");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getD());
            serviceCwbt.setServiceLevel("D");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getE());
            serviceCwbt.setServiceLevel("E");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getF());
            serviceCwbt.setServiceLevel("F");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getG());
            serviceCwbt.setServiceLevel("G");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);

            serviceCwbt = new ServiceCwbt();
            serviceCwbt.setCwbtId(id);
            serviceCwbt.setCwbtCode(code1 + "-" + code2 + "-" + code3);
            serviceCwbt.setContent(cwbtMaintenanceAll.getH());
            serviceCwbt.setServiceLevel("H");
            cwbtServiceImpl.insertServiceCwbt(serviceCwbt);
        }


        model.addAttribute("active","cwbtInfo");
        return "redirect:/cwbt/cwbtInfo";
    }




    //------------------------------------------子代码--------------------------------------//


    //子代码表
    @RequiresPermissions("cwbt:subCwbtInfo")
    @RequestMapping("/subCwbtInfo")
    public String subCwbtInfo(Model model) {
        model.addAttribute("active","cwbtInfo");
        List<List<SubCwbt>> list = cwbtServiceImpl.getAllSubCwbt();
        List<SubCwbt> list1 = list.get(0);
        if (list1 != null) {
            model.addAttribute("list1", list1);
        }
        List<SubCwbt> list2 = list.get(1);
        if (list2 != null) {
            model.addAttribute("list2", list2);
        }
        List<SubCwbt> list3 = list.get(2);
        if (list3 != null) {
            model.addAttribute("list3", list3);
        }
        return "cwbt/subCwbtInfo";
    }

    //子代码删除————转给子代码表
    @RequiresPermissions("cwbt:subCwbtDelete")
    @RequestMapping("/subCwbtDelete")
    public String subCwbtDelete(Model model,@RequestParam("table") String table, @RequestParam("id") String id) {
        model.addAttribute("active","cwbtInfo");
        cwbtServiceImpl.DeleteFalseSubCwbt(id,table);
        return "redirect:/cwbt/subCwbtInfo";
    }
    //新建子代码
    @RequiresPermissions("cwbt:subCwbtCreate")
    @RequestMapping("/subCwbtCodeCreate")
    public String subCwbtCodeCreate(Model model) {
        model.addAttribute("active","cwbtInfo");
        return "cwbt/subCwbtCodeCreate";
    }
    //子代码编辑
    @RequiresPermissions("cwbt:subCwbtEdit")
    @RequestMapping("/subCwbtCodeEdit")
    public String subCwbtCodeEdit(Model model,@RequestParam("table") String table, @RequestParam("id") String id) {
        SubCwbt subCwbt = cwbtServiceImpl.getSubCwbtById(table,id);
        model.addAttribute("subCwbt",subCwbt);
        model.addAttribute("table",table);

        model.addAttribute("active","cwbtInfo");
        return "cwbt/subCwbtCodeEdit";
    }

    //子代码新建结果
    @RequiresPermissions("cwbt:subCwbtCreate")
    @RequestMapping("/subCwbtCreateResult")
    public String subCwbtCreateResult(Model model,@RequestParam("cwbt") String table,@RequestParam("code") String code,@RequestParam("content") String content,@RequestParam("name") String name,@RequestParam("e_name") String eName){
        SubCwbt subCwbt =new SubCwbt();
        subCwbt.setCode(code);
        subCwbt.setContent(content);
        subCwbt.setName(name);
        subCwbt.seteName(eName);
        cwbtServiceImpl.insertSubCwbt(table,subCwbt);
        model.addAttribute("active","cwbtInfo");
        return "redirect:/cwbt/subCwbtInfo";
    }
    //编辑子代码结果
    @RequiresPermissions("cwbt:subCwbtEdit")
    @RequestMapping("/subCwbtCodeEditResult")
    public String subCwbtCodeEditResult(Model model,@RequestParam("tableName") String table,@RequestParam("code") String code,@RequestParam("content") String content,@RequestParam("name") String name,@RequestParam("e_name") String eName,@RequestParam("id") String s_id){
        SubCwbt subCwbt = new SubCwbt();
        int id = Integer.parseInt(s_id);
        subCwbt.setId(id);
        subCwbt.setCode(code);
        subCwbt.setContent(content);
        subCwbt.setName(name);
        subCwbt.seteName(eName);
        cwbtServiceImpl.updateSubCwbt(table,subCwbt);
        model.addAttribute("active","cwbtInfo");
        return "redirect:/cwbt/subCwbtInfo";
    }
}
