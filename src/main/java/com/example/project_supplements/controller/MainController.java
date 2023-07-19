package com.example.project_supplements.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    @GetMapping({"/", "/home", "/main"})
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/mainpage/main.jsp");
        return modelAndView;
    }

    @GetMapping({"/login"})
    public ModelAndView login(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/login/login.jsp");
        return modelAndView;
    }

    @GetMapping({"/signup"})
    public ModelAndView signup(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/login/signup.jsp");
        return modelAndView;
    }
}
