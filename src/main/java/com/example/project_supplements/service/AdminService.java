package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Commons;
import com.example.project_supplements.utils.Paginations;


@Service
@Transactional
public class AdminService {
    @Autowired
    SharedDao sharedDao;

    //user 테이블 리스트    
        public Map selecUserList(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminuser.mem";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
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
        String sqlMapId = "Adminuser.selectPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));

        return result;
    }

    // 페이지네이션 토탈용 
    public Object cntTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminuser.cntTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

 	// 본인 글 관리
     public Map admincommunity( Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminuser.admincommunity";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
   
    // 커뮤니티 글 삭제
    public Object delete(Map dataMap) {
        String sqlMapId = "Adminuser.delete";
        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }
    // 삭제 및 select
    public Object deleteAndSelectSearch(String COMMUNITY_ID, Map dataMap) {
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(dataMap));
        result.putAll(this.admincommunity(dataMap));
        return result;
    }   

    //해당 게시글보기
    public Object selectPost(String COMMUNITY_ID, Map dataMap) {
    // Object getOne(String sqlMapId, Object dataMap)
    String sqlMapId = "Adminuser.communityPost";
    dataMap.put("COMMUNITY_ID", COMMUNITY_ID); 
    HashMap result = new HashMap<>();
    result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    return result;
    }

    // 관리자 설문조사 관리
     public Map adminsurveylist(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminuser.adminsurveylist";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

}
    


  