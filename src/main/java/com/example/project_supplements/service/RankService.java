package com.example.project_supplements.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project_supplements.dao.SharedDao;

@Service
@Transactional
public class RankService {
    @Autowired 
    SharedDao sharedDao;

    //설문 랭킹 

       public Object surveyRankFirst(Map dataMap){
        String sqlMapId = "SurveyRank.surveyRankFirst";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }

    }

