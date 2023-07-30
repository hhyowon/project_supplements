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
import com.example.project_supplements.service.AdminService;
import com.example.project_supplements.utils.Commons;


@Controller

@RequestMapping("/admin")

public class AdminController {
    @Autowired
    AdminService adminService;

    @Autowired
    Commons commons;

    @GetMapping({"/"})
    public ModelAndView main(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        Object result = adminService.selectWithPagination(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/admin/admin_userList.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

    // 커뮤니티 관리
    @GetMapping({"/community"})
    public ModelAndView community(@RequestParam Map params,ModelAndView modelAndView){
        
        Object result = adminService.admincommunity(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_community.jsp");
        return modelAndView;
    }

    // 커뮤니티 delete
    @GetMapping("/deleteAndSelectSearch/{COMMUNITY_ID}")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, @PathVariable String COMMUNITY_ID, ModelAndView modelAndView) {
        Object result = adminService.deleteAndSelectSearch( COMMUNITY_ID, params); // 호출
        modelAndView.addObject("params", params); // modelAndView 객체에 params와 result를 추가
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/admin/admin_community.jsp");
        return modelAndView;
    }

    // 해당 게시글 가져오기
    @GetMapping({"/communityPost/{COMMUNITY_ID}"})
    public ModelAndView communityPost(@PathVariable String COMMUNITY_ID, @RequestParam Map params, ModelAndView modelAndView) {
            Object result = adminService.selectPost(COMMUNITY_ID, params);
    
            modelAndView.addObject("params", params);
            modelAndView.addObject("result", result);
            modelAndView.setViewName("/WEB-INF/views/admin/admin_community_post_comment.jsp");
            return modelAndView; 
    }



}
