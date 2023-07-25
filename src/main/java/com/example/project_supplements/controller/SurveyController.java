package com.example.project_supplements.controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.SurveyResultService;
import com.example.project_supplements.service.SurveyService;


@Controller

@RequestMapping("/survey")

public class SurveyController {
    @Autowired
    SurveyService surveyService;

  
    @GetMapping({" "})
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/survey/survey.jsp");
        return modelAndView;
    }

    //복용하지 않는자의 설문지 뽑아오기 
     @GetMapping({"/no"})
    public ModelAndView surveyno(@RequestParam Map params, ModelAndView modelAndView){
        Object result = surveyService.surveyno( params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/survey/survey_no.jsp");
        return modelAndView;
    }

    //복용한자의 설문지 뽑아오기
     @GetMapping({"/yes"})
    public ModelAndView surveyyes( @RequestParam Map params,ModelAndView modelAndView){
        Object result = surveyService.surveyyes(params);
        modelAndView.addObject("params", params); 
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/survey/survey_yes.jsp");
        return modelAndView;
    }

    //설문 결과 INSERT(복용안한자)
    @GetMapping("/insertAndSelectSurvey")
    public ModelAndView insertAndSelectSurvey(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = surveyService.insertAndSelectSurvey(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mainpage/main.jsp");

        return modelAndView;
    }

    //설문 결과 INSERT(복용한자)
    @GetMapping("/insertAndSelectSurvey_yes")
    public ModelAndView insertAndSelectSurvey_yes( @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = surveyService.insertAndSelectSurvey_yes(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mainpage/main.jsp");

        return modelAndView;
    }

    // uuid    
    public String generateUUID() {
        return UUID.randomUUID().toString();
    }


}




    