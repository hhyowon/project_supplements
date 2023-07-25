package com.example.project_supplements.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.BmiSerivce;


@Controller

@RequestMapping("/bmi")

public class BMIController {
    @Autowired
    BmiSerivce bmiSerivce;

    @GetMapping({"/insertBMI"})
    public ModelAndView bmimain(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/bmi/bmi.jsp"); 
        return modelAndView;
    }
 
}



    