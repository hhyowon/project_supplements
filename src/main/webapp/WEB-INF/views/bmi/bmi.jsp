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
          <!-- 이전 페이지로 돌아가는 버튼 -->
          <button class="btn" style="position: absolute; top: 10px; right: 20px; font-size: 35px; color: rgb(109, 109, 109);" onclick="goBack()">X</button>

    <div style="float: right; width: 600px; margin-top: 6cm;">
      <img src="/html/img/BMI.jpg" alt="" height="500">
    </div>
    <div style="float: right; width: 40%; margin-top: 2cm;">
      <h4 class="ui teal image header text-center" style="margin-top: 6cm;">
        건강을 체크해보고 싶다면<br>
        BMI를 계산해보세요!<br>
        <span style="font-weight: bold;">당신의 체중과 키를 입력하세요.</span> 
      </h4>
      <div class="container py-3 d-flex justify-content-center align-items-center">
        <div class="text-center"> 
          <form class="form-signin" method="get">
            <div class="form-group">
              <input type="text" title="신장" name="HEIGHT" id="height" class="form-control" placeholder="키를 입력하세요 " style="width:280px;  margin-top: 30px; ime-mode:disabled">
            </div>
            <div class="form-group">
              <input type="text" title="체중" name="WEIGHT" id="weight"  class="form-control" placeholder="몸무게를 입력하세요 " style="width:280px; margin-top: 20px; ime-mode:disabled;">
            </div>
            <div class="form-group" style="margin-top: 30px;">
              <button type="submit" style="width:280px;" class="btn btn-main" formaction="/bmi/insertBMI">계산하기</button>
            </div>   
          </form>
          
        </div> 
      </div>
    </div>
    <div style="clear: both;"></div>
  </div>
</body>

<script>
  function goBack() {
    window.history.back();
  }
</script>
</html>
