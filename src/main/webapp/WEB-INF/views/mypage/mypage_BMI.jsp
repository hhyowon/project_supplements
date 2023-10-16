<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<body>
  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->

  <!-- 마이페이지 옆-->
<main>
  <div class="row g-0 vh-100">
    <%@ include file= "/WEB-INF/views/etc/Sidebar.jsp" %><!-- 마이페이지 sidebar -->
   
    <% 
              HashMap params=(HashMap)request.getAttribute("params"); 
              String searchStr=(String)params.getOrDefault("search", ""); 
              HashMap result=(HashMap)request.getAttribute("result"); %>

    <div class="col-9 p-0 mb-5 ms-5">
      <br>
      <br>
      <div class="container">
  
      <div class="container">
        <h1 style="color: #123658; font-weight: bold;">나의 BMI 관리</h1>
        <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">나의 BMI 그래프</h2>
          <canvas id="myChart"></canvas>

        <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">나의 BMI 표</h2>
          <table class="ui celled table table text-center table-bordered table-hover">
              <thead>
                  <tr style="background: #8cc1f3;">
                      <th>번호</th>
                      <th>등록일</th>
                      <th>신장</th>
                      <th>체중</th>
                      <th>BMI</th>
                      <th>BMI결과</th>
                  </tr>
              </thead>
              <tbody id="list">
                <% ArrayList<HashMap> resultList = (ArrayList<HashMap>) result.get("resultList"); 
                for(int i = 0; i < resultList.size(); i++) {
                  int number = i + 1;
                  HashMap<String, Object> record = resultList.get(i);
                %>
                <tr>
                  <td style="width: 7%;"><%= number %></td>
                  <td><%= record.get("DATE") %></td> 
                  <td><%= record.get("HEIGHT") %></td>
                  <td><%= record.get("WEIGHT") %></td>
                  <td><%= record.get("BMI_RESULT") %></td>
                  <td><%= record.get("BMI_TYPE") %></td>
                </tr> 
                <% }  %>
              </tbody>
          </table>
      </div>
    </main>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
    var dateData = [<% for(HashMap record: resultList) { %> "<%= record.get("DATE") %>", <% } %>];
    var bmiData = [<% for(HashMap record: resultList) { %> <%= record.get("BMI_RESULT") %>, <% } %>];

    var ctx = document.getElementById('myChart').getContext('2d');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dateData,
            datasets: [{
                label: 'BMI',
                data: bmiData,
                borderColor: 	'#F6CEE3',
                fill: false
            }]
        },
        options: {
            scales: {
                x: {
                  type: 'time',
                    time: {
                        unit: 'day', // 날짜 형식을 'day'로 설정 (YY-MM-DD)
                        tooltipFormat: 'YY-MM-DD', // 툴팁에 표시되는 날짜 형식
                        displayFormats: {
                            day: 'YY-MM-DD'
                        }
                    }
                }
            }
        }
    });
</script>

</html>
