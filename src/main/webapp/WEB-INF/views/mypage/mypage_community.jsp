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
                <h1 class="h3 mb-3 fw-normal">내 글 관리</h1>
            </div>
            <br>


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
                            String targetUserId = "honggd123"; // userid 하드코팅 해놓았음
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
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="mypage_community_post.html">수정</button>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">삭제</button>
                            </td>
                        </tr>
                        <% }  } %>
                    </tbody>
                </table> 
            </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>