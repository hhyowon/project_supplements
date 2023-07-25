package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.List;
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
            String uuid = commons.generateUUID();
            dataMap.put("COMMUNITY_ID", uuid);
        } else {
            // "COMMUNITY_ID"가 null이 아니고 빈 문자열도 아닌 경우 처리
        }
        Object result_1 = sharedDao.insert(sqlMapId, dataMap);
        HashMap result = (HashMap) this.selectWithPagination(dataMap);
        return result;
    
    }    

  
    //커뮤니티 테이블 리스트    
        public Map selectCommunity(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.community";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    //게시글보기
    public Object selectPost(String COMMUNITY_ID, Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Commu.communityPost";
        dataMap.put("COMMUNITY_ID", COMMUNITY_ID); 
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




  