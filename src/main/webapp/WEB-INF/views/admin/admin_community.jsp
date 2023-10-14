<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Google Charts API -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
<body>
<form action="/resources/static/css/maintool.css" method="get">
    <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- header-->
    <div class="row g-0 vh-100">
        <%@ include file= "/WEB-INF/views/etc/Admin_Sidebar.jsp" %><!-- 관리자페이지 옆-->
        <% 
                    HashMap params=(HashMap)request.getAttribute("params"); 
                    String searchStr=(String)params.getOrDefault("search", ""); 
                    HashMap result=(HashMap)request.getAttribute("result"); %>
        <% 
                    String jsonData = (String) request.getAttribute("dataArray");// JSON 데이터 가져오기 
                    String jsonData2 = (String) request.getAttribute("dataArray2");
                    
        %>
        <div class="col-9 p-0 mb-5 ms-5">
                <div style="text-align:center;">
                    <h1 class="h3 mb-3 fw-normal">커뮤니티 관리</h1>
                </div>
                <br>
                <div class="container">
                    <h5 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;"> 커뮤니티 통계</h5>
                        <div id="lineChart" style="width: 100%; height: 400px;"></div>           
                    <br>
                    <h5 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;"> 전체 커뮤니티 관리</h5>
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
                                                <button class="btn btn-main" type="submit" formaction="/admincommunity/selectSearch" formmethod="get">검색</button>
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
                                <tbody id="list">
                                    <% ArrayList resultList=(ArrayList)result.get("resultList");
                                                for(int i=0; i < resultList.size(); i=i+1){
                                                    int number = i+1;
                                                    HashMap record=(HashMap)resultList.get(i);
                                                    String userId = (String) record.get("USER_ID"); %>
                                        <tr>
                                            <td><%= number %></td> 
                                            <td><%= record.get("CATEGORY") %></td>
                                            <td><%= record.get("COMMUNITY_TITLE") %></a></td>
                                            <td><%= record.get("USER_ID") %></td>
                                            <td><%= record.get("COMMUNITY_DATE") %></td>
                                            <td>
                                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="/admincommunity/communityPost/<%= record.get("COMMUNITY_ID") %>">답변하기</button>
                                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="/admincommunity/deleteAndSelectSearch/<%= record.get("COMMUNITY_ID") %>">삭제</button>
                                            </td> 
                                        </tr>
                                        <% }  %>
                                    </tbody>
                                </table>
                        </form>
            <%
            Paginations paginations = (Paginations)result.get("paginations"); 
            %> 
           
          
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="/admincommunity/selectSearch?currentPage=<%=paginations.getPreviousPage()%>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Previous</a>
                    </li>

                    <%
                    for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                    %>
                    <li class="page-item">
                        <a class="page-link" href="/admincommunity/selectSearch?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">
                            <%= i %>
                        </a>
                        </li>
                    <%
                    }
                    %>

                    <li class="page-item">
                        <a class="page-link" href="/admincommunity/selectSearch?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Next</a>
                    </li>
                </ul>
            </nav>
        
        </div>
    </div>
        
</form>

</body>

</html>
<script type='text/javascript'>
    // Load the Visualization API and the corechart package
    google.charts.load('current', { 'packages': ['corechart'] });
  

        // Set a callback to run when the Google Visualization API is loaded
        google.charts.setOnLoadCallback(drawCharts)

       
  
    // Function to draw the charts
    function drawCharts() {

        var comuCNT = JSON.parse('<%= jsonData %>'); // JSON 데이터를 가져옴
        console.log(comuCNT);  
         // Data for Line Chart  월별로 커뮤니티 게시글 수
         let lineData = new google.visualization.DataTable();
            lineData.addColumn('string', '연도_월');
            lineData.addColumn('number', '게시글_수');

            for (var i = 0; i < comuCNT.length; i++) {
                 lineData.addRow([comuCNT[i].연도_월, parseInt(comuCNT[i].게시글_수)]);
                  }

            let lineOptions = {
                title: '월별 게시글 수',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

      // Draw the charts
      let lineChart = new google.visualization.LineChart(document.querySelector('#lineChart'));
            lineChart.draw(lineData, lineOptions);


    }
</script>