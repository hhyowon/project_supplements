<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations" %>
    <!DOCTYPE html>
    <html lang="en">
    <link href="" rel="stylesheet" type="text/css">
    <body>
        <form action="/resources/static/css/maintool.css" method="get">
            <%@ include file="/WEB-INF/views/etc/Header.jsp" %>

                <% HashMap params=(HashMap)request.getAttribute("params"); String
                    searchStr=(String)params.getOrDefault("search", "" ); HashMap
                    result=(HashMap)request.getAttribute("result"); %>
                    <div class="container ">
                        <h2 class="ui teal image header text-center">
                            커뮤니티
                        </h2>
                        <br>
                        <div class="container mx-auto" style="padding: 20px; border-radius: 10px ; width: 70%;">    
                            <!-- 모달 창 -->
                            <div class="modal" id="modalTarget-center">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <select class="form-select" id="categorySelect" name="카테고리" style="width: 200px;">
                                                <option>카테고리</option>
                                                <option value="Q&A">질문</option>
                                                <option value="review">후기</option>
                                                <option value="recommend">추천</option>
                                                <input type="text" class="form-control" style="width: 100%;" placeholder="제목을 입력하세요"></P>
                                            </select>
                                        </div>
                                        
                                        <div class="modal-body form-group " style="background-color: #c0daf5">
                                            내용 : <textarea class="form-control" rows="15"></textarea></div>

                                        <div class="modal-footer">
                                            <button class="btn btn-white btn-outline-dark"
                                                style="background-color: #5B9BD5; color: white; border-color: transparent;"
                                                data-bs-dismiss="modal">작성</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <table class="table table-bordered" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>카테고리</th>
                                        <th>제목</th>
                                        <th>등록자</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                    <c:set var="num" value="${searchVo.totalCount - ((searchVo.curPage-1) * 10) }"/>
                                    <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int i=0; i <
                                        resultList.size(); i=i+1){ HashMap record=(HashMap)resultList.get(i); %>
                                        <tr>
                                            <td>
                                                <%= record.get("COMMUNITY_ID") %>
                                            </td>
                                            <td>
                                                <%= record.get("CATEGORY") %>
                                            </td>
                                            <td>
                                                <%= record.get("COMMUNITY_TITLE") %>
                                            </td>
                                            <td>
                                                <%= record.get("USER_ID") %>
                                            </td>
                                            <td>
                                                <%= record.get("COMMUNITY_DATE") %>
                                            </td>
                                        </tr>
                                        <% } %>
                                </tbody>
                            </table>
                            <a data-bs-toggle="modal" href="#modalTarget-center"><button
                                class="btn mx-2  mb-2 float-end submit btn-outline-secondary">작성하기</button></a>

                                <%
                                Paginations paginations = (Paginations)result.get("paginations");
                                %>
                                <div>총 갯수 : <%= paginations.getTotalCount() %></div>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="/community/communityMain?currentPage=<%=paginations.getPreviousPage()%>">Previous</a> </li>
        
                                        <%
                                        for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="/community/communityMain?currentPage=<%= i %>"><%= i %></a>
                                        </li>
                                        <%
                                        }
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="/community/communityMain?currentPage=<%=paginations.getNextPage()%>">Next</a>
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
                                <p style="text-align: right" id="b_review"></p>
                                <div id='b_content'></div>
                            </div>
                        </div>
                        <div class="actions">
                            <div class="ui black deny button">
                                닫기
                            </div>
                        </div>
                    </div>


                    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %> <!-- footer -->
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        </form>
    </body>

    </html>