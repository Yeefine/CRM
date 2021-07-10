package com.myProject.crm.workbench.dao;

import com.myProject.crm.settings.domain.User;
import com.myProject.crm.workbench.domain.Clue;

import java.util.List;

public interface ClueDao {

    int save(Clue a);

    Clue detail(String id);

    Clue getById(String id);

    int delete(String clueId);
}
