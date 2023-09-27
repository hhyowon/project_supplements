<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">  
  <body>
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Bootstrap checkout</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
      <link rel="stylesheet" href="../toy_publishings/css/commons.css">
      <link rel="stylesheet" href="/css/maintool.css">
  </head>  
    <div class="container py-5">
        <div class="row justify-content-center">
          <div class="col-md-4">
            <div  style="border-radius: 8px; background-color: white; margin-top: 50px;">
              <img class="mb-4" src="/html/img/logo.PNG" alt width="240" height="100" style="display: block; margin-left: auto; margin-right: auto;">
              <% 
              String fail = request.getParameter("fail");
              %>
              
              <% if ("true".equals(fail)) { %>            
              <div><font color="red"> 아이디 or 비밀번호를 확인하세요</font></div>
              <% } %>
              <form class="form-signin" method="post" action="/loout" style="margin-top: 20px;">
                 <button type="submit" class="btn btn-main" >예</button>
                 <button type="submit" class="btn btn-main" form="" >아니요</button>
                  <button type="button" onclick="window.location.href='/signup'" class="btn btn-main">회원가입</button>
              </form>
            

            </div>
          </div>
        </div>
      </div>
  </body>
</html>