<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap Mypage</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
  <link rel="stylesheet" href="../css/maintool.css">
</head>

<body>
<%@ include file="../Header.jsp" %> 
  <!-- 마이페이지 옆-->
 <main>
  <div class="row g-0 vh-100">
    <nav class="p-5 navbar-light bg-light d-md-block col-2">
      <div>
        <ul class="list-unstyled navbar-nav">
          <li class="d-flex align-items-center">
            <div class="text-decoration-none nav-link fs-5 fw-bold">마이페이지</div>
          </li>
          <li class="d-flex align-items-center">
            <a href="./mypage.html" class="text-decoration-none nav-link">개인정보 수정</a>
          </li>
          <li class="d-flex align-items-center">
            <a href="./mypage_community.html" class="text-decoration-none nav-link">내가 작성한 글</a>
          </li>
          <li class="d-flex align-items-center">
            <a href="./mypage_survey.html" class="text-decoration-none nav-link">설문조사 이력</a>
          </li>
          <li class="d-flex align-items-center">
            <a href="./mypage_BMI.jsp" class="text-decoration-none nav-link">나의 BMI</a>
         </li>
          <br>
          <li class="d-flex align-items-center">
            <a href="./mainnavs.html" class="text-decoration-none nav-link fw-bold">로그아웃</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="col-9">
    <h3 class="text-center">
      개인정보 수정
    </h3>

    <div class="container col-9 pb-5 px-5" style="width: 700px;">
      <form action="index.html "> <!-- 폼-->
        <div class="px-5">
          <div class="py-2">
            <lable class="form-label" for="idusername">이름</lable>
            <input class="form-control" type="text" placeholder="name" name="name" id="idname" style="width: 500px;">
          </div>

          <div class="py-2">
            <div>
              <div class="py-2"><!--아이디 작성-->
                <label class="form-label" for="idid">아이디 </label>
                <input class="form-control" type="id" name="id" id="idid" placeholder="hyowon0605" 
                  style="width: 500px;">
              </div>

              <div class="py-2"><!--비밀번호 작성-->
                <label class="form-label" for="idpw">비밀번호 </label>
                <input class="form-control" type="password" name="password" id="idpassword" placeholder="123456"
                  style="width: 500px;">
              </div>

              <div class="py-2"><!--비밀번호 확인란 작성-->
                <label class="form-label" for="idpw">비밀번호 확인</label>
                <input class="form-control" type="password" name="passwordck" id="idpasswordck" style="width: 500px;">
              </div>

              <div class="py-2"><!--연락처-->
                <label class="form-label" for="idphonenumber">연락처</label>
                <input class="form-control" type="text" name="phonenumber" value="" placeholder="010-****-****"
                  id="idphonenumber" style="width: 500px;">
              </div>

              <div class="py-2"><!--Address-->
                <label class="form-label" for="idaddress">주소</label>
                <input class="form-control" type="text" name="address" value="" placeholder="우리집비밀" id="idaddress"
                  style="width: 500px;">
              </div>

              <div class="py-2"><!--이메일 작성-->
                <label class="form-label" for="idemail">Email </label>
                <input class="form-control" type="email" name="emailAddress" id="idemail"
                  placeholder="otter@yojulab.com" style="width: 500px;">
              </div>
            </div>
            <!-- Ad receive check -->
            <div class="form-group row mt-3">
              <div class="col-sm-3">광고수신여부 :</div>
              <div class="col-sm-9">
                SMS <input type="checkbox" name="SMS_AD" class="" id="" /> /
                Email <input type="checkbox" name="EMAIL_AD" id="" /> 로
                수신하겠습니다
              </div>
            </div>

            <hr class="mb-4" />

            <div class="float-end">
              <button type="button" class="btn btn-main">취소</button>
              <button type="submit" class="btn btn-main" formaction="mainnavs.html">수정완료</button>
            </div>
      </form>
    </div>
  </div>
</main> 
<%@ include file="../Footer.jsp" %>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>