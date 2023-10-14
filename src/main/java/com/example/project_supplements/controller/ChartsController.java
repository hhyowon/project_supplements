package com.example.project_supplements.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Controller

@RequestMapping("/admin")
public class ChartsController {
    @Autowired
    private Gson gson;

    @RequestMapping(value = "/charts/google_charts_scatter", method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView modelAndView) {
        ArrayList datas = new ArrayList();
        // ['Age', 'Weight'],[8, 12],[4, 5.5],[11, 14],[4, 5],[3, 3.5],[6.5, 7];
        datas.add(Arrays.asList("Age", "Weight"));
        datas.add(Arrays.asList(8, 12));
        datas.add(Arrays.asList(4, 5.5));
        datas.add(Arrays.asList(11, 14));
        datas.add(Arrays.asList(4, 5));
        datas.add(Arrays.asList(3, 3.5));
        datas.add(Arrays.asList(6.5, 7));
        ArrayList dataArray = new ArrayList<>();
        dataArray.add(datas);

        modelAndView.addObject("dataArray", gson.toJson(datas));

        modelAndView.setViewName("/WEB-INF/views/admin/charts_google_various.jsp");
        return modelAndView;
    }

}
