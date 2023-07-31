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

  <form action="">
  <div class="container">
    <br>
    <div class="container mx-auto" style="border-radius: 10px; width: 70%; padding: 20px; border: 1px solid #ececec;">
      <table class="tb tb_row" style="border: 1px solid #ececec; width: 100%;">
          <colgroup>
              <col style="width: 10%;" /><col style="width: 30%;" /><col style="width: 10%;" /><col style="width: 30%;" />
          </colgroup>
          <tbody>
              <tr style="border: 1px solid #ececec;">
                  <th scope="row" type="none" style="background-color: hsl(0, 0%, 93%); text-align: center;">작성자</th>
                  <td value='<%= record.get("USER_ID") %>' name="USER_ID"> <%= record.get("USER_ID") %></td>
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">등록일</th>
                  <td><%= record.get("COMMUNITY_DATE") %></td>
              </tr>
              <tr style="border: 1px solid #ececec;">
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">제목</th>
                  <td colspan="3"><input type="text" style="border: none;" size="100" maxlength="100" name = "COMMUNITY_TITLE"  value= '<%= record.get("COMMUNITY_TITLE") %>' ></td>
              </tr>
              <tr style="border: 1px solid #ececec;">
                  <th scope="row" style="background-color: #eeeeee; text-align: center;">내용</th>
                  <td colspan="3" style="height: 200px;" ><textarea style="border: none;" name="COMMUNITY_CONTENT" rows="8" cols="100" maxlength="200"><%= record.get("COMMUNITY_CONTENT") %></textarea>
                  </td>
              </tr>
          </tbody>
      </table>
      <br>
  
        

    </div>
    <div class="container" style="text-align: center; padding: 10%;">
      <button class="btn mx-2 mb-2 submit btn-outline-secondary" formaction='/mypage/communityupdateAndSelectSearch/<%= record.get("COMMUNITY_ID") %>'>수정하기</button>
       <a href="/mypage/community"> <button class="btn mx-2 mb-2 submit btn-outline-secondary" formaction="/mypage/community">목록보기</button></a>
    </div>
   
  </div>
  </form>
  <% } %>
</body>

</html>