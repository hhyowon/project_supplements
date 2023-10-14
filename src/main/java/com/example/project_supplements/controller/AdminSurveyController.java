package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.AdminSurveyService;

@Controller

@RequestMapping("/adminsurvey")

public class AdminSurveyController {
    @Autowired
    AdminSurveyService adminSurveyService;

    // 설문조사 리스트 관리
    @GetMapping({ "/surveyList" })
    public ModelAndView surveyList(@RequestParam Map params, ModelAndView modelAndView) {

        Object result = adminSurveyService.selectWithPagination(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_surveylist.jsp");
        return modelAndView;
    }

    // 설문조사 결과 조회
    @GetMapping({ "/surveyContent/{SURVEY_UID}" })
    public ModelAndView surveyContent(@RequestParam Map params, @PathVariable String SURVEY_UID,
            ModelAndView modelAndView) {

        Object result = adminSurveyService.adminsurveycontent(SURVEY_UID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_surveycontent.jsp");
        return modelAndView;
    }

    // 설문조사 리스트 삭제
    @GetMapping("/deleteAndSelectSearch/{SURVEY_UID}")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, @PathVariable String SURVEY_UID,
            ModelAndView modelAndView) {

        Object result = adminSurveyService.deleteAndSelectSearch(SURVEY_UID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_surveylist.jsp");
        return modelAndView;
    }

    // 설문조사 검색
    @GetMapping({ "/selectSearch" })
    public ModelAndView selectSearch(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = adminSurveyService.selectWithPagination(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/admin/admin_surveylist.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

}
