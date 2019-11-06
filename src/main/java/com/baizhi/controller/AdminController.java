package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.server.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest ;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("admin")
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("login")
    @ResponseBody
    public Map<Object, Object> login(Admin admin, String inputCode, HttpServletRequest request){
        Map<Object, Object> map = new HashMap<>();
        try {
            adminService.login(admin,inputCode,request);
            map.put("status",true);
        } catch (Exception e) {
            map.put("status",false);
            map.put("message",e.getMessage());
        }
        return  map;
    }
    @RequestMapping("out")
    public String out(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("loginAdmin");
        return "redirect:/login/login.jsp";

    }
}
