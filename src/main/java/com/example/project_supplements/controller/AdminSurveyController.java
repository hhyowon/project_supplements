package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    @GetMapping({"/surveyList"})
    public ModelAndView surveyList(@RequestParam Map params,ModelAndView modelAndView){
        
        Object result = adminSurveyService.adminsurveylist(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_surveylist.jsp");
        return modelAndView;
    }
    //     // 설문조사 결과 조회 
    // @GetMapping({"/surveyContent/{SURVEY_UID}"})
    // public ModelAndView surveyContent(@RequestParam Map params,@PathVariable String SURVEY_UID, ModelAndView modelAndView){
        
    //     Object result = adminSurveyService.adminsurveycontent(SURVEY_UID, params);
    //     modelAndView.addObject("params", params);
    //     modelAndView.addObject("result", result);
    //     modelAndView.setViewName("/WEB-INF/views/admin/admin_surveycontent.jsp");
    //     return modelAndView;
    //  }

   
    //         // 설문조사 리스트 삭제 
    // @GetMapping("/deleteAndSelectSearch/{SURVEY_UID}")
    // public ModelAndView deleteAndSelectSearch(@RequestParam Map params, @PathVariable String SURVEY_UID, ModelAndView modelAndView) {
    //     Object result = adminSurveyService.deleteAndSelectSearch( SURVEY_UID, params); 
    //     modelAndView.addObject("params", params); 
    //     modelAndView.addObject("result", result);

    //     modelAndView.setViewName("/WEB-INF/views/admin/admin_surveylist.jsp");
    //     return modelAndView;
    // }


}
