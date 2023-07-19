package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.DietService;


@Controller

@RequestMapping("/survey")

public class SurveyController {
    @Autowired
    DietService DietService;

    @GetMapping({" "})
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/survey/survey.jsp");
        return modelAndView;
    }

     @GetMapping({"/no"})
    public ModelAndView surveyno(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/survey/survey_no.jsp");
        return modelAndView;
    }

     @GetMapping({"/yes"})
    public ModelAndView surveyyes(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/survey/survey_yes.jsp");
        return modelAndView;
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




    