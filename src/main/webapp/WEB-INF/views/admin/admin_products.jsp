<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
            <link rel="stylesheet" href="../../css/maintool.css">
            <title>보조제관리</title>
        </head>
        
        <body>
          
<div class="row g-0 vh-100">
  <%@ include file= "/WEB-INF/views/etc/Admin_Sidebar.jsp" %><!-- 관리자페이지 옆-->
            
  <div class="col-9 p-0 mb-5 ms-5">
          <div style="text-align:center;">
              <h1 class="h3 mb-3 fw-normal">회원 관리</h1> 
          </div>
          <% 
          HashMap params=(HashMap)request.getAttribute("params"); 
          String searchStr=(String)params.getOrDefault("search", ""); 
          HashMap result=(HashMap)request.getAttribute("result"); 
          %>
          <br>
          <div class="container">
            <form action="">
              <div class="d-flex justify-content-center align-items-center input-group mb-3">
                <div class="d-flex align-items-center">
                  <div class="input-group">
                      <select class="form-select" name="keyField" id="" style="width: 100px;">
                        <option>카테고리</option>
                        <option value="name">상품명</option>
                        <option value="ingredient">효과</option>
                        <option value="form">제형</option>
                      </select>
                      <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                      class="form-control" placeholder="원하는 상품명, 효과, 제형 검색하기..." id="keydownEnter"
                      style="width: 500px;" />
                      <button class="btn btn-main" type="submit" formaction="" formmethod="get">검색</button>
                    </div>
                  </div>
                </div>
              </form>
          </div>
          
            <br>
            <div class="container " style="padding: 20px;">
                <table class="table text-center table-bordered table-hover">
                    <thead class="bg-secondary bg-opacity-10">
                        <tr>
                            <th class="col-1">번호</th>
                            <th>상품이미지</th>
                            <th>상품명</th>
                            <th>제형</th>
                            <th>효과</th>
                            <th>상세보기</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                      <tbody id="list">
                            <% ArrayList resultList = (ArrayList) result.get("resultList"); 
                            for (int i = 0; i < resultList.size(); i++) {
                                HashMap record = (HashMap) resultList.get(i); %>
                        <tr>
                            <td><%= i+1 %></td>
                            <td><img src="<%= record.get("PRODUCT_IMG") %>" alt="Image" style="height:50px;"></td>
                            <td><%= record.get("PRODUCT") %></td>
                            <td><%= record.get("FORMULATION") %></td>
                            <td><%= record.get("EFFECT") %></td>
                            <td><a style="color:black; text-decoration:none;" href="<%= record.get("URL") %>">상세보기</a></td>
                            
                            <td>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">수정</button>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">삭제</button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                    </table>
                     <%
                    Paginations paginations = (Paginations)result.get("paginations"); 
                    %> 
                   
                <div>총 상품 : <%= paginations.getTotalCount() %></div>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="/adminaproduct/?currentPage=<%=paginations.getPreviousPage()%>">Previous</a></li>

                        <%
                        for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                        %>
                        <li class="page-item">
                            <a class="page-link" href="/adminaproduct/?currentPage=<%= i %>"><%= i %></a>
                        </li>
                        <%
                        }
                        %>

                        <li class="page-item">
                            <a class="page-link" href="/adminaproduct/searchList?currentPage=<%= paginations.getNextPage() %>">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
      </body>   
      </html>