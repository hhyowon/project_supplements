package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.SurveyResultService;
import com.example.project_supplements.service.SurveyService;
import com.example.project_supplements.utils.Commons;
import com.google.gson.Gson;

@Controller
@RequestMapping("/survey")

public class SurveyController {
    @Autowired
    SurveyService surveyService;

    @Autowired
    SurveyResultService surveyResultService;

    @Autowired
    Commons commons;

    @Autowired
    private Gson gson;

    @GetMapping({ " " })
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.setViewName("/WEB-INF/views/survey/survey.jsp");
        return modelAndView;
    }

    @GetMapping({ "/both" })
    public ModelAndView surveyboth(@RequestParam("SURVEY_TYPE_ID") String surveyTypeId, ModelAndView modelAndView) {
        Map<String, String> params = new HashMap<>();
        params.put("SURVEY_TYPE_ID", surveyTypeId); // surveyType 파라미터를 params Map에 추가
        Object result = surveyService.surveyboth(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/survey/survey_both.jsp");
        return modelAndView;
    }

    // @GetMapping({"/no"})
    // public ModelAndView surveyno(@RequestParam Map params, ModelAndView
    // modelAndView){
    // Object result = surveyService.surveyno( params);
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/survey/survey_no.jsp");
    // return modelAndView;
    // }

    // //복용한자의 설문지 뽑아오기
    // @GetMapping({"/yes"})
    // public ModelAndView surveyyes( @RequestParam Map params,ModelAndView
    // modelAndView){
    // Object result = surveyService.surveyyes(params);
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/survey/survey_yes.jsp");
    // return modelAndView;
    // }

    @GetMapping("/insertAndSelectSurveyResult")
    public ModelAndView insertAndSelectSurvey(@RequestParam("SURVEY_TYPE_ID") String surveyTypeId,
            @RequestParam Map params,
            ModelAndView modelAndView) {
        params.put("SURVEY_TYPE_ID", surveyTypeId);
        Object result = surveyService.insertAndSelectSurveyResult(params);
        String userId = commons.getUserID();
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/survey/result_survey_yes.jsp");

        // 서비스에서 데이터를 가져오고 JSON으로 변환하여 JSP로 전달
        Map<String, Object> avgBMIMap = new HashMap<>(); // 새로운 맵 생성
        Object resultProduct = surveyResultService.surveyresultProduct(avgBMIMap); // 빈 맵 전달
        String jsonData = gson.toJson(resultProduct);
        modelAndView.addObject("dataArray", jsonData);

        // 서비스에서 데이터를 가져오고 JSON으로 변환하여 JSP로 전달
        Map<String, Object> maleBMIMap = new HashMap<>(); // 새로운 맵 생성
        Object resultCause = surveyResultService.surveyresultCause(maleBMIMap); // 빈 맵 전달
        String jsonData2 = gson.toJson(resultCause);
        modelAndView.addObject("dataArray2", jsonData2);

        return modelAndView;
    }

    // uuid
    public String generateUUID() {
        return UUID.randomUUID().toString();
    }

    // //원래꺼
    // //설문 결과 INSERT(복용안한자)
    // @GetMapping("/insertAndSelectSurveyResult")
    // public ModelAndView insertAndSelectSurvey(@RequestParam Map params,
    // ModelAndView modelAndView) {
    // Object result = surveyService.insertAndSelectSurveyResult(params);
    // String userId = commons.getUserID(); // user_id 받기
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/survey/result_survey_yes.jsp");

    // return modelAndView;
    // }

    // //설문 결과 INSERT(복용한자)
    // @GetMapping("/insertAndSelectSurvey_YesResult")
    // public ModelAndView insertAndSelectSurvey_yes( @RequestParam Map params,
    // ModelAndView modelAndView) {
    // Object result = surveyService.insertAndSelectSurvey_YesResult(params);
    // String userId = commons.getUserID();
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/survey/result_survey_yes.jsp"); //
    // 통계가 보이게금 설정

    // return modelAndView;
    // }

}
