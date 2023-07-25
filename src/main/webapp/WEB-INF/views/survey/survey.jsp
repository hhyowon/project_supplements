<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/maintool.css" type="text/css"/>
  <title>설문조사</title>
</head>
<body style="background-color:white" >
  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->
  <form action="">
  <div class="container" >
    <div class="text-center">
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
              <div class="text-center mt-4 mb-4">
                <input type="hidden" name="SURVEY_TYPE_ID" value="F-01">
                <button type="submit"  formaction="/survey/no" class="btn btn-main" name="SURVEY_TYPE_ID" value="F-01">로그인시</button>
                <button type="button" class="btn btn-white btn-main" data-bs-toggle="modal" data-bs-target="#myModal2"> 시작하기</button>
                <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                      <div class="modal-body">
                        <div>로그인이 필요합니다.</div>
                        로그인하시겠습니까?
                      </div>
                      <div class="modal-footer d-flex justify-content-center">
                        <a href="/survey" class="btn btn-secondary">닫기</a>
                        <a href="/login" class="btn btn-white btn-main">확인</a>
                      </div>
                    </div>
                  </div>
                </div>
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
              <div class="text-center mt-4 mb-4">
                <input type="hidden" name="SURVEY_TYPE_ID" value="F-02">
                <button type="submit"  formaction="/survey/yes" class="btn btn-main" name="SURVEY_TYPE_ID" value="F-02"  >로그인시</button>
                <button type="button" class="btn btn-white btn-main" data-bs-toggle="modal" data-bs-target="#myModal2"> 시작하기</button>
                <div class="modal fade" id="myModal2" tabindex="-1" aria-labelledby="myModalLabel2" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                      <div class="modal-body">
                        <div>로그인이 필요합니다.</div>
                        로그인하시겠습니까?
                      </div>
                      <div class="modal-footer d-flex justify-content-center">
                        <a href="/survey" class="btn btn-secondary">닫기</a>
                        <a href="/login" class="btn btn-white btn-main">확인</a>
                      </div>
                    </div>
                  </div>
                </div>
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
