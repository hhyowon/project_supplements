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
public class CommunityService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commons;

    //모달창 게시글 작성용
    public Object insert(Map dataMap) {
        String sqlMapId = "Commu.insert";
        if (dataMap.get("COMMUNITY_ID") == null || dataMap.get("COMMUNITY_ID").equals("")) {
            // "COMMUNITY_ID"가 null이거나 빈 문자열인 경우 처리
            String uuid = commons.generateUUID(); // user_id 받기 (수정)
            dataMap.put("COMMUNITY_ID", uuid);
            dataMap.put("username", commons.getUserID()); //
            
        } else {
            // "COMMUNITY_ID"가 null이 아니고 빈 문자열도 아닌 경우 처리
        }
        Object result_1 = sharedDao.insert(sqlMapId, dataMap);
        HashMap result = (HashMap) this.selectWithPagination(dataMap);
        String rawDate = (String) result.get("COMMUNITY_DATE");
        return result;
    
    }    
    // 댓글 넣기
    public Object insertcomment(Map<String, String> dataMap) {
        String sqlMapId = "Commu.insertcomment";
         if (dataMap.get("COMMENT_ID") == null || dataMap.get("COMMENT_ID").equals("")) {
            // "COMMUNITY_ID"가 null이거나 빈 문자열인 경우 처리
            String uuid = commons.generateUUID(); // user_id 받기 (수정)
            dataMap.put("COMMENT_ID", uuid);
            dataMap.put("COMMENT_USER_ID", commons.getUserID());
            
        } else {
            // "COMMUNITY_ID"가 null이 아니고 빈 문자열도 아닌 경우 처리
        }
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }
    // 댓글 가져오기
    public Map selectcomment(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.selectcomment";
        HashMap result = new HashMap<>();
        result.put("username", commons.getUserID());
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
    // 댓글 넣고 가져오기
    public Object insertAndSelectcomment(String COMMUNITY_ID,Map dataMap) {
        HashMap result = new HashMap<>();
        result.put("insertCount", this.insertcomment(dataMap));
        result.putAll((Map) this.selectPostComment(COMMUNITY_ID, dataMap)); //map 형태로 바꿔줌
        return result;
    }
    // 댓글 삭제하기
    public Object deletecomment(Map dataMap, String COMMENT_ID) {
        String sqlMapId = "Commu.deletecomment";
         Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }
        public Object deleteandselectcomment(Map dataMap, String COMMENT_ID, String COMMUNITY_ID) {
        dataMap.put("COMMENT_ID", COMMENT_ID); // COMMENT_ID를 dataMap에 추가
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID); // COMMENT_ID를 dataMap에 추가
        HashMap result = new HashMap<>();
        result.put("delete", this.deletecomment(dataMap, COMMUNITY_ID));
        result.put("commentresult", this.selectcomment(dataMap));
        return result;
        // String sqlMapId = "commu.deleteComment";
        // String commentId = (String) dataMap.get("COMMENT_ID");
        //  bject result = sharedDao.delete(sqlMapId, commentId);
    }
    //커뮤니티 테이블 리스트    
        public Map selectCommunity(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.community";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    // //게시글보기
    // public Object selectPost(String COMMUNITY_ID, Map dataMap) {
    //     // Object getOne(String sqlMapId, Object dataMap)
    //     String sqlMapId = "Commu.communityPost";
    //     dataMap.put("COMMUNITY_ID", COMMUNITY_ID); 
    //     HashMap result = new HashMap<>();
    //     result.putAll(this.selectcomment(sqlMapId, dataMap));
    //     result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    //     return result;
    // }
    //게시글+댓글가져오기
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
        if(dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String)dataMap.get("currentPage"));    // from client in param
        }
        Paginations paginations = new Paginations(totalCount, currentPage); 
        HashMap result = new HashMap<>(totalCount, currentPage);
        result.put("paginations", paginations);
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.selectPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));

        return result;
    }

    // 페이지네이션 토탈용 
    public Object cntTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.cntTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

   

}