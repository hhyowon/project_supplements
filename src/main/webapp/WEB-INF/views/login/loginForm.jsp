<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">  
  <body>
  
    <div class="container py-5">
        <div class="row justify-content-center">
          <div class="col-md-4">
            <div  style="border-radius: 8px; background-color: white; margin-top: 50px;">
              <img class="mb-4" src="/html/img/logo.PNG" alt width="240" height="100" style="display: block; margin-left: auto; margin-right: auto;">
              <% 
              String fail = request.getParameter("fail");
              %>
              
              <% if ("true".equals(fail)) { %>            
              <div><font color="red"> 아이디 OR 비밀번호 확인하지? </font></div>
              <% } %>
              <form class="form-signin" method="post" action="/login" style="margin-top: 20px;">
                <div class="form-group" style="margin-bottom: 15px;">
                  <input class="form-control" type="text" name="username" placeholder="아이디를 입력하세요" id="idid">
                </div>
                <div class="form-group" style="margin-bottom: 15px;">
                  <input class="form-control" type="password" name="password" placeholder="비밀번호를 입력하세요" id="idpassword">
                </div>
                <div class="form-check" style="margin-bottom: 15px;">
                  <input type="checkbox" class="form-check-input" id="remember">
                  <label class="form-check-label" for="remember">아이디 기억하기</label>
                </div>
                <div class="text-center" style="margin-top: 20px;">
                  <button type="submit" class="btn btn-main" >로그인</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
  </body>
</html>