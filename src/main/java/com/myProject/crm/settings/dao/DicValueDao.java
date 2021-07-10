package com.myProject.crm.settings.dao;

import com.myProject.crm.settings.domain.DicValue;

import java.util.List;

public interface DicValueDao {
    List<DicValue> getListByCode(String code);
}
