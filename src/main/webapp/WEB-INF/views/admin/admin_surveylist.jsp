<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
<html lang="en">

<body>
    <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- header-->
    <div class="row g-0 vh-100">
        <%@ include file= "/WEB-INF/views/etc/Admin_Sidebar.jsp" %>
        <div class="col-9 p-0 mb-5 ms-5">
            <div style="text-align:center;">
                <h1 class="h3 mb-3 fw-normal">설문조사 관리</h1>
            </div>
            <!-- <div>
                <a href="/rank" style="background-color: transparent; color: #454546; font-weight: bold; text-decoration: none; padding: 10px 20px; border: 2px solid #454546; border-radius: 5px; display: inline-block; margin-top: 30px;">전체 통계 관리하기</a>
            </div> -->

            <br>
            <% 
            HashMap params=(HashMap)request.getAttribute("params"); 
            String searchStr=(String)params.getOrDefault("search", ""); 
            HashMap result=(HashMap)request.getAttribute("result"); %>
            <div class="container">
                <form action="" method="GET">
                                <div class="d-flex justify-content-center align-items-center input-group mb-3">
                                    <div class="d-flex align-items-center">
                                        <div class="input-group">
                                            <select class="form-select" name="search" id="" style="width: 150px;">
                                                <option>선택</option>
                                                <option value="USER_ID"<%=(searchStr.equals("USER_ID")) ? "selected" : "" %>>설문자 ID</option>
                                               
                                                <option value="SURVEY_TYPE_ID"<%=(searchStr.equals("SURVEY_TYPE_ID")) ? "selected" : "" %>>설문 타입</option>
                                            </select>
                                            <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                                            class="form-control" placeholder="검색어를 입력하세요" id="keydownEnter"
                                            style="width: 300px;" />     
                                            <button class="btn btn-main" type="submit" formaction="/adminsurvey/selectSearch" formmethod="get">검색</button>
                                        </div>
                                    </div>
                                </div>
                        
                            </div>
                <div class="container">
                <table class="ui celled table table text-center table-bordered table-hover">
                    <thead>
                        <tr class="bg-secondary bg-opacity-10">
                            <th>번호</th> 
                            <th>설문 일시</th>
                            
                            <th>설문자 ID</th>
                            <th>설문 타입</th>
                            <th>조회</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                   
                    <tbody id="list">
                        <% ArrayList resultList=(ArrayList)result.get("resultList"); 
                                    for(int i=0; i < resultList.size(); i=i+1){
                                        int number = i+1;
                                        HashMap record=(HashMap)resultList.get(i); %>
                            <tr>
                                <td><%= number %></td> 
                                <td><%= record.get("DATE_TIME") %></a></td>
                                
                                <td><%= record.get("USER_ID") %></td>
                                <td><%= record.get("SURVEY_TYPE_ID") %></td>
                                <td><button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="/adminsurvey/surveyContent/<%= record.get("SURVEY_UID") %>">조회</button></td> 
                                <td><button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="/adminsurvey/deleteAndSelectSearch/<%= record.get("SURVEY_UID") %>">삭제</button></td>
                            </tr>
                
                       
                            <% }  %>
                        </tbody>
                    </table>

            </form>
            </div>
            <%
            Paginations paginations = (Paginations)result.get("paginations"); 
            %>

            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="/adminsurvey/surveyList?currentPage=<%=paginations.getPreviousPage()%>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Previous</a>
                    </li>

                    <%
                    for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                    %>
                    <li class="page-item">
                        <a class="page-link" href="/adminsurvey/surveyList?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">
                            <%= i %>
                        </a>
                        </li>
                    <%
                    }
                    %>

                    <li class="page-item">
                        <a class="page-link" href="/adminsurvey/surveyList?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Next</a>
                    </li>
                </ul>
            </nav>
</body>

</html>