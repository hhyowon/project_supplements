package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.MypageService;
import com.example.project_supplements.utils.Commons;

@Controller

@RequestMapping("/mypage")

public class MypageController {
    @Autowired
    MypageService mypageService;

    @Autowired
    Commons commons;

    @GetMapping({ " " })
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_BMI.jsp");
        return modelAndView;
    }

    // 개인정보 db에서 가져오기
    @GetMapping({ "/main" })
    public ModelAndView mypagemain(@RequestParam Map params, ModelAndView modelAndView) {

        Object result = mypageService.mypagemain(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypageMain.jsp");
        return modelAndView;
    }

    // 개인정보 수정
    @GetMapping("/update")
    public ModelAndView updateForm(@RequestParam Map params,
            ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/mypage/mypageMain.jsp");
        return modelAndView;
    }

    @GetMapping("/updateAndSelectSearch")
    public ModelAndView updateAndSelectSearch(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = mypageService.updateAndSelectSearch(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypageMain.jsp");

        return modelAndView;
    }

    // 내글 관리
    @GetMapping({ "/community" })
    public ModelAndView community(@RequestParam Map params, ModelAndView modelAndView) {
        String userId = commons.getUserID(); // user_id 받기

        Object result = mypageService.mypagecommunity(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_community.jsp");
        return modelAndView;
    }

    // 커뮤니티 delete
    @GetMapping("/deleteAndSelectSearch/{COMMUNITY_ID}")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, @PathVariable String COMMUNITY_ID,
            ModelAndView modelAndView) {
        Object result = mypageService.deleteAndSelectSearch(COMMUNITY_ID, params); // 호출
        modelAndView.addObject("params", params); // modelAndView 객체에 params와 result를 추가
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_community.jsp");
        return modelAndView;
    }

    // 해당 게시글 가져오기
    @GetMapping({ "/communityPost/{COMMUNITY_ID}" })
    public ModelAndView communityPost(@PathVariable String COMMUNITY_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = mypageService.selectPost(COMMUNITY_ID, params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_community_post_comment.jsp");
        return modelAndView;
    }

    // 탈퇴하기
    @GetMapping("/dormant")
    public ModelAndView dormant(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = mypageService.dormant(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("redirect:/logout"); // 메인 화면으로 리다이렉트
        return modelAndView;
    }

    // 커뮤니티 게시글 수정
    // @GetMapping("/communityupdate")
    // public ModelAndView updateForm( @RequestParam Map params,ModelAndView
    // modelAndView) {
    // modelAndView.setViewName("/WEB-INF/views/mypage/community.jsp");
    // return modelAndView;
    // }

    // 커뮤니티 게시글 수정
    @GetMapping("/communityupdateAndSelectSearch/{COMMUNITY_ID}")
    public ModelAndView communityupdateAndSelectSearch(@PathVariable String COMMUNITY_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = mypageService.communityupdateAndSelectSearch(COMMUNITY_ID, params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_community.jsp");

        return modelAndView;
    }

    @GetMapping("/BMI")
    public ModelAndView selectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = mypageService.mypageBMI(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_BMI.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

    @GetMapping("/surveycontentlist")
    public ModelAndView surveysearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = mypageService.mypagesurveylist(params);
        String userId = commons.getUserID();
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_surveylist.jsp");

        return modelAndView;
    }

    @GetMapping({ "/surveyContent/{SURVEY_UID}" })
    public ModelAndView surveyContent(@RequestParam Map params, @PathVariable String SURVEY_UID,
            ModelAndView modelAndView) {
        Object result = mypageService.mypagesurveycontent(SURVEY_UID, params);
        String userId = commons.getUserID();
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/mypage/mypage_surveycontent.jsp");
        return modelAndView;
    }

}
