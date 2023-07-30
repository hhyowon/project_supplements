<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../toy_publishings/css/commons.css">
    <link rel="stylesheet" href="/css/maintool.css">
</head>  
<body>
  
  <!-- Menu -->
      <div class="container">
        <div class="container text-center">
          <h1 > 보조제 추가하기
            <hr class='hr-solid' />
          </h1>
        </div>
      </div>
    </br>

  <form id="insertForm" method="post" action="/signup/insert" > <!-- 폼-->
    <div class="container pb-5 px-5" style="width: 700px;">
      <div class="px-5">

        <div class="py-2">
          <lable class="form-label" for="name">제품명</lable>
          <input class="form-control" type="text" placeholder="이름" name="NAME" id="name" style="width: 500px;">
        </div>


        <div class="py-2"><!--제형 작성-->
          <label class="form-label" for="pw">제형 </label>
          <input class="form-control" type="password" name="PASSWORD" id="pw" placeholder="123456"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--효과-->
          <label class="form-label" for="phnum">효과</label>
          <input class="form-control" type="text" name="PHONENUMBER" value="" placeholder="010-****-****" id="phnum"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--URL-->
          <label class="form-label" for="address">상세보기링크</label>
          <input class="form-control" type="text" name="ADDRESS" value="" placeholder="우리집비밀" id="address"
            style="width: 500px;">
        </div>

        <div class="py-2"><!--이미지-->
          <label class="form-label" for="email">이미지</label>
          <input class="form-control" type="email" name="EMAIL" id="email" placeholder="otter@yojulab.com"
            style="width: 500px;">
        </div>
      </div>
      </div>
            <button class="btn btn-main float-end" type="submit" >추가하기</button>
     </div>
  </form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>