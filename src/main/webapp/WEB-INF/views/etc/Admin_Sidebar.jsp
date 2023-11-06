<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <main>
  <!-- 관리자페이지 옆-->
<div class="row g-0 vh-100">
  <nav class="p-5 navbar-light bg-light d-md-block col-2">
    <div>
      <ul class="list-unstyled navbar-nav">
        <li class="d-flex align-items-center">
          <div class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</div>
        </li>

        <!-- <li class="d-flex align-items-center">
          <a href="/admin/adminCharts" class="text-decoration-none nav-link">
            통계 관리
          </a>  
        </li> -->

        <li class="d-flex align-items-center">
          <a href="/admin/" class="text-decoration-none nav-link">
            회원 관리
          </a>
        </li>


        <li class="d-flex align-items-center">
          <a
            href="/adminproduct/selectSearch"
            class="text-decoration-none nav-link"
            >보조제 관리</a >

        </li>
        <li class="d-flex align-items-center">
          <a href="/admincommunity/selectSearch" class="text-decoration-none nav-link">
            커뮤니티 관리
          </a>
        </li>
        <li class="d-flex align-items-center">
          <a href="/adminsurvey/surveyList" class="text-decoration-none nav-link">
            설문조사 관리
          </a>
        </li>
        <br>
      </ul>
    </div>
  </nav>

</html>