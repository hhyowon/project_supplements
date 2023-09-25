package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;
import com.example.project_supplements.utils.Paginations;


@Service
@Transactional
public class BmiService {
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
            // "BMI_UID"가 null이 아니고 빈 문자열도 아닌 경우 처리
        }
        String sqlMapId = "BMI.insertBMI";
        Object result_1 = sharedDao.insert(sqlMapId, dataMap);
        HashMap result = (HashMap) this.selectBMI(dataMap);
        return result;

    }

   public String getUserGender(String userId) {
    String sqlMapId = "BMI.getUserGender"; // XML 쿼리 ID
    Map<String, Object> params = new HashMap<>();
    params.put("USER_ID", userId);

    String gender = (String) sharedDao.getOne(sqlMapId, params); // 단일 레코드 조회

    return gender;
}
    
    public Object insert(Map dataMap) {
        String sqlMapId = "Diet.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }
        
    //커뮤니티 테이블 리스트    
        public Map selectBMI(Map dataMap) {
            // Object getOne(String sqlMapId, Object dataMap)
            String sqlMapId = "BMI.resultBMI";
            HashMap result = new HashMap<>();
            result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
            return result;
        }


}

   