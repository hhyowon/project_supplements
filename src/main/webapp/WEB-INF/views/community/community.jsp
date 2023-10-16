<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %> 
<%@ page import="com.example.project_supplements.utils.Paginations" %>

<!DOCTYPE html>
   
<!DOCTYPE html>
    <html lang="en">
        <link href="" rel="stylesheet" type="text/css">
        <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>
    <body>
        <form action="/resources/static/css/maintool.css" method="get">
           

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
                    <a data-bs-toggle="modal" href="#modalTarget-center">
                        <button class="btn mx-2  mb-2 float-end submit btn-outline-secondary">작성하기</button></a>
                    <!-- 모달 창 -->
                    <form id="modalForm" method="GET" action="/community/communityModal" > 
                        <div class="modal" id="modalTarget-center">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <select class="form-select" name="CATEGORY" style="width: 150px;">
                                            <option value="">카테고리</option> <!-- value 추가 -->
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
                                        <button type="submit" id="submitButton" class="btn btn-white btn-outline-secondary" formaction="/community/communityModal">입력</button>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </form>
                            <div class="container">
                            <form action="" method="GET">
                                    <div class="d-flex justify-content-center align-items-center input-group mb-3">
                                        <div class="d-flex align-items-center">
                                            <div class="input-group">
                                                <select class="form-select" name="search" id="" style="width: 150px;">
                                                    <option>선택</option>
                                                    <option value="COMMUNITY_TITLE"<%=(searchStr.equals("COMMUNITY_TITLE")) ? "selected" : "" %>>제목</option>
                                                    <option value="USER_ID"<%=(searchStr.equals("USER_ID")) ? "selected" : "" %>>등록자</option>
                                                </select>
                                                <input type="text" name="words" value='<%= params.getOrDefault("words", "") %>'
                                                class="form-control" placeholder="검색어를 입력하세요" id="keydownEnter"
                                                style="width: 300px;" />     
                                                <button class="btn btn-main" type="submit" formaction="/community/selectSearch" formmethod="get">검색</button>
                                            </div>
                                        </div>
                                    </div>
                                <br>
                                <table class="table table-bordered" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="width: 7%;">번호</th>
                                        <th style="width: 10%;">카테고리</th>
                                        <th>제목</th>
                                        <th>등록자</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                    <% 
                                    ArrayList resultList=(ArrayList)result.get("resultList"); 
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd"); // dateFormat 객체 선언 추가
                                    for(int i=0; i < resultList.size(); i=i+1){
                                        HashMap record=(HashMap)resultList.get(i); 
                    
                                        String dateString = (String) record.get("COMMUNITY_DATE");
                                        String formattedDate = ""; 
                                        
                                        try {
                                            java.util.Date parsedDate = dateFormat.parse(dateString);
                                            formattedDate = dateFormat.format(parsedDate);
                                        } catch (ParseException e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                    <tr>
                                        <td><%= i+1 %></td>
                                        <td><%= record.get("CATEGORY") %></td>
                                        <td><a style=" color:black; text-decoration: none;" href="/community/communityPost/<%= record.get("COMMUNITY_ID") %>"><%= record.get("COMMUNITY_TITLE") %></a></td>
                                        <td><%= record.get("USER_ID") %></td>
                                        <td><%= formattedDate %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            </form>
                    <%
                    Paginations paginations = (Paginations)result.get("paginations"); 
                    %> 
                   
                  
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="/community?currentPage=<%=paginations.getPreviousPage()%>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Previous</a>
                        </li>

                        <%
                        for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                        %>
                        <li class="page-item">
                            <a class="page-link" href="/community?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">
                                <%= i %>
                            </a>
                            </li>
                        <%
                        }
                        %>

                        <li class="page-item">
                            <a class="page-link" href="/community?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Next</a>
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
    
</body>

</html>
