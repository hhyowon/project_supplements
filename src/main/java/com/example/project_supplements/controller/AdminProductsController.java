package com.example.project_supplements.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.AdminProductsService;
import com.example.project_supplements.utils.Commons;


@Controller
@RequestMapping("/adminaproduct")

public class AdminProductsController {
    @Autowired
    AdminProductsService adminProductsService;

    @Autowired
    Commons commons;

    @GetMapping({"/"})
    public ModelAndView search(@RequestParam Map<String, String> params, ModelAndView modelAndView){
        // Map<String, String>으로 타입을 지정했으며, 파라미터의 이름과 값은 모두 문자열(String)로 처리
        Object result = adminProductsService.selectWithPagination(params); // params 맵을 인자로 전달하여 검색 결과를 가져 옴

        modelAndView.addObject("params", params); // params 맵을 "params"라는 이름으로 모델에 추가합니다. 이를 통해 JSP 페이지에서 해당 데이터에 접근
        modelAndView.addObject("result", result);// 검색 결과(result)를 "result"라는 이름으로 모델에 추가합니다. 마찬가지로 JSP 페이지에서 해당 데이터에 접근
        modelAndView.setViewName("/WEB-INF/views/admin/admin_products.jsp");
        return modelAndView;
    }

}
