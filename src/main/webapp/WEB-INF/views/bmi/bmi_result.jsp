
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.example.project_supplements.utils.Commons" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- ... -->
</head>
<body>
  <%@ include file="/WEB-INF/views/etc/Header.jsp" %> <!-- header -->
  <div class="container">
    <!-- ... -->
    <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">BMI 결과</h3>
    <div class="equation1" style="border: 1px solid lightgray; padding: 20px; border-radius: 10px; text-align: center;">
    
      <% 
      HashMap params = (HashMap) request.getAttribute("params"); 
      HashMap result = (HashMap) request.getAttribute("result"); 
      %>

      <% if (result != null) { %>
        <%
          Object bmiResultObj = result.get("BMI_RESULT");
          Object bmiTypeObj = result.get("BMI_TYPE");
          DecimalFormat decimalFormat = new DecimalFormat("0.00");
          String bmiResult = decimalFormat.format(bmiResultObj);
          String bmiType = (String) bmiTypeObj;
        %>
        <p>BMI 값은 <strong style="font-size: 1.5em;"><%= bmiResult %></strong>, BMI 결과 <strong style="font-size: 1.5em;"><%= bmiType %></strong> 입니다.</p>
      <% } else { %>
        <%-- 데이터 유형이 맞지 않는 경우에 대한 처리 --%>
        <p>올바른 결과가 없습니다.</p>
      <% } %>
      
      <table align="center" cellspacing="10">
        <tr>
            <td style="padding: 5px; background-color: #c2c2c2; width: 350px; height: 30px;">
                <p class="light_mass" style="margin: 0; color: white; font-weight: bold;">저체중</p>
            </td>
            <td style="padding: 5px; background-color: #b2e9ff; width: 180px; height: 30px;">
                <p class="normal" style="margin: 0; color: white; font-weight: bold;">정상</p>
            </td>
            <td style="padding: 5px; background-color: #8db1ff; width: 180px; height: 30px;">
                <p class="before_mass" style="margin: 0; color: white; font-weight: bold;">과체중</p>
            </td>
            <td style="padding: 5px; background-color: #79b7fd; width: 180px; height: 30px;">
                <p class="before_mass" style="margin: 0; color: white; font-weight: bold;">비만</p>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; font-weight: bold;">18.5</td>
            <td style="text-align: right; font-weight: bold;">23</td>
            <td style="text-align: right; font-weight: bold;">25</td>
        </tr>
    </table>

    </div>

    <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">BMI 계산식</h3>
    <div class="equation1" style="border: 1px solid lightgray; padding: 20px; border-radius: 10px; text-align: center;">
      <span class="item">체질량 지수(BMI)</span>
      <span class="item equal">=</span>
      <span class="item divide"><span class="molecular">체중 (kg)</span> <span class="operator">/</span> <span class="denominator">[키 (m)]<sup>2</sup></span></span>
    </div>
    <br>
    <h3 style="color: #5B9BD5; font-weight: bold; margin-top: 30px;">BMI 판정표</h3>
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
      <tbody>
        <tr>
          <th>저 체 중</th>
          <td>18.5미만</td>
          <td>낮음</td>
          <td>보통</td>
        </tr>
        <tr>
          <th>정 상</th>
          <td>18.5이상 ~ 22.9이하</td>
          <td>보통</td>
          <td>약간높음</td>
        </tr>
        <tr>
          <th>비만전단계</th>
          <td>23이상 ~ 24.9이하</td>
          <td>약간높음</td>
          <td>높음</td>
        </tr>
        <tr>
          <th>1단계 비만</th>
          <td>25이상 ~ 29.9이하</td>
          <td>높음</td>
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