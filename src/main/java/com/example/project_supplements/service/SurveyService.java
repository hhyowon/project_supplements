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
public class SurveyService {
    @Autowired
    SharedDao sharedDao;

    public Map surveyno(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "SurveyService.surveyno";
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
}
