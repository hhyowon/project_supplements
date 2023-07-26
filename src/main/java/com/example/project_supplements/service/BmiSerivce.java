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


        public Object insertBMI(Map dataMap) {
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

    public Object insert(Map dataMap) {
        String sqlMapId = "Diet.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }
    
     public Object insertAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        result.put("insertCount", this.insert(dataMap));
        result.putAll(this.selectSearch(dataMap));
        return result;
    }

}

    //   // 개인정보 뽑아오기
    // public Map mypagemain( Map dataMap) {
    //     // Object getOne(String sqlMapId, Object dataMap)
    //     String sqlMapId = "MypageService.mypagemain";
    //     HashMap result = new HashMap<>();
    //     result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    //     return result;
    // }

    // //개인정보 수정 
    // public Object update(Map dataMap) {
    //     String sqlMapId = "MypageService.update";
    //     Object result = sharedDao.update(sqlMapId, dataMap);
    //     return result;
    // }

    // public Object updateAndSelectSearch( Map dataMap) {
    //     dataMap.put("USER_ID", "honggd123"); //유니크 아이디 받아와서 dataMap에 저장
    //     HashMap result = new HashMap<>();
    //     result.put("updateCount", this.update(dataMap));
    //     result.putAll(this.selectSearch(dataMap));
    //     return result;
    // }