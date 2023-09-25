package com.example.project_supplements.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project_supplements.service.BmiService;
import com.example.project_supplements.utils.Commons;


@Controller

@RequestMapping("/bmi")

public class BMIController {
    @Autowired
    BmiService bmiService;

    @Autowired
    Commons commons;

    @GetMapping({"/mainBMI"})
    public ModelAndView bmimain(ModelAndView modelAndView){
        modelAndView.setViewName("/WEB-INF/views/bmi/bmi.jsp"); 
        return modelAndView;
    }

    // BMI 계산 메서드
    private double calculateBMI(double height, double weight) {
        // BMI 계산 로직을 여기에 추가합니다.
        // BMI = 체중(kg) / (신장(m) * 신장(m))
        double heightInMeters = height / 100.0; // cm를 m로 변환
        double bmi = weight / (heightInMeters * heightInMeters);
        return bmi;
    }

    @GetMapping("/insertBMI")
    public ModelAndView insertBMI(@RequestParam Map<String, String> params, ModelAndView modelAndView) {
    // 사용자가 입력한 신장과 체중을 가져옵니다.
    String heightStr = params.get("HEIGHT");
    String weightStr = params.get("WEIGHT");

    double height = Double.parseDouble(heightStr);
    double weight = Double.parseDouble(weightStr);

    // BMI를 계산합니다.
    double bmi = calculateBMI(height, weight);

    // BMI 결과를 데이터베이스에 삽입합니다.
    Map<String, Object> dataMap = new HashMap<>();
    String userId = commons.getUserID(); // 사용자 아이디 가져오기
    // 성별 정보 가져오기
    String userGender = bmiService.getUserGender(userId);

    dataMap.put("USER_ID", userId);
    dataMap.put("GENDER_UID", userGender);
    dataMap.put("HEIGHT", height);
    dataMap.put("WEIGHT", weight);
    dataMap.put("BMI_RESULT", bmi); // BMI_RESULT를 DOUBLE로 저장

    // BMI_TYPE을 계산하여 설정합니다.
    String bmiType;
    if (bmi < 18.5) {
        bmiType = "저체중";
    } else if (bmi < 23) {
        bmiType = "정상";
    } else if (bmi < 25) {
        bmiType = "과체중";
    } else {
        bmiType = "비만";
    }
    dataMap.put("BMI_TYPE", bmiType);

    // bmiService를 호출하여 BMI 정보를 데이터베이스에 삽입합니다.
    bmiService.insertBMI(dataMap);

    // 결과를 모델에 추가합니다.
    Map<String, Object> resultModel = new HashMap<>();
    resultModel.put("BMI_RESULT", bmi); // BMI 값
    resultModel.put("BMI_TYPE", bmiType); // BMI 타입
    modelAndView.addObject("params", params);
    modelAndView.addObject("result", resultModel); // 수정된 부분
    modelAndView.setViewName("/WEB-INF/views/bmi/bmi_result.jsp");

    return modelAndView;
}

}


 



    