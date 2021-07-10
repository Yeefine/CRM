package com.myProject.crm.workbench.service.impl;

import com.myProject.crm.utils.DateTimeUtil;
import com.myProject.crm.utils.UUIDUtil;
import com.myProject.crm.workbench.dao.CustomerDao;
import com.myProject.crm.workbench.dao.TranDao;
import com.myProject.crm.workbench.dao.TranHistoryDao;
import com.myProject.crm.workbench.domain.Customer;
import com.myProject.crm.workbench.domain.Tran;
import com.myProject.crm.workbench.domain.TranHistory;
import com.myProject.crm.workbench.service.TranService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TranServiceImpl implements TranService {

    @Resource
    private TranDao tranDao;
    @Resource
    private TranHistoryDao tranHistoryDao;
    @Resource
    private CustomerDao customerDao;

    @Override
    public boolean save(Tran t, String customerName) {
        /*
               1. 判断customerName，根据客户名称在客户表进行精确查询
                    如果有这个客户，则取出这个客户的id，封装到t对象中
                    如果没有这个客户，则在客户表新建一条客户信息，然后将新建的客户的id取出，封装到t对象中

               2. 经过以上操作后，t对象的信息就全了，需要执行添加交易的操作

               3. 添加交易完毕后，需要创建一条交易历史
         */
        boolean flag = true;


        Customer cus = customerDao.getCustomerByName(customerName);

        if (cus == null) {
            cus = new Customer();
            cus.setId(UUIDUtil.getUUID());
            cus.setName(customerName);
            cus.setCreateBy(t.getCreateBy());
            cus.setCreateTime(DateTimeUtil.getSysTime());
            cus.setContactSummary(t.getContactSummary());
            cus.setNextContactTime(t.getNextContactTime());
            cus.setOwner(t.getOwner());

            int count1 = customerDao.save(cus);
            if (count1 != 1)    flag = false;

        }

        t.setCustomerId(cus.getId());

        // 添加交易
        int count2 = tranDao.save(t);
        if (count2 != 1)    flag = false;

        // 添加交易历史
        TranHistory th = new TranHistory();
        th.setId(UUIDUtil.getUUID());
        th.setTranId(t.getId());
        th.setStage(t.getStage());
        th.setMoney(t.getMoney());
        th.setExpectedDate(t.getExpectedDate());
        th.setCreateTime(t.getCreateTime());
        th.setCreateBy(t.getCreateBy());

        int count3 = tranHistoryDao.save(th);
        if (count3 != 1)    flag = false;

        return flag;
    }

    @Override
    public Tran detail(String id) {
        Tran t = tranDao.detail(id);
        return t;
    }

    @Override
    public List<TranHistory> getHistoryListByTranId(String tranId) {

        List<TranHistory> tList = tranHistoryDao.getHistoryListByTranId(tranId);

        return tList;
    }

    @Override
    public boolean changeStage(Tran t) {
        boolean flag = true;

        int count1 = tranDao.changeStage(t);
        if (count1 != 1) flag = false;

        TranHistory th = new TranHistory();
        th.setId(UUIDUtil.getUUID());
        th.setStage(t.getStage());
        th.setMoney(t.getMoney());
        th.setExpectedDate(t.getExpectedDate());
        th.setCreateTime(t.getEditTime());
        th.setCreateBy(t.getEditBy());
        th.setTranId(t.getId());

        int count2 = tranHistoryDao.save(th);
        if (count2 != 1)    flag = false;

        return flag;
    }

    @Override
    public Map<String, Object> getCharts() {

        // 取得total
        int total = tranDao.getTotal();

        // 取得dataList
        List<Map<String, Object>> dataList = tranDao.getCharts();

        // 将total和dataList保存到map中
        Map<String, Object> map = new HashMap<>();
        map.put("total", total);
        map.put("dataList", dataList);

        // 返回map
        return map;
    }
}
