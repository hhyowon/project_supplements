<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/maintool.css">
    <title>커뮤니티</title>
</head>
<body>
  <%@ include file="Header.jsp" %> <!--해더-->
 
<div class="ui middle aligned center aligned grid container mx-auto">
  
        <h2 class="ui teal image header text-center">
            커뮤니티  <hr class='hr-solid'/>
        </h2>
        <br>
      
       
        <div class="ui large form">
            <div class="ui stacked segment">
                <a data-bs-toggle="modal" href="#modalTarget-center"><button class="btn mx-2  mb-2 float-end submit" style="background-color: #5B9BD5; color: white; border-color: transparent;">작성하기</button></a>
                <!-- 모달 창 -->
                <div class="modal" id="modalTarget-center">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header" > 
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="카테고리" id="Q&A">
                                    <label class="form-check-label" for="Q&A">
                                      질문
                                    </label>
                                  </div>
                                  
                                  <div class="form-check">
                                    <input class="form-check-input" type="radio" name="카테고리" id="review">
                                    <label class="form-check-label" for="review">
                                      후기
                                    </label>
                                  </div>
                                  
                                  <div class="form-check">
                                    <input class="form-check-input" type="radio" name="카테고리" id="recommend">
                                    <label class="form-check-label" for="recommend">
                                      추천
                                    </label>
                                  </div>

                            </div>
                            <div class="modal-body form-group " style="background-color: #c0daf5">
                
                                제목 : <input type="text" class="form-control" style="width: 100%;" > </br>
                               
                                내용 :  <textarea class="form-control" rows="15"></textarea></div>
                             
                            <div class="modal-footer">
                                <button class="btn btn-white btn-outline-dark" style="background-color: #5B9BD5; color: white; border-color: transparent;" data-bs-dismiss="modal">입력</button>
                            </div>
                        </div>
                    </div>
                </div>
                </br>
                <table class="ui celled table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>등록자</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody id="list">
                        <tr>
                         
                            <td>1</td>
                            <td>질문</td>
                            <td><a href="src/main/webapp/WEB-INF/views/community_post_commend.jsp">다이어트 보조제 부작용 중에 변비도 있나요?</a></td>
                            <td>효원</td>
                            <td>2023.07.10.</td>
                            
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>질문</td>
                            <td>다이어트 성공 가능할까요..?</td>
                            <td>효원</td>
                            <td>2023.07.10.</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>질문</td>
                            <td>워터밤에 가려고 하는데 효과 직빵인 다이어트 보조제 있나요:?</td>
                            <td>효원</td>
                            <td>2023.07.10.</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="ui error message"></div>

        </div>
        
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="" aria-label="Previous"><span aria-hidden="true"><</span></a>
          </li>
        <li class="page-item">
          <a class="page-link" href="">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="" aria-label="Next"><span aria-hidden="true">></span></a>
        </li>
      </ul>

    </div>
</div>

<div class="ui modal" id='view_modal'>
    <i class="close">x</i>
    <div class="header" id="b_title">
        
    </div>
    <div class="content">
        <div class="description">
            <p style = "text-align: right" id = "b_review"></p>
            <div id = 'b_content'></div>
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            닫기
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>