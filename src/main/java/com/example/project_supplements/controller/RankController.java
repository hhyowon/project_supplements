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

@RequestMapping("/rank")

public class RankController {
    @Autowired
    DietService DietService;

    @GetMapping({" "})
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/rank.jsp");
        return modelAndView;
    }
}



    