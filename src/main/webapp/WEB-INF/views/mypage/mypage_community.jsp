<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.example.project_supplements.utils.Commons" %>
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
                <h1 class="h3 mb-3 fw-normal">내 글 관리</h1>
            </div>
            <br>

        <form action="">
            <div class="container">
                <table class="ui celled table table text-center table-bordered table-hover">
                    <thead>
                        <tr style="background: #8cc1f3;">
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>등록자</th>
                            <th>등록일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <% 
                    HashMap params=(HashMap)request.getAttribute("params"); 
                    String searchStr=(String)params.getOrDefault("search", ""); 
                    HashMap result=(HashMap)request.getAttribute("result"); %>
                    <tbody id="list">
                        <% ArrayList resultList=(ArrayList)result.get("resultList"); 
                        Commons commons = new Commons(); 
                        String targetUserId = commons.getUserID(); 
                            for(int i=0; i < resultList.size(); i=i+1){
                                int number = i+1;
                                HashMap record=(HashMap)resultList.get(i); 
                                String userId = (String) record.get("USER_ID");
                                    if (userId.equals(targetUserId)) { // userId가 같으면 다 뽑아오기
                                    %>
                        <tr>
                            <td><%= number %></td>
                            <td><%= record.get("CATEGORY") %></td>
                            <td><%= record.get("COMMUNITY_TITLE") %></a></td>
                            <td><%= record.get("USER_ID") %></td>
                            <td><%= record.get("COMMUNITY_DATE") %></td>
                            
                            <td>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction='/mypage/communityPost/<%= record.get("COMMUNITY_ID") %>'>수정</button>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction='/mypage/deleteAndSelectSearch/<%= record.get("COMMUNITY_ID") %>'>삭제</button>
                            </td>
                        </tr>
                        <% }  } %>
                    </tbody>
                </table> 
        </form>
        </div>

</body>

</html>