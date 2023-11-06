<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Menu -->
<sec:authentication property="principal" var="userDetailsBean" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>설문조사 폼</title>
    <link rel="stylesheet" href="/css/maintool.css"/>
</head>
<body>
    <%
    String surveyTypeId = ""; 
    HashMap params = (HashMap) request.getAttribute("params"); 
    String searchStr = (String) params.getOrDefault("search", ""); 
    HashMap result = (HashMap) request.getAttribute("result");
    ArrayList resultList = (ArrayList) result.get("resultList");
   
    
    if (!resultList.isEmpty()) {
        HashMap firstRecord = (HashMap) resultList.get(0);
        surveyTypeId = (String) firstRecord.get("SURVEY_TYPE_ID"); // surveyTypeId 값을 설정
    }
    %>
    <form method="get"> 
        <input type="hidden" name="SURVEY_TYPE_ID" value="<%= surveyTypeId %>"> 
        <div class="container mx-auto"  style="margin-top: 50px;  border: 2px solid rgb(91, 155, 213); padding: 20px; border-radius: 10px; text-align: center; width: 50%;">
            <tbody id="surveyboth">
                <div class="top-margin text-center">
                    <img class="mt-4 mb-4" src="/html/img/logo.PNG" alt width="240" height="100" style="display: block; margin-left: auto; margin-right: auto;">
                </div>
                <h3>  
                    <% if ("F-01".equals(surveyTypeId)) { %>
                        다이어트 보조제 미복용자 설문조사
                        <% } else if ("F-02".equals(surveyTypeId)) { %>
                            다이어트 보조제 복용자 설문조사
                            <% } %>
                </h3>
                <%
                String compare = ""; // 이전 질문 ID를 저장할 변수 초기화
                for (int i = 0; i < resultList.size(); i++) {
                    HashMap record = (HashMap) resultList.get(i);
                    String surveyQuestionId = (String) record.get("SURVEY_QUESTION_ID");
                    String surveyQuestion = (String) record.get("SURVEY_QUESTION");
                    String surveyOpt = (String) record.get("SURVEY_OPT");
                    String surveyOptId = (String) record.get("SURVEY_OPT_ID");
                
                    if (!surveyQuestionId.equals(compare)) { // 이전 질문 ID와 현재 질문 ID를 비교하여 새로운 질문 항목인지 확인
                        compare = surveyQuestionId; // 이전 질문 ID 업데이트
                %>
                        </br></br>
                        <div>
                        <!-- 현재 질문 항목의 ID와 내용을 출력 -->
                        <label name="SURVEY_QUESTION_ID" value="<%= surveyQuestionId %>"><%= surveyQuestion %> </label>
                        </div> 
                <%
                        if ("Q-06".equals(surveyQuestionId)) {
                %>
                        <!-- 드롭다운 옵션을 출력 -->
                           <select name="<%= surveyQuestionId %>">
                            <option value="">복용하신 보조제를 선택해주세요</option>
                            <!-- surveyOpt를 for문을 통해 모두 생성 -->
                            <%
                            for (int j = 0; j < resultList.size(); j++) {
                                HashMap optRecord = (HashMap) resultList.get(j);
                                String optSurveyQuestionId = (String) optRecord.get("SURVEY_QUESTION_ID");
                                String optSurveyOpt = (String) optRecord.get("SURVEY_OPT");
                                String optSurveyOptId = (String) optRecord.get("SURVEY_OPT_ID");
                                if ("Q-06".equals(optSurveyQuestionId)) {
                            %>
                                <option value="<%= optSurveyOptId %>"><%= optSurveyOpt %></option>
                            <%
                                }
                            }
                            %>
                        </select>
                                <% } else { %>
                                    <!-- 선택 옵션을 라디오 버튼으로 나타내기 -->
                                    <% for (int j=0; j < resultList.size(); j++) { HashMap
                                        optRecord=(HashMap) resultList.get(j); String
                                        optSurveyQuestionId=(String) optRecord.get("SURVEY_QUESTION_ID");
                                        String optSurveyOpt=(String) optRecord.get("SURVEY_OPT"); String
                                        optSurveyOptId=(String) optRecord.get("SURVEY_OPT_ID"); if
                                        (surveyQuestionId.equals(optSurveyQuestionId)) { %>
                                        <label><input type="radio" name="<%= surveyQuestionId %>"
                                                value="<%= optSurveyOptId %>">
                                            <%= optSurveyOpt %>
                                        </label>
                                        <% } } %>
                                            <% } %>
                                                <% } %>
                                                    <% } %>


                    </tbody>
                </div>
                <div class="container bg-white fs-6 py-6 row mx-auto my-3">
                    <div class="text-center d-flex justify-content-center py-2">
                        <button type="submit" formaction="/main" class="btn btn-white mx-2 btn-outline-dark"
                            style="border-color: black; color: black;">닫기</button>
                        <button type="submit" formaction="/survey/insertAndSelectSurveyResult"
                            class="btn btn-white btn-outline-dark"
                            style="background-color: #5B9BD5; color: white; border-color: transparent"
                            data-bs-toggle="modal" data-bs-target="#myModal">설문제출</button>

                    </div>
            </form>
</body>

</html>