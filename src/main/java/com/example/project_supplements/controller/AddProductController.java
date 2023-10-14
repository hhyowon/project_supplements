package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.AdminProductsService;
import com.example.project_supplements.utils.Commons;

@Controller
@RequestMapping("/addproduct")
public class AddProductController {
  @Autowired
  AdminProductsService adminProductsService;

  @Autowired
  Commons commons;

  // INSERT 후 다시 보조제 관리자페이지로 이동
  @PostMapping("/insert")
  public ModelAndView insert(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
    Map<String, Object> dataMap = new HashMap<>();

    String proudct = params.get("PRODUCT"); // Category value passed in modal
    String url = params.get("URL"); // title value passed from modal
    String formulation = params.get("FORMULATION"); // content value passed from modal
    String productImg = "/images/" + params.get("PROUDUCT_IMG");
    String effect = params.get("EFFECT");
    String userId = commons.getUserID(); // get user_id

    dataMap.put("USER_ID", userId);
    dataMap.put("PRODUCT", proudct);
    dataMap.put("URL", url);
    dataMap.put("FORMULATION", formulation);
    dataMap.put("PROUDUCT_IMG", productImg);
    dataMap.put("EFFECT", effect);

    // Now, call the service method to insert the data into the database
    Object result = adminProductsService.insert(dataMap);

    // Add the necessary data to the model.
    modelAndView.addObject("params", params); // original params map passed in modal
    modelAndView.addObject("result", result); // insert result

    // Set the view information and return the ModelAndView object.
    modelAndView.setViewName("/WEB-INF/views/admin/admin_products.jsp");
    return modelAndView;
  }

  // INSERT
  @GetMapping({ "/insertForm" })
  public ModelAndView insertForm(@RequestParam Map params, ModelAndView modelAndView) {

    String viewName = "/WEB-INF/views/admin/admin_products_add.jsp";
    modelAndView.setViewName(viewName);
    return modelAndView;
  }

}
