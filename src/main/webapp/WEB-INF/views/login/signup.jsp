<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../toy_publishings/css/commons.css">
    <link rel="stylesheet" href="/css/maintool.css">
</head>  
<body>
  
  <!-- Menu -->
      <div class="container">
        <div class="container text-center">
          <h1 > 회원가입
            <hr class='hr-solid' />
          </h1>
        </div>
      </div>
    </br>

  <form id="insertForm" method="post" action="/signup/insert" > <!-- 폼-->
    <div class="container pb-5 px-5" style="width: 700px;">
      <div class="px-5">

        <div class="py-2">
          <lable class="form-label" for="name">이름</lable>
          <input class="form-control" type="text" placeholder="이름" name="NAME" id="name" style="width: 500px;">
        </div>

        <div class="py-2">
          <label class="form-label">성별</label>
          <div>
            <input type="radio" name="GENDER_UID" value="G-01" id="male">
            <label for="male">남자</label>

            <input type="radio" name="GENDER_UID" value="G-02" id="female">
            <label for="female">여자</label>
          </div>
        <div>

        <div class="py-2"><!--아이디 작성-->
          <label class="form-label" for="userid">아이디 </label>
          <input class="form-control" type="id" name="USER_ID" id="userid" placeholder="hyowon0605" style="width: 500px;">
        </div>

        <div class="py-2"><!--비밀번호 작성-->
          <label class="form-label" for="pw">비밀번호 </label>
          <input class="form-control" type="password" name="PASSWORD" id="pw" placeholder="123456"
            style="width: 500px;">
        </div>

        <!-- <div class="py-2">
          <label class="form-label" for="chkpw">비밀번호 확인</label>
          <input class="form-control" type="password" name="CHKPW" id="chkpw"
            style="width: 500px;">
        </div> -->

        <div class="py-2"><!--연락처-->
          <label class="form-label" for="phnum">연락처</label>
          <input class="form-control" type="text" name="PHONENUMBER" value="" placeholder="010-****-****" id="phnum"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--Address-->
          <label class="form-label" for="address">주소</label>
          <input class="form-control" type="text" name="ADDRESS" value="" placeholder="우리집비밀" id="address"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--이메일 작성-->
          <label class="form-label" for="email">Email </label>
          <input class="form-control" type="email" name="EMAIL" id="email" placeholder="otter@yojulab.com"
            style="width: 500px;">
        </div>
      </div>
        <p>
          <label for="auth" class="sr-only">Auth</label>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="SYSTEM_MANAGER" value="SYSTEM_MANAGER">
              <label class="form-check-label" for="ROLE_MANAGER">SYSTEM MANAGER</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="ROLE_ADMIN" value="ROLE_ADMIN">
              <label class="form-check-label" for="ROLE_ADMIN">ADMIN</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="auth" id="USER" value="ROLE_USER">
              <label class="form-check-label" for="USER">USER</label>
            </div>
          </p>
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
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" name="PRIVACY_INFO" required />
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <P></P>
          <div>
            <button class="btn btn-main float-end" type="submit" >회원가입</button>
          </div>
    </form>
  </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>