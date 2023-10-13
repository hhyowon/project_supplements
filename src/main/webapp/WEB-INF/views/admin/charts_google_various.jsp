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
            <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>
        <div class="row g-0 vh-100">
              <%@ include file= "/WEB-INF/views/etc/Admin_Sidebar.jsp" %><!-- 관리자페이지 옆-->
              <div class="col-9 p-0 mb-5 ms-5">
                <div class="container mt-4">
                       <div class="row">
                        <!-- Bar Chart -->
                        <div class="col" id="barChart"></div>

                    </div>
                    <div class="row">
                        <!-- Pie Chart and Line Chart -->
                        <div class="col-sm-6" id="pieChart"></div>
                        <div class="col-sm-6" id="lineChart"></div>
                    </div>

                    <!-- Google Maps Container -->
                    <div class="row">
                        <div class="col" id="map"></div>
                    </div>
                </div>
            </div>
        </div>   
 <!-- JavaScript Code -->
    <script type='text/javascript'>
        // Load the Visualization API and the corechart package
        google.charts.load('current', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded
        google.charts.setOnLoadCallback(drawCharts);

        // Function to draw the charts
        function drawCharts() {
            // Data for Bar Chart
            let barData = google.visualization.arrayToDataTable([
                ['Category', 'Value'],
                ['Category A', 10],
                ['Category B', 20],
                ['Category C', 15]
            ]);

            // Options for Bar Chart
            let barOptions = {
                title: 'Bar Chart'
            };

            // Data for Pie Chart
            let pieData = google.visualization.arrayToDataTable([
                ['Fruit', 'Quantity'],
                ['Apple', 30],
                ['Banana', 20],
                ['Orange', 50]
            ]);

            // Options for Pie Chart
            let pieOptions = {
                title: 'Pie Chart'
            };

            // Data for Line Chart
            let lineData = new google.visualization.DataTable();
            lineData.addColumn('number', 'X');
            lineData.addColumn('number', 'Line1');
            lineData.addColumn('number', 'Line2');

            lineData.addRows([
                [1, 5, 7],
                [2, 9, 3],
                [3, 2, 6]
            ]);

            let lineOptions = {
                title: 'Line Chart',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            let barChart = new google.visualization.BarChart(document.querySelector('#barChart'));
            barChart.draw(barData, barOptions);

            let pieChart = new google.visualization.PieChart(document.querySelector('#pieChart'));
            pieChart.draw(pieData, pieOptions);

            let lineChart = new google.visualization.LineChart(document.querySelector('#lineChart'));
            lineChart.draw(lineData, lineOptions);
        }

        // Coordinates and Location Names
        let locations = [
            { lat: 37.5666791, lng: 126.9782914, name: '서울' },
            { lat: 37.566535, lng: 126.9779692, name: '광화문' },
            { lat: 37.5586867, lng: 126.9782364, name: '명동' },
            { lat: 37.5551483, lng: 126.9707136, name: '남대문 시장' },
            { lat: 37.5617981, lng: 127.0071515, name: '강남역' },
            { lat: 37.5701391, lng: 127.0079479, name: '삼성동' },
            { lat: 37.5296212, lng: 127.0325739, name: '잠실' }
        ];

        // Initialize and Display the Map
        function initMap() {
            let map = new google.maps.Map(document.querySelector('#map'), {
                zoom: 12,
                center: { lat: 37.5666791, lng: 126.9782914 } // Seoul Coordinates
            });

            // Add Markers and Info Windows
            for (let i = 0; i < locations.length; i++) {
                let marker = new google.maps.Marker({
                    position: locations[i],
                    map: map,
                    title: locations[i].name
                });

                let infowindow = new google.maps.InfoWindow({
                    content: locations[i].name
                });

                marker.addListener('click', function () {
                    infowindow.open(map, this);
                });
            }
        }
    </script>

   


            
         </body>
    </html>

   