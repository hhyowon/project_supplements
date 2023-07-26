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
public class AdminCommunityService {
    @Autowired
    SharedDao sharedDao;

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
}
