package com.example.project_supplements.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;


@Service
@Transactional
public class AuthsService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commonUtils;

    public Object insert(Map dataMap) {
        List authList = new ArrayList<>();
        authList.add("ROLE_GUEST");  // default auth
        authList.add(dataMap.get("auth"));  // choosed auth
        dataMap.put("authList", authList);

        String sqlMapId = "Auths.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Map selectWithUSERNAME(Map dataMap) {
        String sqlMapId = "Auths.selectWithUSERNAME";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
}