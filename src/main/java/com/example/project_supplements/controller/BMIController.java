package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    @GetMapping({"/mainBMI"})
    public ModelAndView bmimain(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/bmi/bmi.jsp"); 
        return modelAndView;
    }

    // @GetMapping("/insertBMI")
    // public ModelAndView insertBMI(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
    //    // double result =  bmiSerivce.calculateBMI(height, weight);
    // // 모달에서 받아온 값들을 dataMap에 저장합니다.
    //     String height = params.get("HEIGHT"); // 모달에서 전달된  값
    //     String weight = params.get("WEIGHT"); // 모달에서 전달된  값
    //     String bmiresult = params.get("BMI_RESULT"); // 모달에서 전달된  값

    //     Map<String, Object> dataMap = new HashMap<>();
    //     dataMap.put("HEIGHT", height);
    //     dataMap.put("WEIGHT", weight);
    //     dataMap.put("BMI_RESULT", bmiresult);

    //     Object result = bmiSerivce.insertBMI(params);
    //     modelAndView.addObject("params", params);
    //     modelAndView.addObject("result", result);
    //     modelAndView.setViewName("/WEB-INF/views/bmi.jsp");

    //     return modelAndView;
    // }



 }



    