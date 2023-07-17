<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap 5 Template</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
        <div class="container">
            <nav class="navbar navbar-expand">
                <div class="navbar-brand">
                    <div>
                        <a href="mainnavs.html">
                            <img class="mb-4" src="img/logo.PNG" alt width="220" height="90">
                        </a>
                    </div>
                </div>

                <div class="navbar-nav me-auto"> <!--m:마진, e:end(오른쪽)-->
                    <a class="nav-link" href="survey.html">설문조사</a>
                    <a class="nav-link" href="search.html">검색</a>
                    <a class="nav-link" href="community.html">커뮤니티</a>
                    <a class="nav-link" href="rank.html">랭킹</a>
                    <a class="nav-link" href="bmi.html" style="color: #5B9BD5;">BMI</a>
                </div>
                <div>
                    <a class="nav-link" href="./admin/userList.html">관리자전용</a>
                </div>
                <div>
                    <a class="nav-link" href="login.html">로그인</a>
                </div>
               
                <div class="dropdown nav-item">
                    <button class="btn btn-drak dropdown-toggle"
                        data-bs-toggle="dropdown">회원관리</button><!--버튼 버튼색 버튼화살표토글 / 토글효과 : 드롭다운-->
                    <ul class="dropdown-menu">
                        <li class="dropdown-item">
                            <a class="nav-link" href="/main/selectDetail/{ID}">마이페이지</a>
                        </li>
                        <li class="dropdown-item">
                            <a class="nav-link" href="/main/insertForm">회원가입</a>
                        </li>
                        <li class="dropdown-divider"></li> <!--drowdown메뉴안에서 라인으로 나누기 -->
                        <li class="dropdown-item">
                            <a class="nav-link" href="mainnavs.html">로그아웃</a>
                        </li>
                    </ul>
                </div>
               
            </nav>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
