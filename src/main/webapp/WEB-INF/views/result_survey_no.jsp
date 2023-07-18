<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/maintool.css">
    <title>복용한자의 폼</title>
</head>
    
    <body>
      <%@ include file="Header.jsp" %> <!-- Menu -->
     
          <div class="container">
                <div class=text-center><h2 style="color: #5B9BD5;">설문조사 결과</h2></div>
                <br>
            <table class="table table-bordered ">
                <thead>
                    <tr>
                        <th> <h5 style="color: #5B9BD5;">질문</h5></th>
                        <th><h5 style="color: #5B9BD5;">응답</h5></th>
                    </tr>
                </thead>
                <tbody> 
                    <tr>
                        <td>1. 어떤 이유로 다이어트를 결심하게 되었나요?</td>
                         <td>1) 개인목표: 명 <br>
                             2) 건강: 명 <br>
                             3) 미용: 명 <br>
                             4) 정신건강: 명<br>
                             5) 주변권유: 명</td>
                          
                    </tr>
                    <tr> 
                        <td>2. 관심있는 다이어트 보조제 종류가 무엇인가요?</td>
                        <td>1) 캡술: 명 <br>
                            2) 소프트젤: 명 <br>
                            3) 분말: 명 <br>
                            4) 젤리: 명 <br>
                            5) 정제: 명 
                          </td>
                        
                    </tr>
                    <tr>
                        <td>3. 다이어트 보조제에 대해 얼마나 잘 알고 있습니까?</td>
                        <td>1) 잘 모른다: 명 <br>
                            2) 모른다: 명 <br>
                            3) 조금 안다: 명 <br>
                            4) 잘안다: 명 </td>
                    </tr>
                    <tr>
                        <td> 4. 다이어트 보조제를 고려하는 주요 목표 또는 이유? </td>
                        <td>1) 신진대사 개선: 명 <br>
                            2) 식욕 억제: 명 <br>
                            3) 영양지원: 명 <br>
                            4) 기타: 명 
                        </td>
                    </tr>
                  
                    <tr>
                        <td>5. 다이어트 보조제를 선택할때 고려하는 요소는 무엇인가요?</td>
                        <td>1) 가격: 명  <br>
                            2) 보조제 제형: 명  <br>
                            3) 사용자 리뷰/증언: 명  <br>
                            4) 성분: 명 <br>
                            5) 맛: 명 
                        </td>
                    </tr>
                    
                
                </tbody>
            </table>
        </div>
        </div>
    
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>

