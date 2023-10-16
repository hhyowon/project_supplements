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
public class AdminChartsService {
    
    @Autowired
    SharedDao sharedDao;

    public Object Commreviews(Map dataMap) {
        String sqlMapId = "AdminChart.Commreviews";
        Object CommRe = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.

        return CommRe; // 가져온 데이터를 바로 반환합니다.
    }
    
    public Object CommcoronaCount(Map dataMap) {
        String sqlMapId = "AdminChart.Commcorona";
    
       Object coronaCNT = sharedDao.getList(sqlMapId, dataMap); // 데이터맵을 사용하여 데이터를 가져옵니다.
        
        return coronaCNT; // 가져온 데이터를 바로 반환합니다.
    }

}
