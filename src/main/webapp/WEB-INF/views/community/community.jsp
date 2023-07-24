<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
    <!DOCTYPE html>
    <html lang="en">
        <link href="" rel="stylesheet" type="text/css">
    <body>
        <form action="/resources/static/css/maintool.css" method="get">
            <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>

            <% 
            HashMap params=(HashMap)request.getAttribute("params"); 
            String searchStr=(String)params.getOrDefault("search", ""); 
            HashMap result=(HashMap)request.getAttribute("result"); 
            %>

        <div class="container ">
            <h2 class="ui teal image header text-center">
                커뮤니티
            </h2>
            <br>
            
                <div class="container mx-auto" style="padding: 20px; border-radius: 10px ; width: 70%;">      
                    <a data-bs-toggle="modal" href="#modalTarget-center"><button class="btn mx-2  mb-2 float-end submit btn-outline-secondary">작성하기</button></a>
                    <!-- 모달 창 -->
                    <form id="modalForm" method="GET" action="" > 
                        <div class="modal" id="modalTarget-center">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <select class="form-select" name="CATEGORY" style="width: 150px;">
                                            <option>카테고리</option>
                                            <option value="C_01">질문</option>
                                            <option value="C_02">후기</option>
                                            <option value="C_03">추천</option>
                                        </select>
                                        <input type="text" class="form-control" name="TITLE" style="width: 100%;" placeholder="제목을 입력하시오"> </br>
                                    </div>
                                    <div class="modal-body form-group ">
                                        <textarea class="form-control" name="CONTENT" rows="15" placeholder="내용을 입력하세요"></textarea>
                                    </div>
                    
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-white btn-outline-secondary" formaction="/community/communityModal">입력</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                    <table class="table table-bordered" style="text-align: center;">
                         <thead>
                            <tr>
                                <th>번호</th>
                                <th>카테고리</th>
                                <th>제목</th>
                                <th>등록자</th>
                                <th>등록일</th>
                                </tr>
                        </thead>
                        <tbody id="list">
                            <% ArrayList resultList=(ArrayList)result.get("resultList"); 
                                    for(int i=0; i < resultList.size(); i=i+1){
                                        HashMap record=(HashMap)resultList.get(i); %>
                            <tr>
                                <td><%= record.get("COMMUNITY_ID") %></td>
                                <td><%= record.get("CATEGORY") %></td>
                                <td><%= record.get("COMMUNITY_TITLE") %></td>
                                <td><%= record.get("USER_ID") %></td>
                                <td><%= record.get("COMMUNITY_DATE") %></td>
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
                        <li class="page-item"><a class="page-link" href="/community?currentPage=<%=paginations.getPreviousPage()%>">Previous</a></li>

                        <%
                        for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                        %>
                        <li class="page-item">
                            <a class="page-link" href="/community?currentPage=<%= i %>"><%= i %></a>
                        </li>
                        <%
                        }
                        %>

                        <li class="page-item">
                            <a class="page-link" href="/community?currentPage=<%= paginations.getNextPage() %>">Next</a>
                        </li>
                    </ul>
                </nav>
            
            </div>
        </div>
            
            <div class="ui modal" id='view_modal'>
                <i class="close">x</i>
                <div class="header" id="b_title">
                </div>
                <div class="content">
                    <div class="description">
                        <p style = "text-align: right" id = "b_review"></p>
                        <div id = 'b_content'></div>
                    </div>
                </div>
                <div class="actions">
                    <div class="ui black deny button">
                        닫기
                    </div>
                </div>
            </div>
            
    </form>
    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %> <!-- footer --> 

</body>

</html>