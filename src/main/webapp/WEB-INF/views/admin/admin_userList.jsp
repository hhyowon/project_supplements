<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
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
            <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>

            <% 
            HashMap params=(HashMap)request.getAttribute("params"); 
            String searchStr=(String)params.getOrDefault("search", ""); 
            HashMap result=(HashMap)request.getAttribute("result"); 
            %>
 <!-- 관리자페이지 옆-->
  <div class="row g-0 vh-100">
    <nav class="p-5 navbar-light bg-light d-md-block col-2">
      <div>
        <ul class="list-unstyled navbar-nav">
          <li class="d-flex align-items-center">
            <div class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</div>
          </li>
          <li class="d-flex align-items-center">
            <a href="./admin_userList.html" class="text-decoration-none nav-link"
              >회원 관리</a
            >
          </li>
          <li class="d-flex align-items-center">
            <a
              href="./admin_search.html"
              class="text-decoration-none nav-link"
              >보조제 관리</a
            >
          </li>
          <li class="d-flex align-items-center">
            <a
              href="./admin_community.html"
              class="text-decoration-none nav-link"
              >커뮤니티 관리</a
            >
          </li>
          <li class="d-flex align-items-center">
            <a
              href="./admin_survey.html"
              class="text-decoration-none nav-link"
              >설문조사 관리</a
            >
          </li>
          <br>
          <li class="d-flex align-items-center">
            <a
              href="../mainnavs.html"
              class="text-decoration-none nav-link fw-bold"
              >로그아웃</a
            >
          </li>
        </ul>
      </div>
    </nav>

    <div class="col-9 p-0 mb-5 ms-5">
            <div style="text-align:center;">
                <h1 class="h3 mb-3 fw-normal">회원 관리</h1> 
            </div>
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
            <div class="container">
                <table class="table text-center table-bordered table-hover">
                    <thead class="bg-secondary bg-opacity-10">
                        <tr>
                            <th class="col-1">번호</th>
                            <th>USER_ID</th>
                            <th>이름</th>
                            <th>성별</th>
                            <th>PASSWORD</th>
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
                          <td> 1</td>
                          <td><%= record.get("USER_ID") %></td>
                          <td><%= record.get("NAME") %></td>
                          <td><%= record.get("GENDER_UID") %></td>
                          <td><%= record.get("PASSWORD") %></td>
                          <td><%= record.get("PHONENUMBER") %></td>
                          <td><%= record.get("ADDRESS") %></td>
                          <td><%= record.get("EMAIL") %></td>
                            <td>
                              <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        </html>
<!--jsp참고용
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
            <title>Document</title>
        </head>

        <body>
            <%@ include file="/top_menus.jsp" %>
            <div style="text-align:center;">
                <img class="mb-4" src="https://i.namu.wiki/i/fmqo9BhDdF7UaaWj1u36bOCuOxoOCjFX78s7ZlHcIW63TzCUpuWU37aXQHwFbNeAVTasWMtTWJYSmUtlwGtT6Q.webp" alt="" width="200" height="200">
                <h1 class="h3 mb-3 fw-normal">회원정보</h1> 
            </div>
            <div class="container">
                <% String search=(String) request.getAttribute("search"); %>
                    <form action="/optionInforsJSPServlet">
                        <label>검색
                            <input type="text" name="search" value="<%= search %>">
                        </label>
                        <button class="btn btn-outline-dark"  >검색 하기</button>
                    </form> 
                    <P></P>
            </div>

            <div class="container">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>RESPONDENTS_ID</th>
                            <th>NAME</th>
                            <th>상세정보</th>
                        </tr>
                    </thead>
                    <% ArrayList optionInforList=new ArrayList<>();
                        optionInforList = (ArrayList)request.getAttribute("optionInforList");
                        %>
                        <tbody>
                            <% for(int i=0; i< optionInforList.size(); i=i+1) { %>
                                <% HashMap optionInforRecord=new HashMap<>();
                                    optionInforRecord = (HashMap) optionInforList.get(i);
                                    %>
                                    <form>
                                        <input type="hidden" name="unique_id" value="<%= optionInforRecord.get("RESPONDENTS_ID") %>">

                                        <tr>
                                            <td>
                                                <%= optionInforRecord.get("RESPONDENTS_ID") %>
                                            </td>
                                            <td>
                                                <%= optionInforRecord.get("RESPONDENTS") %>
                                            </td>
    
                                            <td>
                                                
                                                <button class="btn btn-outline-dark"type="submit" formaction="/optionInforSelectServlet">
                                                    <%= optionInforRecord.get("RESPONDENTS") %> 상세정보
                                                </button>
                                            </td>
                                        </tr>
                                    </form>
                                    <% } %>
                        </tbody>
                </table>
            </div>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        </html> -->