package com.safewind.pms.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 门铎 on 2016/8/22.
 */
@Controller
@RequestMapping("/shiro")
public class ShiroException {
    @RequestMapping("unauthorized")
    public ModelAndView unauthorized(){
        return new ModelAndView("unauthorized");
    }
    @RequestMapping("unauthenticated")
    public ModelAndView unauthenticated(){
        return new ModelAndView("unauthenticated");
    }
}
