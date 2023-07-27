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
@RequestMapping("/admincommunity")
public class AdminCommunityControll {
    @Autowired
    AdminService adminService;

    @Autowired
    Commons commons;

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
