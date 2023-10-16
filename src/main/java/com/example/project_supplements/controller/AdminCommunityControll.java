package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.AdminCommunityService;
import com.example.project_supplements.service.CommunityService;
import com.example.project_supplements.utils.Commons;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admincommunity")
public class AdminCommunityControll {
    @Autowired
    AdminCommunityService adminCommunityService;

    @Autowired
    Commons commons;

    @Autowired
    private Gson gson;

    @Autowired
    CommunityService communityService;

    // 커뮤니티 관리
    @GetMapping({ "/" })
    public ModelAndView community(@RequestParam Map params, ModelAndView modelAndView) {

        Object result = adminCommunityService.selectWithPagination(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_community.jsp");
        return modelAndView;
    }

    @GetMapping({ "/selectSearch" })
    public ModelAndView communityselectSearch(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = adminCommunityService.selectWithPagination(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/admin/admin_community.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환

        // 서비스에서 데이터를 가져오고 JSON으로 변환하여 JSP로 전달
        Map<String, Object> avgBMIMap = new HashMap<>(); // 새로운 맵 생성
        Object resultComu = adminCommunityService.CommCount(avgBMIMap); // 빈 맵 전달
        String jsonData = gson.toJson(resultComu);
        modelAndView.addObject("dataArray", jsonData);

        return modelAndView;
    }

    // 커뮤니티 delete
    @GetMapping("/deleteAndSelectSearch/{COMMUNITY_ID}")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, @PathVariable String COMMUNITY_ID,
            ModelAndView modelAndView) {
        Object result = adminCommunityService.deleteAndSelectSearch(COMMUNITY_ID, params); // 호출
        modelAndView.addObject("params", params); // modelAndView 객체에 params와 result를 추가
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/admin/admin_community.jsp");
        return modelAndView;
    }

    // 해당 게시글 가져오기
    @GetMapping({ "/communityPost/{COMMUNITY_ID}" })
    public ModelAndView communityPost(@PathVariable("COMMUNITY_ID") String COMMUNITY_ID,
            @RequestParam Map<String, String> params, ModelAndView modelAndView) {
        params.put("COMMUNITY_ID", COMMUNITY_ID);
        Object result = communityService.selectPostComment(COMMUNITY_ID, params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/admin/admin_community_post_comment.jsp");
        return modelAndView;
    }

}
