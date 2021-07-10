package com.myProject.crm.settings.service;

import com.myProject.crm.exception.LoginException;
import com.myProject.crm.settings.domain.User;

import java.util.List;

public interface UserService {

    User login(String loginAct, String loginPwd, String ip) throws LoginException;

    List<User> getUserList();
}
