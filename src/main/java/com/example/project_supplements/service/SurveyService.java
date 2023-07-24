package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.logging.log4j.util.StringMap;
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

    // 복용한자의 설문
    public Map surveyyes(Map dataMap) {
        String sqlMapId = "SurveyService.surveyyes";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 설문 값 DB로 입력
    public Object insertsurvey(Map dataMap) {
        String sqlMapId = "SurveyService.insertsurvey";

        // dataMap에 컬럼명과 아이디값을 하드코딩하여 추가
        String uuid = this.generateUUID();

        Map surveyMap = new HashMap<>();
        surveyMap.putAll(dataMap);
        dataMap.put("surveyMap", surveyMap);

        

        dataMap.put("SURVEY_ID", uuid);
        dataMap.put("USER_ID", "honggd123");
        dataMap.put("SURVEY_TYPE_ID", "F-01");

        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    // for (String key : dataMap.keySet()) {
    // if (key.equals(dataMap.get(key).toString())) {
    // return key;
    // }

    // dataMap.put("SURVEY_QUESTION_ID", requestget.mapkey)

    // dataMap.put("SURVEY_QUESTION_ID", SURVEY_QUESTION_ID);
    // dataMap.put("SURVEY_OPT_ID", SURVEY_OPT_ID);

    public Object insertsurveyAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();

        result.put("insertCount", this.insertsurvey(dataMap));
        // result.putAll(this.selectSearchsurvey(dataMap));
        return result;
    }

    private String generateUUID() {
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }

    // public Map selectSearchsurvey(Map dataMap) {
    // String sqlMapId = "SurveyService.search";

    // HashMap result = new HashMap<>();
    // result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    // return result;
    // }
}
