<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
            
                    <a href="" class="btn mx-2  mb-2 float-end" style="background-color: #5B9BD5; color: white; border-color: transparent;">글쓰기</a>
                    <button class="btn mx-2  mb-2 float-end submit " style="background-color: #5B9BD5; color: white; border-color: transparent;">목록</button>
                    <a data-bs-toggle="modal" href="#modalTarget-center"><button class="btn mx-2  mb-2 float-end submit" style="background-color: #5B9BD5; color: white; border-color: transparent;">작성하기</button></a>
                    <!-- 모달 창 -->
                    <div class="modal" id="modalTarget-center">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header" > 
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="카테고리" id="Q&A">
                                        <label class="form-check-label" for="Q&A">
                                          질문
                                        </label>
                                      </div>
                                      
                                      <div class="form-check">
                                        <input class="form-check-input" type="radio" name="카테고리" id="review">
                                        <label class="form-check-label" for="review">
                                          후기
                                        </label>
                                      </div>
                                      
                                      <div class="form-check">
                                        <input class="form-check-input" type="radio" name="카테고리" id="recommend">
                                        <label class="form-check-label" for="recommend">
                                          추천
                                        </label>
                                      </div>
    
                                </div>
                                <div class="modal-body form-group " style="background-color: #c0daf5">
                    
                                    제목 : <input type="text" class="form-control" style="width: 100%;" > </br>
                                   
                                    내용 :  <textarea class="form-control" rows="15"></textarea></div>
                                 
                                <div class="modal-footer">
                                    <button class="btn btn-white btn-outline-dark" style="background-color: #5B9BD5; color: white; border-color: transparent;" data-bs-dismiss="modal">입력</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
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
                
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                          <a class="page-link" href="" aria-label="Previous"><span aria-hidden="true"><</span></a>
                        </li>
                        <li class="page-item">
                        <a class="page-link" href="">1</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="">2</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="">3</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="" aria-label="Next"><span aria-hidden="true">></span></a>
                        </li>
                    </ul>
            
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
            

            <%@ include file="/WEB-INF/views/etc/Footer.jsp" %> <!-- footer --> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>

</html>