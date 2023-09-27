<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.example.project_supplements.utils.Commons" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- header -->
<body>
 <main>
  <div class="row g-0 vh-100">
    <%@ include file= "/WEB-INF/views/etc/Sidebar.jsp" %><!-- 마이페이지 sidebar -->
    <div class="col-9">
    <h3 class="text-center">
      개인정보 수정
    </h3>
    <% 
    HashMap params=(HashMap)request.getAttribute("params"); 
    String searchStr=(String)params.getOrDefault("search", ""); 
    HashMap result=(HashMap)request.getAttribute("result"); %>

    <% ArrayList resultList=(ArrayList)result.get("resultList");
      Commons commons = new Commons(); 
      String targetUserId = commons.getUserID(); 
    if (resultList != null && !resultList.isEmpty()) {
      for (int i = 0; i < resultList.size(); i++) {
        HashMap record = (HashMap) resultList.get(i);
        String userId = (String) record.get("USER_ID");
        // USER_ID가 targetUserId와 일치하는 경우에만 데이터 출력
        if (userId.equals(targetUserId)) {
        %>

    <div class="container col-9 pb-5 px-5" style="width: 700px;">
<form method="get"> <!-- 폼-->
      <!-- <form action="/mypage/main">  폼-->
        <div class="px-5">
          <div class="py-2">
            <lable class="form-label" for="idusername">이름</lable>
            <input class="form-control" type="text" placeholder="name" name="NAME" value='<%= record.get("NAME")%>' id="name" style="width: 500px;" >
          </div>

          <div class="py-2">
            <div>
              <div class="py-2"><!--아이디 작성-->
                <label class="form-label" for="idid">아이디 </label>
                <input class="form-control" type="id" name="USER_ID" id="userid" value='<%= record.get("USER_ID")%>' style="width: 500px;" readonly>
              </div>

              <div class="py-2"><!--비밀번호 작성-->
                <label class="form-label" for="idpw">비밀번호 </label>
                <input class="form-control" type="password" name="PASSWORD" value ='<%= record.get("PASSWORD")%>' id="pw" placeholder="123456" style="width: 500px;" readonly>
              </div>

              <div class="py-2"><!--연락처-->
                <label class="form-label" for="idphonenumber">연락처</label>
                <input class="form-control" type="text" name="PHONENUMBER" value ='<%= record.get("PHONENUMBER")%>' placeholder="010-****-****"
                  id="idphonenumber" style="width: 500px;">
              </div>

              <div class="py-2"><!--Address-->
                <label class="form-label" for="idaddress">주소</label>
                <input class="form-control" type="text" name="ADDRESS" value ='<%= record.get("ADDRESS")%>' placeholder="우리집비밀" id="idaddress"
                  style="width: 500px;">
              </div>

              <div class="py-2"><!--이메일 작성-->
                <label class="form-label" for="idemail">Email </label>
                <input class="form-control" type="email" name="EMAIL" value ='<%= record.get("EMAIL")%>' id="email" placeholder="otter@yojulab.com" style="width: 500px;">
              </div>
            </div>
            <% break; // userId 같지 않으면 중지
            }}  } %>
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
              <button type="submit" class="btn btn-main" id="submitBtn" formaction="/mypage/updateAndSelectSearch" method="get">수정완료</button>
              <button type="submit" class="btn btn-main" id="submitBtn" formaction="/mypage/dormant" method="get" onclick="return confirm('정말로 탈퇴하시겠습니까?')">탈퇴하기</button>
            </div>
</main> 
            
    </div>
  </form>
  
<%@ include file="/WEB-INF/views/etc/Footer.jsp" %> <!-- footer --> 
</body>

</html>