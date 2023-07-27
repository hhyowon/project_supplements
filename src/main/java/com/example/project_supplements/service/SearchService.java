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
public class SearchService  {
    @Autowired
    SharedDao sharedDao;
    
    //커뮤니티 테이블 리스트    
    public Map selectCommunitySearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Search.searchList";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }


                // 페이지네이션 search
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
            String sqlMapId = "Search.list";
            dataMap.put("pageScale", paginations.getPageScale());
            dataMap.put("pageBegin", paginations.getPageBegin());
            result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
    
            return result;
        }

           // 페이지네이션 토탈용 
    public Object cntTotal(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Search.cntTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

}
