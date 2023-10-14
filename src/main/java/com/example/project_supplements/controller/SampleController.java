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

import com.example.project_supplements.service.SampleService;

@Controller

@RequestMapping("/main")

public class SampleController {
    @Autowired
    SampleService DietService;

    @GetMapping({ " ", "/home" })
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.addObject("name", "Yojulab!");
        modelAndView.setViewName("/WEB-INF/views/main.jsp");
        return modelAndView;
    }

    @GetMapping("/selectSearch")
    public ModelAndView selectSearch(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = DietService.selectSearch(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/list_map_ex.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

    @GetMapping("/community")
    public ModelAndView community(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = DietService.selectCommunitySearch(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/Community.jsp"); // 모델과 뷰 정보를 포함한 ModelAndView 객체를 반환
        return modelAndView;
    }

    // delete
    @PostMapping("/deleteAndSelectSearch/{UNIQUE_ID}")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params,
            @PathVariable String UNIQUE_ID, ModelAndView modelAndView) {
        Object result = DietService.deleteAndSelectSearch(UNIQUE_ID, params); // 호출
        modelAndView.addObject("params", params); // modelAndView 객체에 params와 result를 추가
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/list_map_ex.jsp");
        return modelAndView;
    }
    // // INSERT
    // @PostMapping("/insert")
    // public ModelAndView insert(@RequestParam Map params, ModelAndView
    // modelAndView) {
    // Object result = DietService.insert(params);

    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/mainpage/main.jsp");
    // return modelAndView;
    // }

    // @GetMapping("/insertForm")
    // public ModelAndView insertForm(@RequestParam Map params, ModelAndView
    // modelAndView) {
    // modelAndView.setViewName("/WEB-INF/views/InsertForm.jsp");
    // return modelAndView;
    // }

    // @PostMapping("/insertAndSelectSearch")
    // public ModelAndView insertAndSelectSearch(@RequestParam Map params,
    // ModelAndView modelAndView) {
    // Object result = DietService.insertAndSelectSearch(params);

    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/main.jsp");

    // return modelAndView;
    // }

    // UPDATE
    @PostMapping("/updateForm/{UNIQUE_ID}")
    public ModelAndView updateForm(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/UpdateForm.jsp");
        return modelAndView;
    }

    @PostMapping("/updateAndSelectSearch/{UNIQUE_ID}")
    public ModelAndView updateAndSelectSearch(@PathVariable String UNIQUE_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = DietService.updateAndSelectSearch(UNIQUE_ID, params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/list_map_ex.jsp");

        return modelAndView;
    }

    // 상세정보
    @GetMapping("/selectDetail")
    public ModelAndView selectDetail(@PathVariable String USER_ID, @RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = DietService.selectDetail(USER_ID, params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/DetailForm.jsp");
        return modelAndView;
    }

    @PostMapping("/signAndList")
    public ModelAndView signAndList(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object result = DietService.insertAndSelectSearch(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/list_map_ex.jsp");

        return modelAndView;
    }

}

// 상세정보
// @PostMapping("/selectDetail/{COMMON_CODE_ID}")
// public ModelAndView selectDetail(@PathVariable String COMMON_CODE_ID,
// @RequestParam Map params,
// ModelAndView modelAndView) {
// Object result = carInforsService.selectDetail(COMMON_CODE_ID, params);
// modelAndView.addObject("params", params);
// modelAndView.addObject("result", result);
// modelAndView.setViewName("/WEB-INF/views/DetailForm.jsp");
// return modelAndView;
// }
