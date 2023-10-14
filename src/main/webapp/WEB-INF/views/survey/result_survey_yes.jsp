<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>

<!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Google Charts API -->
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        </head>
    <body>
        <%@ include file="/WEB-INF/views/etc/Header.jsp" %> 
        <%   
        String jsonData = (String) request.getAttribute("dataArray");// 차트를 위한 JSON 데이터 가져오기 
        String jsonData2 = (String) request.getAttribute("dataArray2");          
        %>
        <% HashMap params=(HashMap)request.getAttribute("params"); 
        HashMap result=(HashMap)request.getAttribute("result");%>

          <div class="container"> 
            <!-- <div style="float: right; width: 600px; margin-top: 6cm;"> -->
               
                

                    <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">복용자의 설문통계 결과</h3>
                <br>
                <!-- 파이 차트를 표시할 div 요소 -->
            <div style="display: flex; justify-content: space-between;">
                <div id="pieChart" style="width: 50%; height: 400px;"></div>
                <div id="pieChart2" style="width: 50%; height: 400px;"></div>
            </div>
            
            <table class="table table-bordered ">
                <thead>
                    <tr>
                        <th class=text-center><h5 style="color: #5B9BD5;">질문</h5></th>
                        <th class=text-center><h5 style="color: #5B9BD5;">답변</h5></th>
                        <th class=text-center><h5 style="color: #5B9BD5;">답변자 수 </h5></th>
                    </tr>
                </thead>
                <tbody> 
                    <% 
                    ArrayList resultList=(ArrayList)result.get("resultList");
                    String previousquestion = "";

                    for (int i=0; i < resultList.size(); i++) 
                    {HashMap record=(HashMap)resultList.get(i); 
                    String surveyquestion=(String)record.get("SURVEY_QUESTION"); 
                    String surveyoption=(String)record.get("SURVEY_OPT"); 
                    Long surveycount=(Long)record.get("COUNT(*)"); 
                    %>
                    <tr> 
                        <% 
                        if (!surveyquestion.equals(previousquestion)) { 
                        %>
                         <td><%= surveyquestion %></td>
                            <%previousquestion = surveyquestion;} 
                            else {previousquestion = surveyquestion;%>
                                <td></td>
                                <%} %>

                         <td><%= surveyoption %></td>
                         <td><%= surveycount %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>
</body>
<script type='text/javascript'>
    // Load the Visualization API and the corechart package
    google.charts.load('current', { 'packages': ['corechart'] });
  
    // Set a callback to run when the Google Visualization API is loaded
    google.charts.setOnLoadCallback(drawCharts)
     
    // Function to draw the charts
    function drawCharts() {

      // Data for Pie Chart 보조제별
      var SurveyPro = JSON.parse('<%= jsonData %>'); // JSON 데이터를 가져옴
      console.log(SurveyPro);  
      var pieData1 = new google.visualization.DataTable();
      pieData1.addColumn('string', 'SURVEY_OPT');
      pieData1.addColumn('number', 'SURVEY_OPT_COUNT');

      for (var i = 0; i < SurveyPro.length; i++) {
        pieData1.addRow([SurveyPro[i].SURVEY_OPT, parseInt(SurveyPro[i].SURVEY_OPT_COUNT)]);
      }
      // Options for Pie Chart1 보조제별
      var pieOptions1 = {
        title: '보조제별',
        titleTextStyle: {
        fontSize: 20  // 여기서 숫자는 원하는 글꼴 크기로 조정할 수 있습니다.
        },
        width: 600,   // 원하는 너비로 설정
        height: 400,   // 원하는 높이로 설정
        colors: ['#8db1ff', '#b2e9ff', '#c2c2c2', '#6f95f8', '#9ad8f5', '#d5d5d5', '#5482f5', '#82c6ea']

      };

      // Data for Pie Chart2 복용 원인
      var surveyCause = JSON.parse('<%= jsonData2 %>'); // JSON 데이터를 가져옴
      console.log(surveyCause);  
      var pieData2 = new google.visualization.DataTable();
      pieData2.addColumn('string', 'SURVEY_OPT');
      pieData2.addColumn('number', 'SURVEY_OPT_COUNT');

      for (var i = 0; i < surveyCause.length; i++) {
        pieData2.addRow([surveyCause[i].SURVEY_OPT, parseInt(surveyCause[i].SURVEY_OPT_COUNT)]);
      }

      // Options for Pie Chart1 복용 원인s
      var pieOptions2 = {
        title: '복용 원인',
        titleTextStyle: {
        fontSize: 20  // 여기서 숫자는 원하는 글꼴 크기로 조정할 수 있습니다.
        },
        width: 600,   // 원하는 너비로 설정
        height: 400,   // 원하는 높이로 설정
        colors: ['#8db1ff','#b2e9ff','#c2c2c2']
      };

      var pieChart1 = new google.visualization.PieChart(document.querySelector('#pieChart'));
      pieChart1.draw(pieData1, pieOptions1);
        
      var pieChart2 = new google.visualization.PieChart(document.querySelector('#pieChart2'));
      pieChart2.draw(pieData2, pieOptions2);
    }
</script>

</html>

