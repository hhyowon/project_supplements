package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.dao.SharedDao;

@Service
@Transactional
public class AdminSurveyService {
    @Autowired
    SharedDao sharedDao;

        // 관리자 설문조사 리스트 
     public Map adminsurveylist(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminsurvey.adminsurveylist";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    //     // 관리자 설문조사 조회
    //  public Object adminsurveycontent(String SURVEY_UID, Map dataMap) {
    //     // Object getOne(String sqlMapId, Object dataMap)
    //     String sqlMapId = "Adminsurvey.adminsurveycontent";
    //     dataMap.put("SURVEY_UID", SURVEY_UID); 
    //     HashMap result = new HashMap<>();
    //     result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    //     return result;
    // }


    //   // 관리자 설문조사 삭제
    //   public Object delete(Map dataMap) {
    //     String sqlMapId = "Adminsurvey.surveydelete";
    //     Object result = sharedDao.delete(sqlMapId, dataMap);
    //     return result;
    // }

    //     // 관리자 설문조사 삭제 및 select
    //    public Object deleteAndSelectSearch(String SURVEY_UID, Map dataMap) {
    //     dataMap.put("SURVEY_UID", SURVEY_UID);
    //     HashMap result = new HashMap<>();
    //     result.put("deleteCount", this.delete(dataMap));
    //     result.putAll(this.adminsurveylist(dataMap));
    //     return result;
    // }   


}
