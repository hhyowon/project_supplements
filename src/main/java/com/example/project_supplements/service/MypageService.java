package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.util.StringMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Paginations;

@Service
@Transactional
public class MypageService {
    @Autowired
    SharedDao sharedDao;

    // 개인정보 뽑아오기
    public Map mypagemain( Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.mypagemain";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    //개인정보 수정 
    public Object update(Map dataMap) {
        String sqlMapId = "MypageService.update";
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object updateAndSelectSearch( Map dataMap) {
        dataMap.put("USER_ID", "honggd123"); //유니크 아이디 받아와서 dataMap에 저장
        HashMap result = new HashMap<>();
        result.put("updateCount", this.update(dataMap));
        result.putAll(this.selectSearch(dataMap));
        return result;
    }

     //select 로 불러오기 
     public Map selectSearch(Map dataMap) {
        String sqlMapId = "MypageService.mypagemain";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 본인 글 관리
    public Map mypagecommunity( Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.community";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 커뮤니티 글 삭제
    public Object delete(Map dataMap) {
        String sqlMapId = "MypageService.delete";
        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // 삭제 및 select
    public Object deleteAndSelectSearch(String COMMUNITY_ID, Map dataMap) {
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(dataMap));
        result.putAll(this.mypagecommunity(dataMap));
        return result;
    }   

    //해당 게시글보기
    public Object selectPost(String COMMUNITY_ID, Map dataMap) {
    // Object getOne(String sqlMapId, Object dataMap)
    String sqlMapId = "MypageService.communityPost";
    dataMap.put("COMMUNITY_ID", COMMUNITY_ID); 
    HashMap result = new HashMap<>();
    result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    return result;
    }
   
    //개인정보 수정 
    public Object communityupdate(Map dataMap) {
        String sqlMapId = "MypageService.communityupdate";
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object communityupdateAndSelectSearch( Map dataMap) {
        dataMap.put("USER_ID", "가배"); //유니크 아이디 받아와서 dataMap에 저장
        HashMap result = new HashMap<>();
        result.put("updateCount", this.communityupdate(dataMap));
        result.putAll(this.communityselectSearch(dataMap));
        return result;
    }

     //select 로 불러오기 
     public Map communityselectSearch(Map dataMap) {
        String sqlMapId = "MypageService.communityPost";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }


        // 본인 설문조사 조회
    public Map mypagesurveylist(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.surveylist";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
    // 본인 설문조사 내용 
      public Object mypagesurveycontent(String SURVEY_UID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.surveycontent";
        dataMap.put("SURVEY_UID", SURVEY_UID); 
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    private String generateUUID() {
        return null;
    }


        // 개인bmi select로 가져오기
    public Map mypageBMI( Map dataMap) {
        String sqlMapId = "MypageService.BMI";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }




}




    


