package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;

@Service
@Transactional
public class MypageService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commons;

 
    // 개인정보 뽑아오기
    public Map mypagemain(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.mypagemain";
        dataMap.put("USER_ID", commons.getUserID()); //USER_ID는 PrincipalUserService에 있는 username을 써야한다.
        // USER_ID에서 권한부분을 담당하는 곳이 PrincipalUserService인데  dataMap.put("username", username); 이 부분 참고
        // 그래서 selectByUIDWithAuths(Map dataMap)클래스에서 AuthsMapper에 selectWithUSERNAME에서 AND auths.USER_ID = #{username} 으로 씀
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
        ; //유니크 아이디 받아와서 dataMap에 저장
        HashMap result = new HashMap<>();
        result.put("updateCount", this.update(dataMap));
        result.putAll(this.selectSearch(dataMap));
        return result;
    }

     //select 로 불러오기 
     public Map selectSearch(Map dataMap) {
        String sqlMapId = "MypageService.mypagemain";
        dataMap.put("USER_ID", commons.getUserID());
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 본인 글 관리
    public Map mypagecommunity( Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.community";
        dataMap.put("USER_ID", commons.getUserID());
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }


    // 게시글 COMMENT TABAL COMMUNITY_ID 삭제
    public Object delete_comment(Map dataMap) {
        String sqlMapId = "AdminCommunity.deletecomment";
        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }
    // 게시글 COMMUNITY TABAL COMMUNITY_ID 삭제
    public Object delete_community(Map dataMap) {
        String sqlMapId = "AdminCommunity.deletecommunity";
         Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }
    
    // 삭제 및 select
    public Object deleteAndSelectSearch(String COMMUNITY_ID, Map dataMap) {
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        HashMap result = new HashMap<>();
        result.put("del_Coment_Count_", this.delete_comment(dataMap));
        result.put("del_Community_Count_", this.delete_community(dataMap));
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
   
    //커뮤니티 본인 글 수정 
    public Object communityupdate(String COMMUNITY_ID, Map dataMap) {
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        String sqlMapId = "MypageService.communityupdate"; 
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }
    //커뮤니티 본인글 수정후 목록 뽑기
    public Object communityupdateAndSelectSearch( String COMMUNITY_ID, Map dataMap) {
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        dataMap.put("USER_ID", commons.getUserID());
        HashMap result = new HashMap<>();
        result.put("updateCount", this.communityupdate(COMMUNITY_ID, dataMap));
        result.putAll((Map)this.mypagecommunity(dataMap));
        return result;
    }


        // 본인 설문조사 조회
     public Map mypagesurveylist(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        dataMap.put("USER_ID", commons.getUserID());
        String sqlMapId = "MypageService.surveylist";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
    
    // 본인 설문조사 내용 
      public Object mypagesurveycontent(String SURVEY_UID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        dataMap.put("SURVEY_UID", SURVEY_UID);
        String sqlMapId = "MypageService.surveycontent";
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
        dataMap.put("USER_ID", commons.getUserID());
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
    // 회원 탈퇴
    public Object dormant( Map dataMap) {
        dataMap.put("USER_ID", commons.getUserID());
        String sqlMapId = "MypageService.dormant"; 
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

}




    


