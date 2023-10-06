package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.*;

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

    

    @RequestMapping("/checkDuplicateId")
    public ResponseEntity<Map<String, Boolean>> checkDuplicateId(@RequestBody Map<String, String> request) {
    String userId = request.get("userId");

    // 중복 확인 로직을 구현하고 결과 반환
    boolean isDuplicate = signService.checkID(userId);

    Map<String, Boolean> response = new HashMap<>();
    response.put("isDuplicate", isDuplicate);
    
    return ResponseEntity.ok(response);
}

        
}
