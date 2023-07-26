package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.MypageService;


@Controller

@RequestMapping("/mypage")

public class MypageController {
    @Autowired
    MypageService mypageService;

    @GetMapping({" "})
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_BMI.jsp");
        return modelAndView;
    }

    //개인정보 db에서 가져오기 
    @GetMapping({"/main"})
    public ModelAndView mypagemain(@RequestParam Map params,ModelAndView modelAndView){
        
        Object result = mypageService.mypagemain(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypageMain.jsp");
        return modelAndView;
    }

    //개인정보 수정
    @GetMapping("/update")
    public ModelAndView updateForm( @RequestParam Map params,
            ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/mypage/mypageMain.jsp");
        return modelAndView;
    }

    @GetMapping("/updateAndSelectSearch")
    public ModelAndView updateAndSelectSearch( @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = mypageService.updateAndSelectSearch(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypageMain.jsp");

        return modelAndView;
    }

     // 내글 관리
    @GetMapping({"/community"})
    public ModelAndView community(@RequestParam Map params,ModelAndView modelAndView){
        
        Object result = mypageService.mypagecommunity(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_community.jsp");
        return modelAndView;
    }

    
    
    @GetMapping("/BMI")
    public ModelAndView selectSearch(@RequestParam Map params,ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = mypageService.mypageBMI(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_BMI.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }
}

