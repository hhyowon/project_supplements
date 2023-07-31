<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="userDetailsBean" />
<!DOCTYPE html>

<body style="background-color:white" >
  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->
  <form action="">
  <div class="container" >
    <div class="text-center">
      <img src="/html/img/online-survey.png" alt="" height="70">
        <br> <br> 
      <h5>당신을 더 건강하게 만들 준비가 되셨나요? </h5>
      <h5>흥미진진한 다이어트 보조제 설문조사에 참여하고 </h5>
      <h5>당신에게 딱 맞는 맞춤형 권장 사항의 힘을 발견하세요!</h5>
    </div>
    <br>
    <div class="container py-5">
      <div class="row">
        <div class="col-md-6">
          <div class="card mb-4" style="border-radius: 50px; border-width: 4px;">
            <div class="pro-card-color card-title text-center mt-4 ">
              <h2>복용 경험 없는 자</h2>
              <hr>
            </div>
            <div class="card-body text-center mb-2">
              <p class="card-text">설문조사를 통해 당신에게 맞는 보조제를 찾아봅시다!</p>
              <p class="card-text">우리도 이제 다이어트 성공할 수 있습니다!</p>
            </div>
            <div class="card-desc text-center mb-2">
              <div>
                <p>솔직한 응답은 향후 권장사항을 구성하고 </p>
                식품 보충제의 효과성 향상에 기여할 것입니다.   
              </div>
              <br>
              <img src="/html/img/person.png" alt="" height="150">
              <div class="text-center mt-4 mb-4">
                <input type="hidden" name="SURVEY_TYPE_ID" value="F-01">
                <sec:authorize access="isAuthenticated()">
                <button type="submit"  formaction="/survey/no" class="btn btn-outline-secondary" style="border-radius: 20px;"name="SURVEY_TYPE_ID" value="F-01">설문조사 하러가기</button>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <button type="button" class="btn btn-white btn-main" data-bs-toggle="modal" data-bs-target="#myModal2">설문조사하러가기</button>
                </sec:authorize>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-md-6">
          <div class="card mb-4" style="border-radius: 50px; border-width: 4px;">
            <div class="pro-card-color card-title text-center mt-4">
              <h2>복용 경험 있는 자</h2>
            
              <hr>
            </div>
            <div class="card-body text-center mb-2">
  
              <p class="card-text">설문조사를 통해 당신에게 맞는 보조제를 찾아봅시다!</p>
              <p class="card-text">우리도 이제 다이어트 성공할 수 있습니다!</p>
            </div>
            <div class="card-desc text-center mb-2">
              <div>
                <p>솔직한 응답은 향후 권장사항을 구성하고 </p>
                식품 보충제의 효과성 향상에 기여할 것입니다.
              </div>
              <br>
              <img src="/html/img/person.png" alt="" height="150">
              <div class="text-center mt-4 mb-4">
                <input type="hidden" name="SURVEY_TYPE_ID" value="F-02">
                <sec:authorize access="isAuthenticated()">    
                
                <button type="submit"  formaction="/survey/yes" class="btn btn-outline-secondary " style="border-radius: 20px;" name="SURVEY_TYPE_ID" value="F-02"  >설문조사 하러가기</button>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <button type="button" class="btn btn-white btn-main" data-bs-toggle="modal" data-bs-target="#myModal2"> 설문조사하러가기</button>
                </sec:authorize>
              </div>
            </div>
          </div>
        </div>

        
      </div>
    </div>
  </form>
    <div class="text-center" style="color: red;">
      ※ 질병의 진단 및 치료는 전문 의료 기관을 이용해 주십시오.
    </div>
    <br>
  </div>

  <%@ include file="/WEB-INF/views/etc/Footer.jsp" %> <!-- footer --> 
</body>
</html>
