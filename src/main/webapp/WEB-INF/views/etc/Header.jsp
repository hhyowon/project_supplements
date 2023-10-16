<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <sec:authentication property="principal" var="userDetailsBean" />

        <head>
            <form>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
                <link rel="stylesheet" href="../toy_publishings/css/commons.css">
                <link rel="stylesheet" href="../../css/maintool.css">

                <div class="container">
                    <nav class="navbar navbar-expand">
                        <div class="navbar-brand">
                            <div>
                                <a href="/home">
                                    <img class="mb-4" src="/html/img/logo.PNG" alt width="220" height="90">
                                </a>
                            </div>
                        </div>
                        <div class="navbar-nav me-auto"> <!--m:마진, e:end(오른쪽)-->
                                    <a class="nav-link" href="/survey" style="color:#858688;">설문조사</a>
                                    <a class="nav-link" href="/search/searchList" style="color:#858688;">검색</a>
                                    <a class="nav-link" href="/community" style="color:#858688;">커뮤니티</a>
                                    <a class="nav-link" href="/rank" style="color:#858688;">랭킹</a>
                                    <a class="nav-link" href="/bmi/mainBMI" style="color: #5B9BD5;">BMI</a>
                        </div>
                        <sec:authorize access="isAuthenticated()">
                            <li class="nav-link" style="text-decoration: none; color: navy;">
                                <!-- ID: ${userDetailsBean.memberId}, -->
                                ${userDetailsBean.memberName}님이 
                                로그인중입니다&#x1F60A
                            </li>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <!-- <div>
                                <a class="nav-link" href="/admin/adminCharts" style="color:black">관리자전용</a>
                            </div> -->
                            <div>
                                <a class="nav-link" href="/admin/" style="color:black">관리자전용</a>
                            </div>
                            </sec:authorize>
                        </sec:authorize>
                        <div class="dropdown nav-item">
                            <button class="btn btn-drak dropdown-toggle" data-bs-toggle="dropdown">
                                회원관리
                            </button><!--버튼 버튼색 버튼화살표토글 / 토글효과 : 드롭다운-->
                            <ul class="dropdown-menu">
                                <!-- 로그인 전 -->
                                <sec:authorize access="isAnonymous()">
                                <li class="dropdown-item">
                                    <a class="nav-link" href="/signup">회원가입</a>
                                </li>
                                <li class="dropdown-item">
                                    <a class="nav-link" href="/loginForm">로그인</button>
                                </li>
                                </sec:authorize>
                                <!-- 로그인 후-->
                                <sec:authorize access="isAuthenticated()">
                                <li class="dropdown-item">
                                    <a class="nav-link" href="/mypage/main">마이페이지</a>
                                </li>
                                <li class="dropdown-item">
                                    <button class="nav-link btn btn-none" formaction="/logout" method="post">
                                        로그아웃
                                    </button>
                                </li>
                                </sec:authorize>
                            </ul>
                        </div>
                    </nav>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            </form>
        </head>