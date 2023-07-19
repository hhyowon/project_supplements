<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <title>커뮤니티 작성글</title>
</head>

<body>

  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>

  <div class="container ">
    <h2 class="ui teal image header text-center">
      커뮤니티
    </h2>
    <br>
    <div class="container mx-auto" style="padding: 20px; border-radius: 10px ; width: 50%;">
      <table class="table table-bordered">



        <tbody>

          <tr style="background-color: #5B9BD5; color: white;">
            <td class="text-left">
              <p class="small">번호: 1 ㅣ 카테고리: 질문 ㅣ 등록자: 효원 ㅣ 등록일: 2023.07.10.</p><hr>
              제목: 다이어트 보조제 부작용 중에 변비도 있나요?
            </td>
          </tr>

         

          <tr class="table-default">
            <td>
              <p class="small">
              다이어트 보조제 복용 후 변비가 생겼어요 ㅠㅠ
              이것도 부작용에 속하는 건가요?
              변비 너무 고통스럽네요
              해결책이 있을까요...? <br>
              도와주세요 ㅠㅠㅠ
              도와주세요 ㅠㅠㅠ
              도와주세요 ㅠㅠㅠ
              도와주세요 ㅠㅠㅠ
              도와주세요 ㅠㅠㅠ
            </p>
            </td>
          </tr>

        </tbody>
      </table>
      <form>
        <textarea name="comment" rows="3" cols="79" style="background-color: #e0e2e4;"  placeholder="해당 내용에 대해 답변해주세요"></textarea><br>
        <button class="btn mx-2  mb-2 float-end submit " style="background-color: #5B9BD5; color: white; border-color: transparent;">댓글달기</button>
    </form>
      <a href="community.html"> <button class="btn mx-2  mb-2 float-end submit btn-outline-secondary" >목록</button></a>
    </div>
  </div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>