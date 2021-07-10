package com.myProject.crm.workbench.web.controller;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.settings.service.UserService;
import com.myProject.crm.utils.DateTimeUtil;
import com.myProject.crm.utils.UUIDUtil;
import com.myProject.crm.workbench.domain.Activity;
import com.myProject.crm.workbench.domain.Clue;
import com.myProject.crm.workbench.domain.Tran;
import com.myProject.crm.workbench.service.ActivityService;
import com.myProject.crm.workbench.service.ClueService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import javax.annotation.Resource;

@Controller
@RequestMapping("/clue")
public class ClueController {

    @Resource
    private ClueService clueService;
    @Resource
    private UserService userService;
    @Resource
    private ActivityService activityService;

    @RequestMapping("/getUserList.do")
    @ResponseBody
    private List<User> getUserList() {

        System.out.println("取得用户信息列表");

        List<User> uList = userService.getUserList();

        return uList;
    }

    @RequestMapping("/save.do")
    @ResponseBody
    private boolean save(HttpServletRequest request, Clue c) {

        System.out.println("执行线索添加操作");

        c.setId(UUIDUtil.getUUID());
        c.setCreateBy(((User)request.getSession().getAttribute("user")).getName());
        c.setCreateTime(DateTimeUtil.getSysTime());

        boolean flag = clueService.save(c);

        return flag;
    }

    @RequestMapping("/detail.do")
    private ModelAndView detail(String id) {

        System.out.println("跳转到线索详细信息页");

        Clue c = clueService.detail(id);

        ModelAndView mv = new ModelAndView();

        mv.addObject("c", c);
        mv.setViewName("clue/detail");

        return mv;
    }

    @RequestMapping("/getActivityListByClueId.do")
    @ResponseBody
    private List<Activity> getActivityListByClueId(String clueId) {
        System.out.println("根据线索id查询关联的市场活动列表");
        List<Activity> aList = activityService.getActivityListByClueId(clueId);

        return aList;
    }

    @RequestMapping("/unbund.do")
    @ResponseBody
    private boolean unbund(String id) {
        System.out.println("根据id执行解除关联操作");

        boolean flag = clueService.unbund(id);

        return flag;
    }

    @RequestMapping("/getActivityListByNameAndNotByClueId.do")
    @ResponseBody
    private List<Activity> getActivityListByNameAndNotByClueId(String aname, String clueId) {

        System.out.println("查询市场活动列表（根据名称模糊查+排除掉已经关联指定线索的列表");

        Map<String, String> map = new HashMap<>();
        map.put("aname", aname);
        map.put("clueId", clueId);

        List<Activity> aList = activityService.getActivityListByNameAndNotByClueId(map);

        return aList;

    }

    @RequestMapping("/bund.do")
    @ResponseBody
    private boolean bund(String cid, HttpServletRequest request) {
        System.out.println("执行关联市场活动的操作");
        System.out.println(cid);
        String[] aids = request.getParameterValues("aid");
        for(String aid : aids) System.out.print(aid + " ");

        boolean flag = clueService.bund(cid, aids);

        return flag;
    }

    @RequestMapping("/getActivityListByName.do")
    @ResponseBody
    private List<Activity> getActivityListByName(String aname) {
        System.out.println("查询市场活动列表（根据名称模糊查）");

        List<Activity> aList = activityService.getActivityListByName(aname);

        return aList;
    }

    @RequestMapping("/convert.do")
    private ModelAndView convert(String clueId, String flag, HttpServletRequest request) {
        System.out.println("执行线索转换的操作");

        ModelAndView mv = new ModelAndView();
        Tran t = null;

        String creatBy = ((User)request.getSession().getAttribute("user")).getName();

        //如果需要创建交易
        if ("a".equals(flag)) {
            // 接受交易表单中的参数

            t = new Tran();

            t.setId(UUIDUtil.getUUID());
            t.setMoney(request.getParameter("money"));
            t.setName(request.getParameter("name"));
            t.setExpectedDate(request.getParameter("expectedDate"));
            t.setStage(request.getParameter("stage"));
            t.setActivityId(request.getParameter("activityId"));
            t.setCreateBy(creatBy);
            t.setCreateTime(DateTimeUtil.getSysTime());

        }

        boolean flag1 = clueService.convert(clueId, t, creatBy);
        if (flag1) {
            mv.setViewName("redirect:/workbench/clue/index.jsp");
        }

        return mv;
    }
}
