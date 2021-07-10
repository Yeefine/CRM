package com.myProject.crm.workbench.web.controller;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.settings.service.UserService;
import com.myProject.crm.utils.DateTimeUtil;
import com.myProject.crm.utils.UUIDUtil;
import com.myProject.crm.workbench.dao.TranHistoryDao;
import com.myProject.crm.workbench.domain.Tran;
import com.myProject.crm.workbench.domain.TranHistory;
import com.myProject.crm.workbench.service.CustomerService;
import com.myProject.crm.workbench.service.TranService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/transaction")
public class TranController {

    @Resource
    private UserService userService;
    @Resource
    private CustomerService customerService;
    @Resource
    private TranService tranService;

    @RequestMapping("/add.do")
    private ModelAndView add() {

        System.out.println("进入到跳转到交易添加页的操作");

        ModelAndView mv = new ModelAndView();

        List<User> uList = userService.getUserList();
        mv.addObject("uList", uList);
        mv.setViewName("forward:/workbench/transaction/save.jsp");

        return mv;
    }

    @RequestMapping("/getCustomerName.do")
    @ResponseBody
    private  List<String> getCustomerName(String name) {
        System.out.println("取得 客户名称列表（按照客户名称进行模糊查询）");

        List<String> sList = customerService.getCustomerName(name);

        return sList;
    }

    @RequestMapping("/save.do")
    private ModelAndView save(HttpServletRequest request, Tran t) {
        System.out.println("执行添加交易的操作");

        String customerName = request.getParameter("customerName");
        t.setId(UUIDUtil.getUUID());
        t.setCreateTime(DateTimeUtil.getSysTime());
        t.setCreateBy(((User)request.getSession().getAttribute("user")).getName());

        boolean flag = tranService.save(t, customerName);

        ModelAndView mv = new ModelAndView();

        if (flag) {
            mv.setViewName("redirect:/workbench/transaction/index.jsp");
        }

        return mv;
    }

    @RequestMapping("/detail.do")
    private ModelAndView detail(String id, HttpServletRequest request) {
        System.out.println("跳转到详细信息页");

        Tran t = tranService.detail(id);

        String stage = t.getStage();
        Map<String, String> pMap = (Map<String, String>) request.getServletContext().getAttribute("pMap");
        t.setPossibility(pMap.get(stage));


        ModelAndView mv = new ModelAndView();
        mv.addObject("t", t);

        mv.setViewName("forward:/workbench/transaction/detail.jsp");

        return mv;
    }

    @RequestMapping("/getHistoryListByTranId.do")
    @ResponseBody
    private List<TranHistory> getHistoryListByTranId(String tranId, HttpServletRequest request) {
        System.out.println("根据交易id取得相应的历史列表");

        List<TranHistory> tList = tranService.getHistoryListByTranId(tranId);

        Map<String, String> pMap = (Map<String, String>) request.getServletContext().getAttribute("pMap");
        for (TranHistory th : tList) {
            String stage = th.getStage();
            th.setPossibility(pMap.get(stage));
        }

        return tList;
    }

    @RequestMapping("/changeStage.do")
    @ResponseBody
    private Map<String, Object> changeStage(HttpServletRequest request, String id, String stage, String money, String expectedDate) {

        System.out.println("进入修改阶段的操作");

        String editBy = ((User)request.getSession().getAttribute("user")).getName();
        String editTime = DateTimeUtil.getSysTime();

        Tran t = new Tran();
        t.setId(id);
        t.setStage(stage);
        t.setMoney(money);
        t.setExpectedDate(expectedDate);
        t.setEditBy(editBy);
        t.setEditTime(editTime);

        boolean flag = tranService.changeStage(t);

        // 处理可能性
        Map<String, String> pMap = (Map<String, String>) request.getServletContext().getAttribute("pMap");
        t.setPossibility(pMap.get(stage));

        Map<String, Object> map = new HashMap<>();
        map.put("success", flag);
        map.put("t", t);

        return map;
    }

    @RequestMapping("/getCharts.do")
    @ResponseBody
    private Map<String, Object> getCharts() {
        System.out.println("取得交易阶段数量统计图表的数据");

        Map<String, Object> map = tranService.getCharts();

        return map;
    }
}
