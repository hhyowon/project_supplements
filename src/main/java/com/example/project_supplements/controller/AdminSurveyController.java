package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.AdminSurveyService;
import com.example.project_supplements.utils.Commons;

@Controller

@RequestMapping("/adminsurvey")

public class AdminSurveyController {
       @Autowired
       AdminSurveyService adminSurveyService;

    @Autowired
    Commons commons;

         // 설문조사 관리
    @GetMapping({"/surveyList"})
    public ModelAndView surveyList(@RequestParam Map params,ModelAndView modelAndView){
        
        Object result = adminSurveyService.adminsurveylist(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_surveylist.jsp");
        return modelAndView;
    }
            // 설문조사 결과 조회 
    // @GetMapping({"/surveyContent"})
    // public ModelAndView surveyContent(@RequestParam Map params,ModelAndView modelAndView){
        
    //     Object result = adminSurveyService.adminsurveycontent(params);
    //     modelAndView.addObject("params", params);
    //     modelAndView.addObject("result", result);
    //     modelAndView.setViewName("/WEB-INF/views/admin/admin_surveycontent.jsp");
    //     return modelAndView;
    // }


}
