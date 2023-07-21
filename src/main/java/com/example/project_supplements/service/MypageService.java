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

   
    private String generateUUID() {
        return null;
    }

}




    


