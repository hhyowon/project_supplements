<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <link rel="stylesheet" href="/css/maintool.css">
</head>  
<body>
  
  <!-- Menu -->
      <div class="container">
        <img class="mb-4" src="/html/img/signdiet.jpg" alt width="700" height="350" style="display: block; margin-left: auto; margin-right: auto;">
        <div class="container">
          <h2><strong>회원가입</strong></h2>
          0124의 회원이 되면 
          다양한 혜택을 이용할 수 있습니다 <hr class='hr-solid' />
        </div>
      </div>
    </br>

  <form id="insertForm" method="post" action="/signup/insert" > <!-- 폼-->
    <div class="container pb-5 px-5" style="width: 700px;">
      <div class="px-5">

        <div class="py-2">
          <label class="form-label" for="name">이름</label>
          <input class="form-control" type="text" placeholder="이름을 입력하세요" name="NAME" id="name" style="width: 500px;">
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

        <!--아이디 작성(효원추가)-->
        <div class="form-group">
          <label class="form-label" for="userid">아이디</label>
          <input class="form-control" type="id" name="USER_ID" id="userid" placeholder="ID를 입력하세요" style="width: 500px;">
          <button type="button" onclick="preCheckID(event)" class="btn btn-secondary" id="checkDuplicate" style="margin-top: 10px;">중복 확인</button>
      </div>
      <div id="idMessage"></div>


        <div class="py-2"><!--비밀번호 작성-->
          <label class="form-label" for="pw">비밀번호 </label>
          <input class="form-control" type="password" name="PASSWORD" id="pw" placeholder="패스워드를 입력하세요"
              style="width: 500px;">
      </div>
      
      <div class="py-2"><!--비밀번호 확인(효원추가)--> 
          <label class="form-label" for="pw_confirm">비밀번호 확인</label>
          <input class="form-control" type="password" id="pw_confirm" placeholder="패스워드를 다시 입력하세요" style="width: 500px;">
          <div id="message"></div>
      </div>

        <div class="py-2"><!--연락처-->
          <label class="form-label" for="phnum">연락처</label>
          <input class="form-control" type="tel" name="PHONENUMBER" value="" placeholder="010-****-****" id="phnum"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--Address-->
          <label class="form-label" for="address">주소</label>
          <input class="form-control" type="text" name="ADDRESS" value="" placeholder="주소를 입력하세요" id="address"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--이메일 작성-->
          <label class="form-label" for="email">Email </label>
          <input class="form-control" type="email" name="EMAIL" id="email" placeholder="9998@example.com"
            style="width: 500px;">
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
      <p>
        
        <!-- <label for="auth" class="sr-only"></label>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="auth" id="SYSTEM_MANAGER" value="SYSTEM_MANAGER">
            <label class="form-check-label" for="ROLE_MANAGER">SYSTEM MANAGER</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="auth" id="ROLE_ADMIN" value="ROLE_ADMIN">
            <label class="form-check-label" for="ROLE_ADMIN">ADMIN</label>
          </div>  
          <hr class="mb-4">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="auth" id="USER" value="ROLE_USER">
            <label class="form-check-label" for="USER">USER</label>
          </div> -->
        </p>
          <hr class="mb-4" />
          <!-- <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" name="PRIVACY_INFO" required />
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div> -->
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="auth" id="USER" value="ROLE_USER">
            <label class="form-check-label" for="USER">개인정보 수집 및 이용에 동의합니다.</label>
          </div> 
          <P></P>
          <div class="row">
            <div class="col-md-6">
              <button class="btn btn-secondary float-end me-2" type="button" onclick="window.location.href='/home'">홈</button>
            </div>
            <div class="col-md-6">
              <button class="btn btn-main btn-block" type="submit">가입하기</button>
            </div>
          </div>
  </form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  var password = document.getElementById("pw");
  var confirmPassword = document.getElementById("pw_confirm");
  var message = document.getElementById("message");

  // 입력란이 변경될 때마다 비밀번호 일치 여부 확인
  password.addEventListener("input", checkPassword);
  confirmPassword.addEventListener("input", checkPassword);

  function checkPassword() {
      var passwordValue = password.value;
      var confirmPasswordValue = confirmPassword.value;

      if (passwordValue === confirmPasswordValue) {
          message.innerHTML = "비밀번호 확인 완료";
          message.style.color = "green";
      } else {
          message.innerHTML = "비밀번호가 일치하지 않습니다.";
          message.style.color = "red";
      }
  }

  function checkForm(event) {
    var form = document.getElementById("insertForm"); // 폼 요소를 ID로 가져옵니다.
    var inputs = form.querySelectorAll("input"); // 폼 안의 모든 input 요소를 선택합니다.

    var genderSelected = false; // 성별 옵션을 선택했는지 여부를 확인하는 플래그입니다.

    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].value === "") { // 입력란이 비어있는 경우
            alert("모든 입력란을 채워주세요.");
            event.preventDefault(); // 이벤트 기본 동작을 중지하고
            return false; // 함수 실행을 중지합니다.
        }

        if (inputs[i].type === "radio" && inputs[i].name === "GENDER_UID" && inputs[i].checked) {
            // 라디오 버튼이 선택되었는지 확인하고 선택된 경우
            genderSelected = true; // 성별 옵션을 선택했다고 표시합니다.
        }
    }

    // 성별 옵션을 선택하지 않은 경우
    if (!genderSelected) {
        alert("성별을 선택해주세요.");
        event.preventDefault(); // 이벤트 기본 동작을 중지하고
        return false; // 함수 실행을 중지합니다.
    }
}

// 폼 제출 이벤트 리스너를 폼 요소에 추가합니다.
document.getElementById("insertForm").addEventListener("submit", checkForm);


</script>
<script src="/js/checkID.js"></script>


</html>