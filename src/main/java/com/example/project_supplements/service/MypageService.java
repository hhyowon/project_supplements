package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.util.StringMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        //result.putAll(this.selectSearch(dataMap));
        return result;
    }
     //샘플 테이블 리스트
     public Map selectSearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageService.search";
        
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
   
    private String generateUUID() {
        return null;
    }

}




    


