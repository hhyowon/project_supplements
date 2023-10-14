package com.example.project_supplements.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @GetMapping({ "/loginForm" }) // 로그인 폼 작성
    public ModelAndView loginForm(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/login/loginForm.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({ "/logoutForm" }) // 로그아웃 폼 작성
    public ModelAndView logoutForm(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/security/logoutForm.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
