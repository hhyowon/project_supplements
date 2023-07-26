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
      <div style="text-align:center;">
          <h1 class="h3 mb-3 fw-normal">나의 BMI 관리</h1>
      </div>
      <br>
      <br>
      <div class="container">
        <div style="width: 900px; height: 500px;">
          <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">나의 BMI 변화</h2>
          <!--차트가 그려질 부분-->
          <canvas id="myChart"></canvas>
        </div>
      </div>
     
      <div class="container">
        <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">나의 BMI 표</h2>
          <table class="ui celled table table text-center table-bordered table-hover">
              <thead>
                  <tr style="background: #8cc1f3;">
                      <th>번호</th>
                      <th>등록일</th>
                      <th>신장</th>
                      <th>체중</th>
                      <th>BMI</th>
                  </tr>
              </thead>
              <tbody id="list">
                <% ArrayList resultList=(ArrayList)result.get("resultList"); 
                for(int i=0; i < resultList.size(); i=i+1){
                  int number = i+1;
                    HashMap record=(HashMap)resultList.get(i); %>
                <tr>
                  <td style="width: 7%;" ><%= number %></td>
                  <td><%= record.get("YEAR") %></td> 
                  <td><%= record.get("HEIGHT") %></td>
                    <td><%= record.get("WEIGHT") %></td>
                    <td><%= record.get("BMI_RESULT") %></td>
                </tr> 
                <% }  %>
            </tbody>
          </table>
      </div>
    </main>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
  var context = document
      .getElementById('myChart')
      .getContext('2d');
  var myChart = new Chart(context, {
      type: 'line', // 차트의 형태
      data: { // 차트에 들어갈 데이터
          labels: [
              //x 축
              '22.7.18','22.12.5','23.3.18','23.7.18','',''
          ],
          datasets: [
              { //데이터
                  label: 'BMI', //차트 제목
                  fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                  data: [
                      20.3,22.3,24.3,20 //x축 label에 대응되는 데이터 값
                  ],
                  backgroundColor: [
                      //색상
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(255, 206, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(255, 159, 64, 0.2)'
                  ],
                  borderColor: [
                      //경계선 색상
                      'rgba(255, 99, 132, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(255, 206, 86, 1)',
                      'rgba(75, 192, 192, 1)',
                      'rgba(153, 102, 255, 1)',
                      'rgba(255, 159, 64, 1)'
                  ],
                  borderWidth: 1 //경계선 굵기
              }
          ]
      },
      options: {
          scales: {
              yAxes: [
                  {
                    ticks: {
                          min: 10,
                          max: 35,
                          stepSize: 5
                      }
                  }
              ]
          }
      }
  });
</script>
</html>