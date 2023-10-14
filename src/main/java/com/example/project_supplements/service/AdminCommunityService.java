package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;
import com.example.project_supplements.utils.Paginations;

@Service
@Transactional
public class AdminCommunityService {
    
    @Autowired
    SharedDao sharedDao;

    // 본인 글 관리
    public Map admincommunity(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "AdminCommunity.admincommunity";
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
        result.putAll(this.selectWithPagination(dataMap));
        return result;
    }

    // 해당 게시글보기
    public Object selectPost(String COMMUNITY_ID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "AdminCommunity.communityPost";
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 댓글 가져오기
    public Map selectcomment(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.selectcomment";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 게시글+댓글가져오기
    public Object selectPostComment(String COMMUNITY_ID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.communityPost";
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID);
        HashMap result = new HashMap<>();
        result.put("commentresult", this.selectcomment(dataMap));
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // 페이지네이션
    public Map selectWithPagination(Map dataMap) {
        // 페이지 형성을 위한 계산
        int totalCount = (int) this.cntTotal(dataMap);
        int currentPage = 1;
        if (dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String) dataMap.get("currentPage")); // from client in param
        }
        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>(totalCount, currentPage);
        result.put("paginations", paginations);
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "AdminCommunity.selectPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));

        return result;
    }

    // 페이지네이션 토탈용
    public Object cntTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "AdminCommunity.cntTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object CommCount(Map dataMap) {
        String sqlMapId = "AdminCommunity.CommCount";
    
        Object CommCNT = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.
        
        return CommCNT; // 가져온 데이터를 바로 반환합니다.
    }
    
    public Object CommcoronaCount(Map dataMap) {
        String sqlMapId = "AdminCommunity.Commcorona";
    
       Object coronaCNT = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.
        
        return coronaCNT; // 가져온 데이터를 바로 반환합니다.
    }

}
