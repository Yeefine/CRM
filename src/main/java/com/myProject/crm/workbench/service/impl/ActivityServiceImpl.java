package com.myProject.crm.workbench.service.impl;

import com.myProject.crm.settings.dao.UserDao;
import com.myProject.crm.settings.domain.User;
import com.myProject.crm.vo.PaginationVO;
import com.myProject.crm.workbench.dao.ActivityDao;
import com.myProject.crm.workbench.dao.ActivityRemarkDao;
import com.myProject.crm.workbench.domain.Activity;
import com.myProject.crm.workbench.domain.ActivityRemark;
import com.myProject.crm.workbench.service.ActivityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Resource
    private ActivityDao activityDao;
    @Resource
    private ActivityRemarkDao activityRemarkDao;
    @Resource
    private UserDao userDao;

    @Override
    public boolean save(Activity a) {
        boolean flag = true;
        int count = activityDao.save(a);
        if (count != 1) flag = false;
        return flag;
    }

    @Override
    public PaginationVO<Activity> pageList(Map<String, Object> map) {

        int total = activityDao.getTotalByCondition(map);

        List<Activity> aList = activityDao.getActivityListByCondition(map);

        PaginationVO<Activity> vo = new PaginationVO<>();

        vo.setTotal(total);
        vo.setDataList(aList);

        return vo;
    }

    @Override
    public boolean delete(String[] ids) {
        boolean flag = true;

        int count1 = activityRemarkDao.getCountByAids(ids);

        int count2 = activityRemarkDao.deleteByAids(ids);

        if (count1 != count2)   flag = false;

        int count3 = activityDao.delete(ids);
        if (count3 != ids.length)   flag = false;

        return flag;
    }

    @Override
    public Map<String, Object> getUserListAndActivity(String id) {

        Map<String, Object> map = new HashMap<>();

        List<User> uList = userDao.getUserList();

        Activity a = activityDao.getById(id);

        map.put("uList", uList);
        map.put("a", a);
        return map;
    }

    @Override
    public boolean update(Activity a) {

        boolean flag = true;

        int count = activityDao.update(a);
        if (count != 1) flag = false;

        return flag;
    }

    @Override
    public Activity detail(String id) {

        Activity a = activityDao.detail(id);

        return a;
    }

    @Override
    public List<ActivityRemark> getRemarkListById(String id) {

        List<ActivityRemark> arList = activityRemarkDao.getRemarkListById(id);

        return arList;
    }

    @Override
    public boolean deleteRemark(String id) {

        boolean flag = true;

        int count = activityRemarkDao.deleteById(id);

        if (count != 1) flag = false;

        return flag;
    }

    @Override
    public boolean saveRemark(ActivityRemark ar) {

        boolean flag = true;

        int count = activityRemarkDao.save(ar);

        if (count != 1) flag = false;

        return flag;
    }

    @Override
    public boolean updateRemark(ActivityRemark ar) {
        boolean flag = true;

        int count = activityRemarkDao.update(ar);

        if (count != 1) flag = false;

        return flag;
    }

    @Override
    public List<Activity> getActivityListByClueId(String clueId) {

        List<Activity> aList = activityDao.getActivityListByClueId(clueId);

        return aList;
    }

    @Override
    public List<Activity> getActivityListByNameAndNotByClueId(Map<String, String> map) {
        List<Activity> aList = activityDao.getActivityListByNameAndNotByClueId(map);
        return aList;
    }

    @Override
    public List<Activity> getActivityListByName(String aname) {

        List<Activity> aList = activityDao.getActivityListByName(aname);
        return aList;
    }
}
