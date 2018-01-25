package com.safewind.pms.controller;

import com.safewind.pms.po.Boat;
import com.safewind.pms.po.Publish;
import com.safewind.pms.po.Sailor;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.PublishService;
import com.safewind.pms.service.SailorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2017/7/1.
 */
@Controller
@RequestMapping("/publish")
public class PublishController {

    @Autowired
    private BoatService boatService;

    @Autowired
    private SailorService sailorService;

    @Autowired
    private PublishService publishService;

    @RequestMapping("/publishForBoat")
    public String publishForBoat(Model model) {
        List<Boat> boatList =  boatService.BoatNameInfo();

        model.addAttribute("boatList",boatList);
        return "publish/publishForBoat";

    }
    @RequestMapping("/publishForSailor")
    public String publishForSailor(Model model) {
        List<Sailor> sailorList = sailorService.SailorList();
        model.addAttribute("sailorList",sailorList);
        return "publish/publishForSailor";

    }

    @RequestMapping(value = "/publishDo")
    public String publishDo(Publish publish,String to,Model model) {
        if(publish.getIsForBoat()==0){
            //sailor
            publish.setSailorId(to);
        }else{
            //boat
            String captainId = sailorService.getCaptainIdByBoatId(to);
            if (captainId==null){
                model.addAttribute("publishResult","发布失败,该船没有船长");
                return "index";
            }else {
                publish.setSailorId(captainId);
            }
        }
        publish.setPublishTime(new Date());
        publishService.insert(publish);
        model.addAttribute("publishResult","发布成功");
        return "index";

    }

    @RequestMapping("/publishDetails")
    public String publishDetails(Model model,Integer publishId) {
        Publish publish = publishService.getPublishById(publishId);
        model.addAttribute("publish",publish);
        if (publishService.isCaptain()){
            model.addAttribute("captain","1");
        }
        return "publish/publishDetails";

    }
    @RequestMapping("/publishCheck")
    public String publishCheck(Integer publishId) {
        publishService.publishCheck(publishId);

        return "redirect:../index";

    }
}
