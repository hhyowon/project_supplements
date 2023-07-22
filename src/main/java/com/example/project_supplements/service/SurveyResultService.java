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

    // 설문 결과 

    public Object surveyResult01(Map dataMap){
        String sqlMapId = "SurveyResult.surveyresult01";
        String result = (String)sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

}
