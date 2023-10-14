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

    @GetMapping({ "" })
    public ModelAndView rank(@RequestParam Map<String, String> firstparams,
            @RequestParam Map<String, String> secondparams, @RequestParam Map<String, String> thirdparams,
            ModelAndView modelAndView) {
        Object firstresult = rankService.surveyRankFirst(firstparams);
        modelAndView.addObject("firstparams", firstparams);
        modelAndView.addObject("firstresult", firstresult);
        modelAndView.setViewName("/WEB-INF/views/rank/rank.jsp");

        Object secondresult = rankService.surveyRankSecond(secondparams);
        modelAndView.addObject("secondparams", secondparams);
        modelAndView.addObject("secondresult", secondresult);
        modelAndView.setViewName("/WEB-INF/views/rank/rank.jsp");

        Object thirdresult = rankService.surveyRankThird(thirdparams);
        modelAndView.addObject("thirdparams", thirdparams);
        modelAndView.addObject("thirdresult", thirdresult);
        modelAndView.setViewName("/WEB-INF/views/rank/rank.jsp");

        return modelAndView;
    }

}
