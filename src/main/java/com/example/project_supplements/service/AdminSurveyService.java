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
import com.example.project_supplements.utils.Paginations;

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

         // 관리자 설문조사 조회
        public Object adminsurveycontent(String SURVEY_UID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap);
        String sqlMapId = "Adminsurvey.adminsurveycontent";
        dataMap.put("SURVEY_UID", SURVEY_UID); 
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }


       // 관리자 부모테이블 설문조사 삭제
        public Object delete(Map dataMap) {
         String sqlMapId = "Adminsurvey.surveydelete";
         Object result = sharedDao.delete(sqlMapId, dataMap);
         return result;
     }


       // 관리자 자식테이블 설문조사 삭제
        public Object resultdelete(Map dataMap) {
         String sqlMapId = "Adminsurvey.surveyresultdelete";
         Object result = sharedDao.delete(sqlMapId, dataMap);
         return result;
     }

         // 관리자 설문조사 삭제 및 select
        public Object deleteAndSelectSearch(String SURVEY_UID, Map dataMap) {
         dataMap.put("SURVEY_UID", SURVEY_UID);
         HashMap result = new HashMap<>();
         result.put("deleteCount", this.delete(dataMap));
         result.put("deleteCount", this.resultdelete(dataMap));
         result.putAll(this.selectWithPagination(dataMap));
         return result;
     }   

       
        // 페이지네이션
        public Map selectWithPagination(Map dataMap) {
        // 페이지 형성을 위한 계산
        int totalCount = (int) this.cntTotal(dataMap);
        int currentPage = 1;
        if(dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String)dataMap.get("currentPage"));    // from client in param
        }
        Paginations paginations = new Paginations(totalCount, currentPage); 
        HashMap result = new HashMap<>(totalCount, currentPage);
        result.put("paginations", paginations);
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminsurvey.selectPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));

        return result;
    }

        // 페이지네이션 토탈용 
        public Object cntTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminsurvey.cntTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

}
