<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations" %>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/maintool.css">
  <title>Document</title>
</head>

<body>
  <%@ include file="/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->

  <% HashMap params=(HashMap) request.getAttribute("params");
     String searchStr=(String) params.getOrDefault("search", "" ); 
     HashMap result=(HashMap) request.getAttribute("result"); %>

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
              <select class="form-select" name="search" style="width: 150px;">
                <option>카테고리</option>
                <option value="PRODUCT"<%=(searchStr.equals("PRODUCT")) ? "selected" : "" %>>상품명</option>
                <option value="EFFECT"<%=(searchStr.equals("EFFECT")) ? "selected" : "" %>>효과</option>
                <option value="FORMULATION"<%=(searchStr.equals("FORMULATION")) ? "selected" : "" %>>제형</option>
              </select>
              <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                class="form-control" placeholder="원하는 상품명, 효과, 제형 검색하기..." id="keydownEnter"
                style="width: 500px;" />
              <button class="btn btn-main" type="submit" formaction="/search/selectSearch"
                formmethod="get">검색</button>

            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <br>

  <div class="container">
    <div class="row">
      <% ArrayList resultList=(ArrayList) result.get("resultList"); for (int i=0; i < resultList.size(); i++) {
        HashMap record=(HashMap) resultList.get(i); %>
        <div class="col-md-3 mb-4"> <!-- 카드 크기를 작게 조절 -->
          <div class="card" style="text-align: center;">
            <img src="<%= record.get("PROUDUCT_IMG") %>" class="card-img-top" alt="Image" style="height: 250px;"> <!-- 이미지 높이를 조절 -->
            <div class="card-body" style="height: 120px; overflow: hidden;"> <!-- 카드의 높이를 고정하고 넘치는 부분은 숨김 처리 -->
              <h5 class="card-title" style="font-weight: bold;">
                <%= record.get("PRODUCT") %>
              </h5>
              <span class="badge" style="background-color: #5B9BD5;">
                <font size="4">
                  <%= record.get("FORMULATION") %>
                </font>
              </span>
               <span class="badge" style="background-color: #e7bd16;">
                <font size="4">
                  <%= record.get("EFFECT") %>
                </font>
              </span>
            </div>
            <div class="card-footer">
              <a href="<%= record.get("URL") %>" target="_blank" style="color: inherit; text-decoration:
                none;">상세보기</a>
            </div>
          </div>
        </div>
        <% } %>
    </div>
  </div>
  
  <% Paginations paginations=(Paginations)result.get("paginations"); %>

  </div>
  <nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="/search/selectSearch?currentPage=<%=paginations.getPreviousPage()%>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Previous</a>
      </li>

      <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
        <li class="page-item">
          <a class="page-link" href="/search/selectSearch?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">
            <%= i %>
          </a>
        </li>
        <% } %>

        <li class="page-item">
          <a class="page-link" href="/search/selectSearch?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Next</a>
        </li>

    </ul>
  </nav>
  <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>
</body>

</html>
