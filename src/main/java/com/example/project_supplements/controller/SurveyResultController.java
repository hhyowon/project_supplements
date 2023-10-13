// package com.example.project_supplements.controller;

// import java.util.Map;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RequestParam;
// import org.springframework.web.servlet.ModelAndView;

// import com.example.project_supplements.service.SurveyResultService;

// @Controller

// @RequestMapping("/surveyresult")

// public class SurveyResultController {
//     @Autowired 
//     SurveyResultService surveyResultService;

//      @GetMapping({"/result_yes"})
//      public ModelAndView result_yes(@RequestParam Map params, ModelAndView modelAndView){
        
//         Object result = surveyResultService.surveyResult(params);
//          modelAndView.addObject("params", params);
//          modelAndView.addObject("result", result);
//          modelAndView.setViewName("/WEB-INF/views/survey/result_survey_yes.jsp");
//          return modelAndView;
//      }


//      @GetMapping({"/result_no"})
//       public ModelAndView result_no(@RequestParam Map params, ModelAndView modelAndView){
//        Object result = surveyResultService.surveyResult(params);

//       modelAndView.addObject("params", params);
//       modelAndView.addObject("result", result);
//       modelAndView.setViewName("/WEB-INF/views/survey/result_survey_no.jsp");
//        return modelAndView;
//       }
     
     

// }

// 사용하지 않아도 surveycontroller에서 select까지 해줘서 reslut 폼으로 넘어가기 때문에 
// 굳이 필요업음 