package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;
import com.example.project_supplements.utils.Paginations;


@Service
@Transactional
public class BmiSerivce {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commons;

        public Object inserBMI(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        if (dataMap.get("BMI_UID") == null || dataMap.get("BMI_UID").equals("")) {
            // "COMMUNITY_ID"가 null이거나 빈 문자열인 경우 처리
            String uuid = commons.generateUUID();
            dataMap.put("BMI_UID", uuid);
        } else {
            // "COMMUNITY_ID"가 null이 아니고 빈 문자열도 아닌 경우 처리
        }
        String sqlMapId = "BMI.insertBMI";
        Object result = sharedDao.insert(sqlMapId, dataMap);
      
        return result;
    }


}

  