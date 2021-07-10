package com.myProject.crm.workbench.service.impl;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.utils.DateTimeUtil;
import com.myProject.crm.utils.UUIDUtil;
import com.myProject.crm.workbench.dao.*;
import com.myProject.crm.workbench.domain.*;
import com.myProject.crm.workbench.service.ClueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {

    // 线索相关表
    @Resource
    private ClueDao clueDao;
    @Resource
    private ClueActivityRelationDao clueActivityRelationDao;
    @Resource
    private ClueRemarkDao clueRemarkDao;

    // 客户相关表
    @Resource
    private CustomerDao customerDao;
    @Resource
    private CustomerRemarkDao customerRemarkDao;

    // 联系人相关表
    @Resource
    private ContactsDao contactsDao;
    @Resource
    private ContactsRemarkDao contactsRemarkDao;
    @Resource
    private ContactsActivityRelationDao contactsActivityRelationDao;

    // 交易相关表
    @Resource
    private TranDao tranDao;
    @Resource
    private TranHistoryDao tranHistoryDao;

    @Override
    public boolean save(Clue c) {
        boolean flag = true;

        int count = clueDao.save(c);
        if (count != 1) flag = false;

        return flag;
    }

    @Override
    public Clue detail(String id) {

        Clue c = clueDao.detail(id);

        return c;
    }

    @Override
    public boolean unbund(String id) {
        boolean flag = true;

        int count = clueActivityRelationDao.unbund(id);
        if (count != 1) flag = false;

        return flag;
    }

    @Override
    public boolean bund(String cid, String[] aids) {
        boolean flag = true;
        System.out.println("==============================");
        for(String aid : aids) {
            System.out.println(aid);
            ClueActivityRelation car = new ClueActivityRelation();
            car.setId(UUIDUtil.getUUID());
            car.setClueId(cid);
            car.setActivityId(aid);
            int count = clueActivityRelationDao.bund(car);
            if (count != 1) flag = false;
        }

        return flag;
    }

    @Override
    public boolean convert(String clueId, Tran t, String creatBy) {

        String createTime = DateTimeUtil.getSysTime();

        boolean flag = true;

        // 1.通过线索id获取线索对象（线索对象当中封装了线索的信息）
        Clue c = clueDao.getById(clueId);

        // 2.通过线索对象提取客户信息，当该客户不存在的时候，新建客户（根据公司的名称精确匹配，判断该客户是否存在！）
        String company = c.getCompany();
        Customer cus = customerDao.getCustomerByName(company);
        // 如果cus为空，说明没有这个客户，需要新建一个
        if (cus == null) {
            cus = new Customer();
            cus.setId(UUIDUtil.getUUID());
            cus.setAddress(c.getAddress());
            cus.setWebsite(c.getWebsite());
            cus.setPhone(c.getPhone());
            cus.setOwner(c.getOwner());
            cus.setNextContactTime(c.getNextContactTime());
            cus.setName(company);
            cus.setDescription(c.getDescription());
            cus.setCreateTime(createTime);
            cus.setCreateBy(creatBy);
            cus.setContactSummary(c.getContactSummary());

            int count1 = customerDao.save(cus);
            if (count1 != 1)    flag = false;
        }

        // 3.通过线索对象提取联系人信息，保存联系人
        Contacts con = new Contacts();
        con.setId(UUIDUtil.getUUID());
        con.setSource(c.getSource());
        con.setOwner(c.getOwner());
        con.setNextContactTime(c.getNextContactTime());
        con.setMphone(c.getMphone());
        con.setJob(c.getJob());
        con.setFullname(c.getFullname());
        con.setEmail(c.getEmail());
        con.setDescription(c.getDescription());
        con.setCustomerId(cus.getId());
        con.setCreateTime(createTime);
        con.setCreateBy(creatBy);
        con.setContactSummary(c.getContactSummary());
        con.setAppellation(c.getAppellation());
        con.setAddress(c.getAddress());
        // 添加联系人
        int count2 = contactsDao.save(con);
        if (count2 != 1)    flag = false;

        // 4.将线索备注转换到客户备注及联系人备注
        // 查询出与该线索关联的备注信息列表
        List<ClueRemark> clueRemarkList = clueRemarkDao.getListByClueId(clueId);
        // 取出每一条线索的备注
        for (ClueRemark clueRemark : clueRemarkList) {
            // 取出备注信息（主要转换到客户备注和联系人备注的就是这个备注信息）
            String noteContent = clueRemark.getNoteContent();

            // 创建客户备注对象，添加客户备注
            CustomerRemark customerRemark = new CustomerRemark();
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setCreateBy(creatBy);
            customerRemark.setCreateTime(createTime);
            customerRemark.setCustomerId(cus.getId());
            customerRemark.setEditFlag("0");
            customerRemark.setNoteContent(noteContent);
            int count3 = customerRemarkDao.save(customerRemark);
            if (count3 != 1)    flag = false;

            // 创建联系人备注对象，添加联系人备注
            ContactsRemark contactsRemark = new ContactsRemark();
            contactsRemark.setId(UUIDUtil.getUUID());
            contactsRemark.setCreateBy(creatBy);
            contactsRemark.setCreateTime(createTime);
            contactsRemark.setContactsId(con.getId());
            contactsRemark.setEditFlag("0");
            contactsRemark.setNoteContent(noteContent);
            int count4 = contactsRemarkDao.save(contactsRemark);
            if (count4 != 1)    flag = false;
        }

        // 5.“线索和市场活动”的关系转换到“联系人和市场活动”的关系
        // 查询出与该条线索关联的市场活动，查询与市场活动关联关系列表
        List<ClueActivityRelation> clueActivityRelationList = clueActivityRelationDao.getListByClueId(clueId);
        for (ClueActivityRelation clueActivityRelation : clueActivityRelationList) {
            String activityId = clueActivityRelation.getActivityId();

            ContactsActivityRelation contactsActivityRelation = new ContactsActivityRelation();
            contactsActivityRelation.setId(UUIDUtil.getUUID());
            contactsActivityRelation.setContactsId(con.getId());
            contactsActivityRelation.setActivityId(activityId);

            int count5 = contactsActivityRelationDao.save(contactsActivityRelation);
            if (count5 != 1)    flag = false;
        }

        // 6.如果有创建交易需求，创建一条交易
        if (t != null) {
            /*
                t对象在controller里面已经封装好的信息如下：
                    id，money，name，expectedDate，stage，activityId，createBy，createTime
             */
            t.setSource(c.getSource());
            t.setOwner(c.getOwner());
            t.setNextContactTime(c.getNextContactTime());
            t.setDescription(c.getDescription());
            t.setCustomerId(cus.getId());
            t.setContactsId(con.getId());
            t.setContactSummary(c.getContactSummary());
            // 添加交易
            int count6 = tranDao.save(t);
            if (count6 != 1)    flag = false;

            // 7.如果创建了交易，则创建一条该交易下的交易历史
            TranHistory th = new TranHistory();
            th.setId(UUIDUtil.getUUID());
            th.setCreateBy(creatBy);
            th.setCreateTime(createTime);
            th.setExpectedDate(t.getExpectedDate());
            th.setMoney(t.getMoney());
            th.setStage(t.getStage());
            th.setTranId(t.getId());
            // 添加交易历史
            int count7 = tranHistoryDao.save(th);
            if (count7 != 1)    flag = false;

        }

        // 8.删除线索备注
        for (ClueRemark clueRemark : clueRemarkList) {
            int count8 = clueRemarkDao.delete(clueRemark);
            if (count8 != 1)    flag = false;
        }

        // 9.删除线索和市场活动的关系
        for (ClueActivityRelation clueActivityRelation : clueActivityRelationList) {
            int count9 = clueActivityRelationDao.delete(clueActivityRelation);
            if (count9 != 1)    flag = false;
        }

        // 10.删除线索
        int count10 = clueDao.delete(clueId);
        if (count10 != 1)   flag = false;

        return flag;
    }
}
