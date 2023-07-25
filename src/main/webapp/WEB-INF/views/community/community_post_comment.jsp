<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/maintool.css">
  <title>커뮤니티 작성글</title>
</head>

<body>

  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>

  <div class="container ">
  
    <br>
    <div class="container mx-auto" style="padding: 20px; border-radius: 10px ; width: 50%;">
      <table class="table table-bordered">
        <tbody>
          <tr style="background-color: #5B9BD5; color: white;">
            <td>글쓴이</td>
            <td>글 제목</td>
            <td>작성일자</td>
            <td>글 내용</td>
          </tr>          
        </tbody>
      </table>
      <form>
        <textarea name="comment" rows="3" cols="79" style="background-color: #e0e2e4;"  placeholder="해당 내용에 대해 답변해주세요"></textarea><br>
        <button class="btn mx-2  mb-2 float-end submit " style="background-color: #5B9BD5; color: white; border-color: transparent;">댓글달기</button>
    </form>
      <a href="/community"> <button class="btn mx-2  mb-2 float-end submit btn-outline-secondary" >목록</button></a>
    </div>
  </div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</html>