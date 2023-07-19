<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations" %>
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
  <%@ include file="/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->

  <% HashMap params = (HashMap) request.getAttribute("params");
     String searchStr = (String) params.getOrDefault("search", "");
     HashMap result = (HashMap) request.getAttribute("result"); %>

  <div class="container">
    <h2 class="ui teal image header text-center">
      다이어트 보조제 검색
    </h2>
    <br>
    <br>
    <div class="container">
      <form action="" method="GET">
        <div class="d-flex justify-content-center align-items-center input-group mb-3">
          <div class="d-flex align-items-center">
            <div class="input-group">
              <select class="form-select" name="keyField" style="width: 150px;">
                <option>카테고리</option>
                <option value="name">상품명</option>
                <option value="ingredient">효과</option>
                <option value="form">제형</option>
              </select>
              <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                                class="form-control" placeholder="원하는 상품명, 효과, 제형 검색하기..." id="keydownEnter"  style="width: 500px;"/>
              <button  class="btn btn-main"  type="submit" formaction="/search/searchList"formmethod="get">검색</button>

            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <br>

  <div class="container">
    <div class="row">
      <% ArrayList resultList = (ArrayList) result.get("resultList");
         for (int i = 0; i < resultList.size(); i++) {
           HashMap record = (HashMap) resultList.get(i); %>
      <div class="col-md-4 mb-4">
        <div class="card" style="text-align: center;">
          <img src="<%= record.get("PROUDUCT_IMG") %>" class="card-img-top" alt="Image" style="height: 350px;">
          <div class="card-body">
            <h5 class="card-title" style="font-weight: bold;"><%= record.get("PRODUCT") %></h5>
            <span class="badge" style="background-color: #5B9BD5;"><font size="4"><%= record.get("FORMULATION") %></font></span>
            <span class="badge" style="background-color: #bccad6;"><font size="4"><%= record.get("EFFECT") %></font></span>
          </div>
          <div class="card-footer">
            <a href="<%= record.get("URL") %>" target="_blank" style="color: inherit; text-decoration: none;">
              상세보기
            </a>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </div>
  
  <nav aria-label="Card Pagination">
    <ul class="pagination justify-content-center">
      <li class="page-item" id="previous-btn">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item" id="next-btn">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </nav>
  <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
