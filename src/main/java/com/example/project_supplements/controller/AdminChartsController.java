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

import com.example.project_supplements.service.AdminChartsService;
import com.example.project_supplements.utils.Commons;
import com.google.gson.Gson;

@Controller

@RequestMapping("/admin")
public class AdminChartsController {
    @Autowired
    private Gson gson;
    // 커뮤니티 관리

    @Autowired
    AdminChartsService adminChartsService;

    @Autowired
    Commons commons;

    @GetMapping( "/adminCharts")
    public ModelAndView AdminCharts(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
        // 필요한 경우 params로부터 데이터를 가져와 reviewsCNTMap 또는 coronaCNTMap에 추가

        // 서비스에서 데이터를 가져오고 JSON으로 변환하여 JSP로 전달
        Map<String, Object> reviewsCNTMap = new HashMap<>(params); // params로부터 맵을 초기화 (필요에 따라)
        Object result01 = adminChartsService.Commreviews(reviewsCNTMap);
        String jsonData = gson.toJson(result01);
        modelAndView.addObject("dataArray", jsonData);

        // 서비스에서 데이터를 가져오고 JSON으로 변환하여 JSP로 전달
        Map<String, Object> coronaCNTMap = new HashMap<>(params); // params로부터 맵을 초기화 (필요에 따라)
        Object result02 = adminChartsService.CommcoronaCount(coronaCNTMap);
        String jsonData2 = gson.toJson(result02);
        modelAndView.addObject("dataArray2", jsonData2);

        modelAndView.setViewName("/WEB-INF/views/admin/admin_charts.jsp");
        return modelAndView;
    }



}
