package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;

@Service
@Transactional
public class SurveyResultService {
     @Autowired
    SharedDao sharedDao;

    public Object surveyResult(Map<String, String> dataMap, String surveyTypeId) {
        String sqlMapId = "";
        if ("F-01".equals(surveyTypeId)) {
            sqlMapId = "SurveyResult.surveyresult_no";
        } else if ("F-02".equals(surveyTypeId)) {
            sqlMapId = "SurveyResult.surveyresult_yes";
        }
        
        HashMap<String, Object> result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }


    // public Object surveyResultNo(Map dataMap){
    //     String sqlMapId = "SurveyResult.surveyresult_no";
    //     HashMap result = new HashMap<>();
    //     result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    //     return result;
    // }

    //  public Object surveyResultYes(Map dataMap){
    //     String sqlMapId = "SurveyResult.surveyresult_yes";
    //     HashMap result = new HashMap<>();
    //     result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    //     return result;
    // }

}




