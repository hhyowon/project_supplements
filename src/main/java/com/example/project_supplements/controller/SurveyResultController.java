package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.SurveyResultService;

@Controller

@RequestMapping("/surveyresult")

public class SurveyResultController {
    @Autowired 
    SurveyResultService surveyResultService;

    //한개로 만들기
        @GetMapping({"/result"})
        public ModelAndView result(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
            String surveyTypeId = params.get("SURVEY_TYPE_ID"); // 이렇게 surveyTypeId를 가져옵니다.
            Object result = surveyResultService.surveyResult(params, surveyTypeId); // surveyTypeId를 서비스로 전달합니다.
        
            modelAndView.addObject("params", params);
            modelAndView.addObject("result", result);
            modelAndView.setViewName("/WEB-INF/views/survey/result_survey.jsp");
            return modelAndView;
        }
    //  @GetMapping({"/result_yes"})
    //  public ModelAndView result_yes(@RequestParam Map params, ModelAndView modelAndView){
        
    //     Object result = surveyResultService.surveyResultYes(params);
    //      modelAndView.addObject("params", params);
    //      modelAndView.addObject("result", result);
    //      modelAndView.setViewName("/WEB-INF/views/survey/result_survey_yes.jsp");
    //      return modelAndView;
    //  }

    //  @GetMapping({"/result_no"})
    //  public ModelAndView result_no(@RequestParam Map params, ModelAndView modelAndView){
    //      Object result = surveyResultService.surveyResultNo(params);

    //      modelAndView.addObject("params", params);
    //      modelAndView.addObject("result", result);
    //      modelAndView.setViewName("/WEB-INF/views/survey/result_survey_no.jsp");
    //      return modelAndView;
    //  }
     
     

}



