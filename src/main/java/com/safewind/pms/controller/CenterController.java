package com.safewind.pms.controller;

import com.safewind.pms.po.Certificate;
import com.safewind.pms.po.Publish;
import com.safewind.pms.service.PublishService;
import com.safewind.pms.service.SailorService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class CenterController {

    @Autowired
    private SailorService sailorService;
    @Autowired
    private PublishService publishService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/index")
    public String index(Model model) {
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        //-------------过期用户----------
        List<Certificate> certificateList = sailorService.SailorInfoCertificate(sailorId);
        long now = new Date().getTime();
        for (int i = 0; i < certificateList.size(); i++) {
            if (certificateList.get(i).getOut_date().getTime() - now > 1000l * 60 * 60 * 24 * 90) {
                certificateList.remove(i);
                i--;
            }
        }

        model.addAttribute("certificateList", certificateList);
        //--------------过期用户结束---------------
        //-----------------岸基发布的公告-----------------

        List<Publish> publishList = publishService.getPublishList(sailorId);
        model.addAttribute("publishList", publishList);
        //-----------------岸基发布的公告-----------------
        //-----------------岸基公告回复-----------------
        List<Publish> publishReplyList = publishService.getPublishReplyList(sailorId);
        if(publishReplyList!=null){
            model.addAttribute("publishReplyList", publishReplyList);
        }
        //-----------------岸基公告回复结束-----------------

        return "index";

    }
}
