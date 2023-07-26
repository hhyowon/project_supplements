<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/maintool.css">
    <title>Document</title>
</head>

<body>
    <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- header-->
    <div class="row g-0 vh-100">
        <%@ include file= "/WEB-INF/views/etc/Admin_Sidebar.jsp" %><!-- 관리자페이지 옆-->
        <div class="col-9 p-0 mb-5 ms-5">
            <div style="text-align:center;">
                <h1 class="h3 mb-3 fw-normal">커뮤니티 관리</h1>
            </div>
            <br>
            <form action="">
                <div class="container">
                    <div class="d-flex justify-content-center align-items-center input-group mb-3">
                        <div class="d-flex align-items-center">
                            <div class="input-group">
                                <select class="form-select" name="keyField" id="" style="width: 150px;">
                                    <option>카테고리</option>
                                    <option value="Q">질문</option>
                                    <option value="review">후기</option>
                                    <option value="recommend">추천</option>
                                </select>
                                <input type="text" placeholder="검색어를 입력하세요" class="form-control"
                                    style="width: 300px;" />
                                <button class="btn btn-main" type="submit" formaction="" formmethod="get">검색</button>
                            </div>
                        </div>
                    </div>
             
                    </div>

                <div class="container">
                <table class="ui celled table table text-center table-bordered table-hover">
                    <thead>
                        <tr class="bg-secondary bg-opacity-10">
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
                                    for(int i=0; i < resultList.size(); i=i+1){
                                        int number = i+1;
                                        HashMap record=(HashMap)resultList.get(i); %>
                            <tr>
                                <td><%= number %></td> 
                                <td><%= record.get("CATEGORY") %></td>
                                <td><%= record.get("COMMUNITY_TITLE") %></a></td>
                                <td><%= record.get("USER_ID") %></td>
                                <td><%= record.get("COMMUNITY_DATE") %></td>
                                <td>
                                    <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">답변하기</button>
                                    <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="/admina/deleteAndSelectSearch">삭제</button>
                                  </td>
                            </tr>
                
                        </thead>
                            <% }  %>
                        </tbody>
                    </table>
            </form>
            </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>