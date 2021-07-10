package com.myProject.crm.settings.service.impl;

import com.myProject.crm.exception.LoginException;
import com.myProject.crm.settings.dao.UserDao;
import com.myProject.crm.settings.domain.User;
import com.myProject.crm.settings.service.UserService;
import com.myProject.crm.utils.DateTimeUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User login(String loginAct, String loginPwd, String ip) throws LoginException {

        Map<String, Object> map = new HashMap<>();
        map.put("loginAct", loginAct);
        map.put("loginPwd", loginPwd);

        User user = userDao.login(map);

        if (user == null) {
            throw new LoginException("账号密码错误");
        }

        // 判断是否到期
        String expireTime = user.getExpireTime();
        String currentTime = DateTimeUtil.getSysTime();
        if (expireTime.compareTo(currentTime) < 0) {
            throw new LoginException("账号已失效");
        }

        // 判断锁定状态
        String lockState = user.getLockState();
        if ("0".equals(lockState)) {
            throw new LoginException("账号已锁定");
        }

        // 判断ip地址
        String allowIps = user.getAllowIps();
        if (allowIps.contains(ip)) {
            throw new LoginException("ip地址受限");
        }

        return user;
    }

    @Override
    public List<User> getUserList() {

        List<User> uList = userDao.getUserList();
        
        return uList;
    }
}
