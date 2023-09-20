<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
  <link rel="stylesheet" href="/css/maintool.css">
  <title>BMI</title>
</head>
<body>
  <!--BMI 페이지-->
  <div class="container">
    <h4 class="ui teal image header text-center" style="margin-top: 6cm;">
      BMI 계산을 해볼까요? <br>
      당신의 건강을 체크해보고 싶다면, <br>
      <span style="font-weight: bold;">당신의 체중과 키를 입력하세요.</span> 
    </h4>
    <img class="mb-4" src="/bin/main/static/html/img/machine.png" alt width="200" height="200" style="display: block; margin-left: auto; margin-right: auto;">
    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-md-4">
            <form class="form-signin" method="get" style="margin-top: 20px;">
              <div class="style3" style="margin-bottom: 15px; ">
                <input type="radio" id="sex_m" value="M" name="sex" class="input_radio" onclick="" checked="">
                <label for="sex_m" class="space"> 남자</label>
                <input type="radio" id="sex_f" value="F" name="sex" class="input_radio" onclick="">
                <label for="sex_f"> 여자</label>
              </div>
              <div class="form-group" style="margin-bottom: 15px;">
                <input class="form-control" type="password" name="password" placeholder="비밀번호를 입력하세요" id="idpassword">
              </div>
          
              <div class="text-center" style="margin-top: 20px;">
                <button type="submit" class="btn btn-main" formaction="/bmi/insertBMI">계산하기</button>
              </div>   
            </form>
        </div> 
      </div> 
    </div> 
s
   
   
    <div class="box bg text_center bmi">
        <div class="cal">
          <ul>
            <br>
            <div class="style3">
              성별
              <input type="radio" id="sex_m" value="M" name="sex" class="input_radio" onclick="" checked="">
              <label for="sex_m" class="space">남자</label>
              <input type="radio" id="sex_f" value="F" name="sex" class="input_radio" onclick="">
              <label for="sex_f">여자</label>
            </div>
            <br>
            <form method="get" onsubmit="calculate(event)" action="">
              <div class="row row row-cols-auto">
                <div class="col">
                  <label for="height">신장 (cm)</label>
                </div>
                <div class="col">
                  <span class="s4">
                    <input type="text" title="신장" name="HEIGHT" id="height" class="form-control"
                      style="width:104px; ime-mode:disabled;">
                  </span>
                </div>
                <div class="col">
                  <label for="weight">체중 (kg)</label>
                </div>
                <div class="col">
                  <span class="s5">
                    <input type="text" title="체중" id="weight" name="WEIGHT" class="form-control"
                      style="width:104px; ime-mode:disabled;">
                  </span>
                </div>
                <div class="col">
                  <button type="submit" class="btn btn-main" formaction="/bmi/insertBMI">계산하기</button>
                </div>
              </div>
            </form>
          </ul>
        </div>
    </div>
  </div>
</body>
</html>
