package com.myProject.crm.workbench.web.controller;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.settings.service.UserService;
import com.myProject.crm.utils.DateTimeUtil;
import com.myProject.crm.utils.UUIDUtil;
import com.myProject.crm.vo.PaginationVO;
import com.myProject.crm.workbench.dao.ActivityDao;
import com.myProject.crm.workbench.domain.Activity;
import com.myProject.crm.workbench.domain.ActivityRemark;
import com.myProject.crm.workbench.service.ActivityService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/activity")
public class ActivityController {
    
    @Resource
    private ActivityService activityService;
    @Resource
    private UserService userService;

    @RequestMapping("/getUserList.do")
    @ResponseBody
    private List<User> getUserList(HttpServletRequest request) {

        System.out.println("取得用户信息列表");

        List<User> uList = userService.getUserList();
        
        return uList;

    }

    @RequestMapping("/save.do")
    @ResponseBody
    private boolean save(Activity a, HttpServletRequest request) {
        System.out.println("执行市场活动的添加操作");
        String id = UUIDUtil.getUUID();
        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)request.getSession().getAttribute("user")).getName();

        a.setId(id);
        a.setCreateTime(createTime);
        a.setCreateBy(createBy);


        boolean flag = activityService.save(a);
        return flag;
    }

    @RequestMapping("/pageList.do")
    @ResponseBody
    private PaginationVO<Activity> pageList(Activity at, @RequestParam("pageNo") String pageNoStr, @RequestParam("pageSize") String pageSizeStr) {

        System.out.println("进入到查询市场活动信息列表的操作（结合条件查询+分页查询）");

        // 第几页
        int pageNo = Integer.valueOf(pageNoStr);
        // 每页展示数量
        int pageSize = Integer.valueOf(pageSizeStr);
        // 计算出略过的记录数
        int skipCount = (pageNo - 1) * pageSize;

        Map<String, Object> map = new HashMap<>();
        map.put("name", at.getName());
        map.put("owner", at.getOwner());
        map.put("startDate", at.getStartDate());
        map.put("endDate", at.getEndDate());
        map.put("skipCount", skipCount);
        map.put("pageSize", pageSize);

        PaginationVO<Activity> vo = activityService.pageList(map);
        return vo;
    }

    @RequestMapping("/delete.do")
    @ResponseBody
    private boolean delete(HttpServletRequest request) {

        System.out.println("执行市场活动的删除操作");

        String[] ids = request.getParameterValues("id");

        boolean flag = activityService.delete(ids);

        return flag;
    }

    @RequestMapping("/getUserListAndActivity.do")
    @ResponseBody
    private Map<String, Object> getUserListAndActivity(String id) {

        System.out.println("进入到查询用户信息列表和根据市场活动id查询单条记录的操作");

        Map<String, Object> map = activityService.getUserListAndActivity(id);

        return map;
    }

    @RequestMapping("/update.do")
    @ResponseBody
    private boolean update(HttpServletRequest request, Activity a) {

        System.out.println("进入到用户信息修改的操作");

        a.setEditTime(DateTimeUtil.getSysTime());
        a.setEditBy(((User)request.getSession().getAttribute("user")).getName());

        boolean flag = activityService.update(a);

        return flag;

    }

    @RequestMapping("/detail.do")
    private ModelAndView detail(String id) {

        System.out.println("进入到跳转到详细信息页的操作");

        ModelAndView mv = new ModelAndView();

        Activity a = activityService.detail(id);

        mv.addObject("a", a);
        mv.setViewName("activity/detail");

        return mv;
    }

    @RequestMapping("/getRemarkListById.do")
    @ResponseBody
    private List<ActivityRemark> getRemarkListById(String activityId) {
        System.out.println("根据市场活动id，取得备注信息列表");
        
        List<ActivityRemark> aList = activityService.getRemarkListById(activityId);
        
        return aList;
    }
    
    @RequestMapping("/deleteRemark.do")
    @ResponseBody
    private boolean deleteRemark(String id) {

        System.out.println("根据备注id，删除对应备注");
        
        boolean flag = activityService.deleteRemark(id);

        return flag;
    }

    @RequestMapping("/saveRemark.do")
    @ResponseBody
    private Map<String, Object> saveRemark(HttpServletRequest request, String noteContent, String activityId) {
        System.out.println("添加备注操作");

        String name = ((User)request.getSession().getAttribute("user")).getName();

        Map<String, Object> map = new HashMap<>();
        
        ActivityRemark ar = new ActivityRemark();
        ar.setId(UUIDUtil.getUUID());
        ar.setNoteContent(noteContent);
        ar.setCreateTime(DateTimeUtil.getSysTime());
        ar.setCreateBy(name);
        ar.setEditFlag("0");
        ar.setActivityId(activityId);
        boolean flag = activityService.saveRemark(ar);

        map.put("success", flag);
        map.put("ar", ar);

        return map;

    }
    
    @RequestMapping("/updateRemark.do")
    @ResponseBody
    private Map<String, Object> updateRemark(HttpServletRequest request, String id, String noteContent) {
        System.out.println("进入修改备注内容操作");
        
        Map<String, Object> map = new HashMap<>();

        ActivityRemark ar = new ActivityRemark();
        ar.setId(id);
        ar.setNoteContent(noteContent);
        ar.setEditTime(DateTimeUtil.getSysTime());
        ar.setEditBy(((User)request.getSession().getAttribute("user")).getName());
        ar.setEditFlag("1");
        
        boolean flag = activityService.updateRemark(ar);
        map.put("success", flag);
        map.put("ar", ar);
        return map;
    }

}
