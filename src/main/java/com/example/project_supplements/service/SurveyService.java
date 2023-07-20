package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Paginations;

@Service
@Transactional
public class SurveyService {
    @Autowired
    SharedDao sharedDao;

    // 복용하지 않는 자의 설문
    public Map surveyno(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "SurveyService.surveyno";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    //복용한자의 설문
    public Map surveyyes(Map dataMap) {
        String sqlMapId = "SurveyService.surveyyes";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 설문 값 입력
    public Object insertsurvey(Map dataMap) {
        String sqlMapId = "SurveyService.insertsurvey";

        // dataMap에 컬럼명과 아이디값을 하드코딩하여 추가
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("SURVEY_ID", "SU-01");
        resultMap.put("USER_ID", "honggd123");
    
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return resultMap;
    }
    
    //sample
    public Object insert(Map dataMap) {
        String sqlMapId = "Diet.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }
}

