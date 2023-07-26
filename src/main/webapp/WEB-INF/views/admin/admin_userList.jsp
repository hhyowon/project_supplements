<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
    <html lang="en">
        <body>
            <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>
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
                        <option>선택</option>
                        <option value="name">이름</option>
                        <option value="ID">아이디</option>
                      </select>
                      <input type="text" placeholder="검색어를 입력하세요" class="form-control"style="width: 300px;" />
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
                            <th>USER_ID</th>
                            <th>이름</th>
                            <th>성별</th>
                            <!--<th>PASSWORD</th>-->
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>E-mail</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                      <tbody id="list">
                            <% ArrayList resultList=(ArrayList)result.get("resultList"); 
                                    for(int i=0; i < resultList.size(); i=i+1){
                                        HashMap record=(HashMap)resultList.get(i); %>
                        <tr>
                            <td><%= i+1 %></td>
                            <td><%= record.get("USER_ID") %></td>
                            <td><%= record.get("NAME") %></td>
                            <td><%= record.get("Gender") %></td>
                            <!--<td><%= record.get("PASSWORD") %></td>-->
                            <td><%= record.get("PHONENUMBER") %></td>
                            <td><%= record.get("ADDRESS") %></td>
                            <td style="width: 120px;"><%= record.get("EMAIL") %></td>
                              <td>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">관리</button>
                              </td>
                        </tr>
                       <% } %>
                        </tbody>
                    </table>
                     <%
                    Paginations paginations = (Paginations)result.get("paginations"); 
                    %> 
                   
                <div>총 게시글 : <%= paginations.getTotalCount() %></div>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="/admin?currentPage=<%=paginations.getPreviousPage()%>">Previous</a></li>

                        <%
                        for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                        %>
                        <li class="page-item">
                            <a class="page-link" href="/admin?currentPage=<%= i %>"><%= i %></a>
                        </li>
                        <%
                        }
                        %>

                        <li class="page-item">
                            <a class="page-link" href="/admin?currentPage=<%= paginations.getNextPage() %>">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
      </body>   
      </html>