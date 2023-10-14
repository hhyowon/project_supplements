package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.CommunityService;
import com.example.project_supplements.utils.Commons;

@Controller

@RequestMapping("/community")

public class CommunityController {
    @Autowired
    CommunityService communityService;

    @Autowired
    Commons commons;

    @GetMapping({ " " })
    public ModelAndView community(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = communityService.selectWithPagination(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/community/community.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

    @GetMapping({ "/selectSearch" })
    public ModelAndView communityselectSearch(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = communityService.selectWithPagination(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴
        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/community/community.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

    @GetMapping("/communityModal")
    public ModelAndView communityModal(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // 데이터를 저장할 HashMap 객체인 dataMap을 생성합니다.
        Map<String, Object> dataMap = new HashMap<>();
        // 모달에서 받아온 값들을 dataMap에 저장합니다.
        String categoryId = params.get("CATEGORY"); // 모달에서 전달된 카테고리 값
        String communityTitle = params.get("TITLE"); // 모달에서 전달된 제목 값
        String communityContent = params.get("CONTENT"); // 모달에서 전달된 내용 값
        String userId = commons.getUserID(); // user_id 받기

        dataMap.put("USER_ID", userId);
        dataMap.put("CATEGORY_ID", categoryId);
        dataMap.put("COMMUNITY_TITLE", communityTitle);
        dataMap.put("COMMUNITY_CONTENT", communityContent);

        // communityService.insert 메서드의 파라미터를 dataMap으로 변경하고 호출합니다.
        Object result = communityService.insert(dataMap);

        // 모델에 필요한 데이터를 추가합니다.
        modelAndView.addObject("params", params); // 모달에서 전달된 원래의 params 맵
        modelAndView.addObject("result", result); // 삽입 결과
        modelAndView.setViewName("redirect:/community");
        return modelAndView;
    }

    @GetMapping("/community")
    public ModelAndView communityPage(ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/community/community.jsp");
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
        modelAndView.setViewName("/WEB-INF/views/community/community_post_comment.jsp");
        return modelAndView;
    }

    // 댓글 작성 fetch
    @PostMapping("/comment/{COMMUNITY_ID}")
    @ResponseBody
    public Map<String, Object> comment(@PathVariable("COMMUNITY_ID") String COMMUNITY_ID,
            @RequestBody Map<String, String> params) {
        params.put("COMMUNITY_ID", COMMUNITY_ID);
        Object result = communityService.insertAndSelectcomment(COMMUNITY_ID, params);
        return (Map<String, Object>) result; // 응답을 Map 형식으로 반환합니다.
    }

    // 댓글삭제
    @DeleteMapping("/deleteAndSelectSearch/{COMMENT_ID}/{COMMUNITY_ID}")
    public ResponseEntity<Map<String, Object>> deleteAndSelectSearch(@RequestParam Map params,
            @PathVariable String COMMENT_ID, @PathVariable String COMMUNITY_ID) {

        params.put("COMMENT_ID", COMMENT_ID);
        params.put("COMMUNITY_ID", COMMUNITY_ID);
        Object result = communityService.deleteandselectcomment(params, COMMENT_ID, COMMUNITY_ID);
        // 삭제 성공적으로 수행되었을 경우의 응답
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", "success");
        responseMap.put("message", "Comment deleted successfully");
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    // // 댓글 작성
    // @PostMapping("/comment/{COMMUNITY_ID}")
    // public ModelAndView comment(@PathVariable("COMMUNITY_ID") String
    // COMMUNITY_ID,
    // @RequestParam Map<String, String> params, ModelAndView modelAndView) {
    // params.put("COMMUNITY_ID", COMMUNITY_ID);
    // Object result = communityService.insertAndSelectcomment(COMMUNITY_ID,
    // params);
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/community/community_post_comment.jsp");
    // return modelAndView;
    // }
    // 기존 댓글 삭제
    // @DeleteMapping("/deleteAndSelectSearch/{COMMENT_ID}/{COMMUNITY_ID}")
    // public ModelAndView deleteAndSelectSearch(@RequestParam Map params,
    // @PathVariable String COMMENT_ID, @PathVariable String COMMUNITY_ID,
    // ModelAndView modelAndView) {

    // params.put("COMMENT_ID", COMMENT_ID); // COMMENT_ID를 dataMap에 추가
    // params.put("COMMUNITY_ID", COMMUNITY_ID);
    // Object result = communityService.deleteandselectcomment(params, COMMENT_ID,
    // COMMUNITY_ID); // 호출
    // modelAndView.addObject("params", params); // modelAndView 객체에 params와 result를
    // 추가
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/community/community_post_comment.jsp");
    // return modelAndView;
    // }

}