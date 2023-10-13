<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>

<sec:authentication property="principal" var="userDetailsBean" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/maintool.css">
    <title>복용자의 폼</title>
</head>

<body>
    <% 
        HashMap params=(HashMap)request.getAttribute("params"); 
        String searchStr=(String)params.getOrDefault("search", ""); 
        HashMap result=(HashMap)request.getAttribute("result");
    %>
    <div style="text-align: center;">
        <img class="mb-4" src="/html/img/logo.PNG" alt width="240" height="100"
            style="display: block; margin-left: auto; margin-right: auto;">
        <H1>복용자 설문조사</H1>
    </div>

    <form method="get" action="/survey/survey_yes">
        <div class="container mx-auto"style="border: 2px solid rgb(91, 155, 213); padding: 20px; border-radius: 10px; text-align: center; width: 50%;">
            <tbody id="surveyyes">

                <% ArrayList resultList = (ArrayList) result.get("resultList");
                String compare = ""; // 이전 질문 ID를 저장할 변수 초기화
                for (int i = 0; i < resultList.size(); i++) {
                    HashMap record = (HashMap) resultList.get(i);
                    String surveyQuestionId = (String) record.get("SURVEY_QUESTION_ID");
                    String surveyQuestion = (String) record.get("SURVEY_QUESTION");
                    String surveyOpt = (String) record.get("SURVEY_OPT");
                    String surveyOptId = (String) record.get("SURVEY_OPT_ID");

                    if (!surveyQuestionId.equals(compare)) { // 이전 질문 ID와 다르면 (새로운 질문)
                        compare = surveyQuestionId; // 이전 질문 ID 업데이트
                    %>
                            
                        </br></br>
                        <div>
                            <label name="SURVEY_QUESTION_ID" value="<%= surveyQuestionId %>" ><%= surveyQuestion %> </label>
                        </div>
                        
                            
                     <label><input type="radio"  name="<%= surveyQuestionId %>" value="<%= surveyOptId %>" > <%= surveyOpt %> </label>
                    <%     } else {
                    %> 
                    <label><input type="radio"  name="<%= surveyQuestionId %>" value="<%= surveyOptId %>" > <%= surveyOpt %> </label>
                    <%     }  }
                    %>
                
            </tbody>
        </div>
        <div class="container bg-white fs-6 py-6 row mx-auto my-3">
            <div class="text-center d-flex justify-content-center py-2">
                <button type="submit" formaction="/main" class="btn btn-white mx-2 btn-outline-dark" style="border-color: black; color: black;">닫기</button>
                <button type="submit" formaction="/survey/insertAndSelectSurvey_YesResult" class="btn btn-white btn-outline-dark" style="background-color: #5B9BD5; color: white; border-color: transparent;"data-bs-toggle="modal" data-bs-target="#myModal">설문제출</button>
            </div>
        </div>
        
    </form>
</body>

</html>