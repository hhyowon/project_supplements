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
        <li class="d-flex align-items-center">
          <a href="/admin" class="text-decoration-none nav-link"
            >회원 관리</a
          >
        </li>
        <li class="d-flex align-items-center">
          <a
            href="./admin_search.html"
            class="text-decoration-none nav-link"
            >보조제 관리</a
          >
        </li>
        <li class="d-flex align-items-center">
          <a
            href="./admin_community.html"
            class="text-decoration-none nav-link"
            >커뮤니티 관리</a
          >
        </li>
        <li class="d-flex align-items-center">
          <a
            href="./admin_survey.html"
            class="text-decoration-none nav-link"
            >설문조사 관리</a
          >
        </li>
        <br>
        <li class="d-flex align-items-center">
          <a
            href="../mainnavs.html"
            class="text-decoration-none nav-link fw-bold"
            >로그아웃</a
          >
        </li>
      </ul>
    </div>
  </nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>