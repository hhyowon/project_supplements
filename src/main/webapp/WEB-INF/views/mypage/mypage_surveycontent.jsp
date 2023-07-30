<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/maintool.css">
    <title>Document</title>
</head>

<body>
    <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- header -->
    <!-- 마이페이지 옆-->
    <div class="row g-0 vh-100">
        <%@ include file= "/WEB-INF/views/etc/Sidebar.jsp" %><!-- 마이페이지 sidebar -->
        <div class="col-9 p-0 mb-5 ms-5">
            <div style="text-align:center;">
                <h1 class="h3 mb-3 fw-normal">나의 설문조사 이력</h1>
            </div>
            <br>
            <div class="container">
                <% 
                HashMap params=(HashMap)request.getAttribute("params"); 
                HashMap result=(HashMap)request.getAttribute("result"); 
                %>
                <table class="table table-bordered ">
                    <thead>
                        <tr>
                            
                            <th class=text-center><h5 style="color: #5B9BD5;">질문</h5></th>
                            <th class=text-center><h5 style="color: #5B9BD5;">답변</h5></th>

                        </tr>
                    </thead>
                    <tbody id="list"> 

                        <% 
                        ArrayList resultList=(ArrayList)result.get("resultList");

                        for (int i=0; i < resultList.size(); i++) 
                        {HashMap record=(HashMap)resultList.get(i);
                      
                        String surveyquestion=(String)record.get("SURVEY_QUESTION"); 
                        String surveyoption=(String)record.get("SURVEY_OPT"); 
                        %>
                        <tr> 
                           
                             <td><%= surveyquestion %></td>

                             <td><%= surveyoption %></td>
                           
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <div class="container" style="text-align: center; padding: 10%;">
                    <a href="/mypage/surveycontentlist"> <button class="btn mx-2 mb-2 submit btn-outline-secondary">목록보기</button></a>
                 </div>
            </div>
           
              
            </div>
          
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>