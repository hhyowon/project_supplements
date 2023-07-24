package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.RankService;


@Controller

@RequestMapping("/rank")

public class RankController {
    @Autowired
    RankService rankService;

    @GetMapping({"rank/rank"})
    public ModelAndView rank(@RequestParam Map<String, String> params,ModelAndView modelAndView){
        Object result = rankService.surveyRankFirst(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/rank/rank.jsp");
        return modelAndView;
    }
}



    