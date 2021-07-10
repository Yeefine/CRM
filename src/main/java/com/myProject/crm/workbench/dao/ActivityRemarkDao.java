package com.myProject.crm.workbench.dao;

import com.myProject.crm.workbench.domain.Activity;
import com.myProject.crm.workbench.domain.ActivityRemark;

import java.util.List;

public interface ActivityRemarkDao {
    int getCountByAids(String[] ids);

    int deleteByAids(String[] ids);

    List<ActivityRemark> getRemarkListById(String id);

    int deleteById(String id);

    int save(ActivityRemark ar);

    int update(ActivityRemark ar);
}
