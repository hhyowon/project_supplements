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
  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- Menu --> 

 

<!--BMI 페이지-->
<div class="container">
  <h2 class="ui teal image header text-center">
    BMI  <hr class='hr-solid'/>
  </h2>
  <br>
  <br>
  <h3 style="color: #5B9BD5; font-weight: bold;">신체질량지수(BMI) 계산</h2>

  <div class="box bg text_center bmi"><!--긁어왔어요 조효원이 담당할게요..디비랑 자바까지-->
      <fieldset class="border rounded p-3">
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

            <form method="post" onsubmit="calculate(event)">
              <div class="row row row-cols-auto">
                <div class="col">
                  <label for="input_height_obesity">신장 (cm)</label>
                </div>
                <div class="col">
                  <span class="s4">
                    <input type="text" title="신장" id="input_height_obesity" class="form-control" style="width:104px; ime-mode:disabled;">
                  </span>
                </div>
                <div class="col">
                  <label for="input_weight_obesity">체중 (kg)</label>
                </div>
                <div class="col">
                  <span class="s5">
                    <input type="text" title="체중" id="input_weight_obesity" class="form-control" style="width:104px; ime-mode:disabled;">
                  </span>
                </div>
                <div class="col">
                  <button type="submit" class="btn btn-main" formaction="/bmi/insertBMI">계산하기</button>
                </div>
              </div>
            </form>
            
              <div class="row">
                <div class="col mt-3" style="font-weight: bold;">
                    <div id="result" style="font-size: 20px;"></div>
                </div>
              </div>
            
              <div class="row">
                <div class="col">
                  <div id="imageContainer"></div>
                </div>
              </div>
         </ul> 
        </div>
      </fieldset>
	</div>
  
  <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">신체질량지수(BMI) 계산법</h2>
    <div class="equation1" style="border: 1px solid lightgray; padding: 20px; border-radius: 10px; text-align: center;">
      <span class="item">체질량 지수(BMI)</span>
      <span class="item equal">=</span>
      <span class="item divide"><span class="molecular">체중 (kg)</span> <span class="operator">/</span> <span class="denominator">[키 (m)]<sup>2</sup></span></span>
    </div>
  

    <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">신체질량지수(BMI) 판정표</h2>
        <table class="table table-bordered" style="width: 100%;">
            <caption>판정 기준 - 계산식, 신체질량지수(BMI) = 체중(kg) / [신장(m)]2을 안내합니다.</caption>
            <colgroup>
                <col style="width:20%">
                <col style="width:30%">
                <col style="width:25%">
                <col style="width:25%">
            </colgroup>
            <thead>
            <tr>
                <th scope="col" rowspan="2"><b>분 류</b></th>
                <th scope="col" rowspan="2"><b>체질량지수<br>(kg/m²)</b></th>
                <th scope="col" colspan="2"><b>허리둘레에 따른 비만 동반 질환의 위험도</b></th>
            </tr>
            <tr>
                <th scope="col">90cm미만 (남자) / 85cm미만 (여자)</th>
                <th scope="col">90cm이상 (남자) / 85cm이상 (여자)</th>
            </tr>
            </thead>
            <tbody class="text_center">
            <tr>
                <th>저 체 중</th>
                <td>18.5미만</td>
                <td>낮  음</td>
                <td>보  통</td>
            </tr>
            <tr>
                <th>정 상</th>
                <td>18.5이상 ~ 22.9이하</td>
                <td>보  통</td>
                <td>약간높음</td>
            </tr>
            <tr>
                <th>비만전단계</th>
                <td>23이상 ~ 24.9이하</td>
                <td>약간높음</td>
                <td>높  음</td>
            </tr>
            <tr>
                <th>1단계 비만</th>
                <td>25이상 ~ 29.9이하</td>
                <td>높  음</td>
                <td>매우높음</td>
            </tr>
            <tr>
                <th>2단계 비만</th>
                <td>30이상 ~ 34.9이하</td>
                <td>매우높음</td>
                <td>가장높음</td>
            </tr>
            <tr>
                <th>3단계 비만</th>
                <td>35이상</td>
                <td>가장높음</td>
                <td>가장높음</td>
            </tr>
            </tbody>
        </table>   
</div>

</body>

<script>
  function calculate(event) {
    event.preventDefault();
        var height = parseInt(document.getElementById("input_height_obesity").value);
        var weight = parseInt(document.getElementById("input_weight_obesity").value);
      
  
    // Check if height and weight are valid numbers
    if (isNaN(height) || isNaN(weight)) {
          document.getElementById("result").textContent = "유효한 신장과 체중을 입력해주세요.";
          document.getElementById("imageContainer").innerHTML = "";
          return;
        }
      
        var result = weight / ((height / 100) * (height / 100));
  
        document.getElementById("result").textContent = "나의 신체질량지수(BMI) : " + result.toFixed(2);
  
    var imageSrc = "/html/img/BMI.PNG"; // Default image source
  
    var imageHtml = "<img src='" + imageSrc + "' alt='Result Image' />";
    document.getElementById("imageContainer").innerHTML = imageHtml;
  }
  </script>

</html>
