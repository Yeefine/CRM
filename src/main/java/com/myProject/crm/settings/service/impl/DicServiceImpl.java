package com.myProject.crm.settings.service.impl;

import com.myProject.crm.settings.dao.DicTypeDao;
import com.myProject.crm.settings.dao.DicValueDao;
import com.myProject.crm.settings.domain.DicType;
import com.myProject.crm.settings.domain.DicValue;
import com.myProject.crm.settings.service.DicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DicServiceImpl implements DicService {
//    @Resource
    private DicTypeDao dicTypeDao;
//    @Resource
    private DicValueDao dicValueDao;

    public DicTypeDao getDicTypeDao() {
        return dicTypeDao;
    }

    public void setDicTypeDao(DicTypeDao dicTypeDao) {
        this.dicTypeDao = dicTypeDao;
    }

    public DicValueDao getDicValueDao() {
        return dicValueDao;
    }

    public void setDicValueDao(DicValueDao dicValueDao) {
        this.dicValueDao = dicValueDao;
    }
    @Override
    public Map<String, List<DicValue>> getAll() {
        Map<String, List<DicValue>> map = new HashMap<>();

        // 将字典类型列表取出
        List<DicType> dtList = dicTypeDao.getTypeList();

        // 根据每一个字典类型来取得字典值列表
        for (DicType dt : dtList) {
            String code = dt.getCode();

            List<DicValue> dvList = dicValueDao.getListByCode(code);

            map.put(code+"List", dvList);
        }


        return map;
    }
}
