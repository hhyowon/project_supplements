<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/maintool.css">
    <title>복용한자의 폼</title>
</head>
    <body>
        <%@ include file="/WEB-INF/views/etc/Header.jsp" %> 
        <% HashMap params=(HashMap)request.getAttribute("params"); 
        HashMap result=(HashMap)request.getAttribute("result");%>

          <div class="container">
                <div class=text-center><h2 style="color: #5B9BD5;">설문조사 결과</h2></div>
                <br>
            <table class="table table-bordered ">
                <thead>
                    <tr>
                        <th class=text-center><h5 style="color: #5B9BD5;">질문</h5></th>
                        <th class=text-center><h5 style="color: #5B9BD5;">답변</h5></th>
                        <th class=text-center><h5 style="color: #5B9BD5;">답변자 수 </h5></th>
                    </tr>
                </thead>
                <tbody> 
                    <% 
                    ArrayList resultList=(ArrayList)result.get("resultList");
                    String previousquestion = "";

                    for (int i=0; i < resultList.size(); i++) 
                    {HashMap record=(HashMap)resultList.get(i); 
                    String surveyquestion=(String)record.get("SURVEY_QUESTION"); 
                    String surveyoption=(String)record.get("SURVEY_OPT"); 
                    Long surveycount=(Long)record.get("COUNT(*)"); 
                    %>
                    <tr> 
                        <% 
                        if (!surveyquestion.equals(previousquestion)) { 
                        %>
                         <td><%= surveyquestion %></td>
                            <%previousquestion = surveyquestion;} 
                            else {previousquestion = surveyquestion;%>
                                <td></td>
                                <%} %>

                         <td><%= surveyoption %></td>
                         <td><%= surveycount %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>

