<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <!-- 마이페이지 사이드바-->
 <main>
  <div class="row g-0 vh-100">
    <nav class="p-5 navbar-light bg-light d-md-block col-2">
      <div>
        <ul class="list-unstyled navbar-nav">
          <li class="d-flex align-items-center">
            <div class="text-decoration-none nav-link fs-5 fw-bold">마이페이지</div>
          </li>
          <li class="d-flex align-items-center">
            <a href="/mypage/main" class="text-decoration-none nav-link">개인정보 수정</a>
          </li>
          <li class="d-flex align-items-center">
            <a href="/mypage/community" class="text-decoration-none nav-link">내가 작성한 글</a>
          </li>
          <li class="d-flex align-items-center">
            <a href="/mypage/surveylist" class="text-decoration-none nav-link">설문조사 이력</a>
          </li>
          <li class="d-flex align-items-center">
            <a href="/mypage/mypageBMI" class="text-decoration-none nav-link">나의 BMI</a>
         </li>
          <br>
          <li class="d-flex align-items-center">
            <a href="./mainnavs.html" class="text-decoration-none nav-link fw-bold">로그아웃</a>
          </li>
        </ul>
      </div>
    </nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>