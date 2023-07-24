package com.example.project_supplements.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Date;

import org.apache.logging.log4j.util.StringMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;
import com.example.project_supplements.utils.Paginations;

@Service
@Transactional
public class SurveyService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commons;
    

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

    // 설문 결과 insert하기 위해서 부모테이블 insert 
     public Object insertsurvey(Map dataMap) {
        String SURVEY_UID = UUID.randomUUID().toString();
        dataMap.put("SURVEY_UID", SURVEY_UID);
        //dataMap.put("SURVEY_UID", this.generateUUID());
        dataMap.put("USER_ID", "honggd123");
        dataMap.put("DATE_TIME", new Date() );
        String sqlMapId = "SurveyService.insertsurveyresult";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    // 설문 값 DB로 입력
    public Object insertAndSelectSurvey(Map<String,Object> dataMap) {
        // question와 answer Map을 List에 담기
        HashMap<String, Object> result = new HashMap<>();
        result.put("insertCount", this.insertsurvey(dataMap));
        List surveyMapList = new ArrayList<Map>();
        for (String questionId : dataMap.keySet()) {
            Map<String, String> questionAnswerMap = new HashMap<>();
            String answerId = (String) dataMap.get(questionId);
            questionAnswerMap.put("QuestionId", questionId);
            questionAnswerMap.put("AnswerId", answerId);
            questionAnswerMap.put("SURVEY_ID", this.generateUUID());
            surveyMapList.add(questionAnswerMap);
        }
        dataMap.put("surveyMapList", surveyMapList);
        String sqlMapId = "SurveyService.insertsurvey";
      
        //HashMap result = new HashMap<>();
        
        // result.putAll(this.selectSearch(dataMap));

        String uuid = this.generateUUID();
        dataMap.put("SURVEY_TYPE_ID", "F-01");
       
        return result;
    }

    public Map selectSearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "SurveyService.insertsurvey";
        
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
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
