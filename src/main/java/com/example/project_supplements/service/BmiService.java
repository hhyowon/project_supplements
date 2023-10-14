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
        
        // "selectBMI" 메서드를 사용하여 해당 BMI 결과값과 타입만을 선택
        Map<String, Object> result = this.selectBMI((String) dataMap.get("USER_ID"));
        
        return result;

    }

    public String getUserGender(String userId) {
        String sqlMapId = "BMI.getUserGender"; // XML 쿼리 ID
        Map<String, Object> params = new HashMap<>();
        params.put("USER_ID", userId);

        String gender = (String) sharedDao.getOne(sqlMapId, params); // 단일 레코드 조회

        return gender;
    }
    
    public Map selectBMI(String userId) {
            // SQL 쿼리에서 USER_ID를 사용하여 해당 사용자의 BMI 결과를 가져옵니다.
            String sqlMapId = "BMI.resultBMI";
            
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("USER_ID", userId);
        
            // 해당 사용자의 BMI 결과를 가져옵니다.
            HashMap result = new HashMap<>();
            result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
            
            return result;
        }

        //차트구현을 위한 데이터를 가져오는 서비스
        public Object getAvgBMI(Map dataMap) {
            String sqlMapId = "BMI.BMI_avg";
            
            Object avgBMI = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.
            
            return avgBMI; // 가져온 데이터를 바로 반환합니다.
        }

       public Object maleBMItype(Map dataMap) {
            String sqlMapId = "BMI.BMI_TYPE_male";
        
            Object maleBMI = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.
            
            return maleBMI; // 가져온 데이터를 바로 반환합니다.
        }
        
        public Object femaleBMItype(Map dataMap) {
            String sqlMapId = "BMI.BMI_TYPE_female";
        
           Object femaleBMI = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.
            
            return femaleBMI; // 가져온 데이터를 바로 반환합니다.
        }
        
}

   