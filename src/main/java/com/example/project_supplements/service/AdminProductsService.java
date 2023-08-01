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
public class AdminProductsService {
    @Autowired
    SharedDao sharedDao;
    
    @Autowired
    Commons commons;

    // 테이블 리스트    
        public Map select(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminproduct.searchList";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

       // 제품 삭제
        public Object delete(Map dataMap) {
            String sqlMapId = "Adminproduct.delete";
            Object result = sharedDao.delete(sqlMapId, dataMap);
            return result;
        }

        // 삭제 및 select
        public Object deleteAndSelectSearch(String PRODUCT_UID, Map dataMap) {
            dataMap.put("PRODUCT_UID", PRODUCT_UID);
            HashMap result = new HashMap<>();
            result.put("deleteCount", this.delete(dataMap));
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
        String sqlMapId = "Adminproduct.list";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));

        return result;
    }

    // 페이지네이션 토탈용 
    public Object cntTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Adminproduct.cntTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }


        //재품 추가하기
        public Object insert(Map dataMap) {
            String sqlMapId = "Adminproduct.insert";
            if (dataMap.get("PRODUCT_UID") == null || dataMap.get("PRODUCT_UID").equals("")) {
              
                String uuid = commons.generateUUID(); // user_id 받기 (수정)
                dataMap.put("PRODUCT_UID", uuid);
                dataMap.put("USER_ID", commons.getUserID()); 
            } else {
                
            }
            
            Object result_1 = sharedDao.insert(sqlMapId, dataMap);
            HashMap result = (HashMap) this.selectWithPagination(dataMap);
            return result;
        
        }    
}
    


  