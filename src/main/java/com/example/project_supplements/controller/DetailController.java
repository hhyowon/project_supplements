package com.example.project_supplements.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.DietService;


@Controller

@RequestMapping("/selectDetail")

public class DetailController {
    @Autowired
    DietService DietService;

    @GetMapping({" "})
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/DetailForm.jsp");
        return modelAndView;
    }
}

