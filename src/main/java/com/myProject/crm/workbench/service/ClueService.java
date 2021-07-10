package com.myProject.crm.workbench.service;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.workbench.domain.Clue;
import com.myProject.crm.workbench.domain.Tran;

import java.util.List;

public interface ClueService {

    boolean save(Clue c);

    Clue detail(String id);

    boolean unbund(String id);

    boolean bund(String cid, String[] aids);

    boolean convert(String clueId, Tran t, String creatBy);
}
