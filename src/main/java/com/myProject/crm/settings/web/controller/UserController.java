package com.myProject.crm.settings.web.controller;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.settings.service.UserService;
import com.myProject.crm.utils.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/login.do")
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request, String loginAct, String loginPwd) {

        System.out.println("进入到验证登录操作");

        loginPwd = MD5Util.getMD5(loginPwd);

        // 接受浏览器端的ip地址
        String ip = request.getRemoteAddr();
        System.out.println("-----------ip: " + ip);

        Map<String, Object> map = new HashMap<>();

        try {
            User user = userService.login(loginAct, loginPwd, ip);

            map.put("success", true);
            request.getSession().setAttribute("user", user);

        } catch (Exception e) {
//            e.printStackTrace();

            String msg = e.getMessage();
            map.put("success", false);
            map.put("msg", msg);

        }

        return map;
    }


//    @RequestMapping("/login.do")
//    @ResponseBody
//    public Map<String, Object> login(HttpServletRequest request, String loginAct, String loginPwd) {
//
//        System.out.println("进入到验证登录操作");
//
//
//        Map<String, Object> map = new HashMap<>();
//
//        String msg = "到期";
//        map.put("success", false);
//        map.put("msg", msg);
//
//
//        return map;
//    }
}
