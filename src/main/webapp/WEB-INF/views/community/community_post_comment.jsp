<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.example.project_supplements.utils.Paginations"%>
<!DOCTYPE html>
<html lang="en">
<body>

  <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>

  <% 
  HashMap params=(HashMap)request.getAttribute("params"); 
  String searchStr=(String)params.getOrDefault("search", ""); 
  HashMap result=(HashMap)request.getAttribute("result"); 
  %>

  <% ArrayList resultList=(ArrayList)result.get("resultList"); 
                    for(int i=0; i < resultList.size(); i=i+1){
                        HashMap record=(HashMap)resultList.get(i); %>

  <div class="container">
    <br>
    <div class="container mx-auto" style="border-radius: 10px; width: 70%; padding: 20px; border: 1px solid #ececec;">
      <table class="tb tb_row" style="border: 1px solid #ececec; width: 100%;">
          <colgroup>
              <col style="width: 10%;" /><col style="width: 30%;" /><col style="width: 10%;" /><col style="width: 30%;" />
          </colgroup>
          <tbody>
              <tr style="border: 1px solid #ececec;">
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">작성자</th>
                  <td><%= record.get("USER_ID") %></td>
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">등록일</th>
                  <td><%= record.get("COMMUNITY_DATE") %></td>
              </tr>
              <tr style="border: 1px solid #ececec;">
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">제목</th>
                  <td colspan="3"><%= record.get("COMMUNITY_TITLE") %></td>
              </tr>
              <tr style="border: 1px solid #ececec;">
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">내용</th>
                  <td colspan="3" style="height: 200px;"><%= record.get("COMMUNITY_CONTENT") %></td>
              </tr>
          </tbody>
      </table>
      <br>
      

        <form method="post" action="/community/comment/<%= record.get("COMMUNITY_ID") %>" style="display: inline-flex;">
          <textarea name="COMMENT" rows="3" cols="100" style="border: 1px solid #dddddd; flex: 1;" placeholder="소통을 위한 댓글창입니다"></textarea>
          <button type="submit" class="btn mx-2 mb-2 float-end submit btn-outline-secondary">작성하기</button>
        </form>
        <% } %>
    
    </div>
    <div class="container" style="text-align: center; padding: 10%;">
       <a href="/community"> <button class="btn mx-2 mb-2 submit btn-outline-secondary">목록보기</button></a>
    </div>
   
  </div>

</body>

</html>