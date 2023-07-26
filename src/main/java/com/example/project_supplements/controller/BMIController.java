package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
 
    @PostMapping("/insertBMI")
    @ResponseBody
    public String insertBMI(@RequestParam double height, @RequestParam double weight) {
        double result =  bmiSerivce.calculateBMI(height, weight);

        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("HEIGHT", height);
        dataMap.put("WEIGHT", weight);
        dataMap.put("BMI_RESULT", result);

         bmiSerivce.inserBMI(dataMap);

        return "성공적으로 BMI 데이터 삽입!." ;
    }

}



    