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
        HashMap firstresult = new HashMap<>();
        firstresult.put("firstresultList", sharedDao.getList(sqlMapId, dataMap));
        return firstresult;}

        public Object surveyRankSecond(Map dataMap){   
        String sqlMapId = "SurveyRank.surveyRankSecond";
        HashMap secondresult = new HashMap<>();
        secondresult.put("secondresultList", sharedDao.getList(sqlMapId, dataMap));
        return secondresult;}

       public Object surveyRankThird(Map dataMap){   
       String sqlMapId = "SurveyRank.surveyRankThird";
       HashMap thirdresult = new HashMap<>();
       thirdresult.put("thirdresultList", sharedDao.getList(sqlMapId, dataMap));
       return thirdresult;}
     
    }

