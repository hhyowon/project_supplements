<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">



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
                <table class="ui celled table table text-center table-bordered table-hover">
                    <thead>
                        <tr style="background: #8cc1f3;">
                            <th>번호</th>
                            <th>설문 일시</th>
                            <th>설문 타입</th>
                             <th>조회</th>
                            
                        </tr>
                    </thead>
                    <% 
                    HashMap params=(HashMap)request.getAttribute("params"); 
                    HashMap result=(HashMap)request.getAttribute("result"); 
                    %>
                    <tbody id="list">
                        <% 
                        ArrayList resultList=(ArrayList)result.get("resultList"); 
                           
                            for(int i=0; i < resultList.size(); i=i+1){
                                int number = i+1;
                                HashMap record=(HashMap)resultList.get(i); 
                                String userId = (String) record.get("USER_ID");
                                String datetime = (String) record.get("DATE_TIME");
                                String surveytype = (String) record.get("SURVEY_TYPE_ID");
                                String surveyuid = (String) record.get("SURVEY_UID");
                                String surveytypeno = (String)"복용경험X";
                                String surveytypeyes = (String)"복용경험O";
                                %>
                               
                        <tr>
                            <td><%= number %></td>
                            <td><%= datetime %></td>  
                            <%if (surveytype.equals("F-01")){%>
                             <td><%=surveytypeno%></td>
                           
                             <%}else if (surveytype.equals("F-02")){%>  
                             <td> <%=surveytypeyes%></td>
                             <% }%>
                            
                             <td> <a href="/mypage/surveyContent/<%=surveyuid%>"><button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">조회</button> </a></td> 
                        
                            
                        </tr>
                        <% } %>
                    </tbody>
                </table> 

               
            
              
            </div>
           
</body>




</html>