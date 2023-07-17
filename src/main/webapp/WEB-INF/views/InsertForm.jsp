<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <title>Insert Form</title>
</head>

<body>
    <div class="container">
        <div class="container text-center">
          <h1 > 회원가입
            <hr class='hr-solid' />
          </h1>
        </div>
      </div>
    <div class="container pb-5 px-5" style="width: 700px;">
        <form id="insertForm" action="" method="post">
            <div class="px-5">
                <div class="py-2">
                    <lable class="form-label" for="idusername">이름</lable>
                    <input class="form-control" type="text" placeholder="name" name="NAME" id="idname" style="width: 500px;">
                </div>
          
                <div class="py-2">
                    <label class="form-label">성별</label>
                </div>   
                <div>
                    <input type="radio" name="GENDER_UID" value="G_01" id="male">
                    <label for="male">남자</label>
        
                    <input type="radio" name="GENDER_UID" value="G_02" id="female">
                    <label for="female">여자</label>
                </div>
                <div>

                    <div class="py-2"><!--아이디 작성-->
                    <label class="form-label" for="idid">아이디 </label>
                    <input class="form-control" type="id" name="USER_ID" id="idid" style="width: 500px;">
                    </div>
        
                    <div class="py-2"><!--비밀번호 작성-->
                    <label class="form-label" for="idpw">비밀번호 </label>
                    <input class="form-control" type="password" name="PASSWORD" id="idpw" placeholder="123456" style="width: 500px;">
                    </div>
        
                    <div class="py-2"><!--비밀번호 확인란 작성-->
                    <label class="form-label" for="idpw">비밀번호 확인</label>
                    <input class="form-control" type="password" name="passwordck" id="idpasswordck"
                        style="width: 500px;">
                    </div>
        
                    <div class="py-2"><!--연락처-->
                    <label class="form-label" for="idphonenumber">연락처</label>
                    <input class="form-control" type="text" name="PHONENUMBER" value="" placeholder="010-****-****" id="idphonenumber"
                        style="width: 500px;">
                    </div>
        
                    <div class="py-2"><!--Address-->
                    <label class="form-label" for="idaddress">주소</label>
                    <input class="form-control" type="text" name="ADDRESS" value="" placeholder="우리집비밀" id="idaddress"
                        style="width: 500px;">
                    </div>
        
                    <div class="py-2"><!--이메일 작성-->
                    <label class="form-label" for="idemail">Email </label>
                    <input class="form-control" type="email" name="EMAIL" id="idemail" placeholder="otter@yojulab.com"
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
            

            <hr class="mb-4" />
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="aggrement" name="PRIVACY_INFO" required />
              <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
            </div>
            <P></P>
            <div>
              <button type="submit" class="btn btn-main float-end" formaction="/main/insertAndSelectSearch">회원가입</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>