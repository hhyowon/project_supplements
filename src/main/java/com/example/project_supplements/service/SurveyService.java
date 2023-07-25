package com.example.project_supplements.service;

import java.text.SimpleDateFormat;
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
        result.put("SURVEY_TYPE_ID",dataMap.get("SURVEY_TYPE_ID"));
        return result;
    }

    // 복용한자의 설문
    public Map surveyyes(Map dataMap) {
        String sqlMapId = "SurveyService.surveyyes";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        result.put("SURVEY_TYPE_ID",dataMap.get("SURVEY_TYPE_ID"));
        return result;
    }


    // 설문 값 DB로 입력(복용안한자)
    public Object insertAndSelectSurvey(Map<String,Object> dataMap) {
        // question와 answer Map을 List에 담기
        HashMap<String, Object> result = new HashMap<>();
        //result.put("insertCount", this.insertsurvey(dataMap));
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
        // 부모테이블 값 insert 먼저 시키기 
        String SURVEY_UID = UUID.randomUUID().toString();
        dataMap.put("SURVEY_UID", SURVEY_UID);
        dataMap.put("USER_ID", "honggd123");
        dataMap.put("DATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        String sqlMapId = "SurveyService.insertsurveyresult";
        Object result01 = sharedDao.insert(sqlMapId, dataMap);

        // 자식테이블 insert

        dataMap.put("SURVEY_TYPE_ID", "F-01");
        sqlMapId = "SurveyService.insertsurvey";
        Object resultMap = sharedDao.insert(sqlMapId, dataMap);
        //String uuid = this.generateUUID();
        return dataMap;
    }

    // 설문 값 DB로 입력(복용한자)
    public Object insertAndSelectSurvey_yes( Map<String,Object> dataMap) {
        // question와 answer Map을 List에 담기
        HashMap<String, Object> result = new HashMap<>();
        //result.put("insertCount", this.insertsurvey(dataMap));
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
        // 부모테이블 값 insert 먼저 시키기 
        String SURVEY_UID = UUID.randomUUID().toString();
        dataMap.put("SURVEY_UID", SURVEY_UID);
        dataMap.put("USER_ID", "honggd123");
        dataMap.put("DATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        String sqlMapId = "SurveyService.insertsurveyresult";
        Object result01 = sharedDao.insert(sqlMapId, dataMap);

        // 자식테이블 insert
        //dataMap.put("SURVEY_TYPE_ID", SU);
        dataMap.put("SURVEY_TYPE_ID", "F-02");
        sqlMapId = "SurveyService.insertsurvey";
        Object resultMap = sharedDao.insert(sqlMapId, dataMap);
        String uuid = this.generateUUID();
        return dataMap;
    }


    private String generateUUID() {
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }

}
