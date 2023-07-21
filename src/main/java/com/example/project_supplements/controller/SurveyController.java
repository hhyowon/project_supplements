package com.example.project_supplements.controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.DietService;
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
    public ModelAndView surveyyes(@RequestParam Map params,ModelAndView modelAndView){
        Object result = surveyService.surveyyes(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/survey/survey_yes.jsp");
        return modelAndView;
    }

    //설문 결과 INSERT
    @GetMapping("/insertsurvey")
    public ModelAndView insertsurvey(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = surveyService.insertsurvey(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mainpage/main.jsp");
        return modelAndView;
    }

    @GetMapping("/insertsurveyAndSelectSearch")
    public ModelAndView insertsurveyAndSelectSearch(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = surveyService.insertsurveyAndSelectSearch(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mainpage/main.jsp");

        return modelAndView;
    }
    
    // uuid    
    public String generateUUID() {
        return UUID.randomUUID().toString();
    }
    


    @GetMapping({"/result_yes"})
    public ModelAndView result_yes(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/survey/result_survey_yes.jsp");
        return modelAndView;
    }

    @GetMapping({"/result_no"})
    public ModelAndView result_no(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/survey/result_survey_no.jsp");
        return modelAndView;
    }


}




    