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

    // 설문 결과(합치기 성공)
    public Object surveyResult(Map dataMap){
            String sqlMapId = "SurveyResult.surveyresult_yes";
            HashMap result = new HashMap<>();
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

    //설문결과 페이지에 차트 구현위한 서비스
    public Object surveyresultProduct(Map dataMap) {
        String sqlMapId = "SurveyResult.surveyresult_product";
        
        Object surveyresultProduct = sharedDao.getList(sqlMapId, dataMap); 
        
        return surveyresultProduct; 
    }

   public Object surveyresultCause(Map dataMap) {
        String sqlMapId = "SurveyResult.surveyresult_cause";
    
        Object surveyresultCause = sharedDao.getList(sqlMapId, dataMap); 
        
        return surveyresultCause;
    }
    
}







