package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.SignService;

@Controller
@RequestMapping("/signup")

public class SignController {
    @Autowired
    SignService signService;

    // INSERT
    @PostMapping({"/insert"})
    public ModelAndView insert(@RequestParam Map params, ModelAndView modelAndView) {

        Object result = signService.insertWithAuths(params);
        String viewName = "/WEB-INF/views/mainpage/main.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = " ", method = RequestMethod.GET)
    public ModelAndView insertForm(@RequestParam Map params, ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/login/signup.jsp");
        return modelAndView;
    }

}
