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
                        <td>1. 복용하신 보조제는 무엇인가요?</td>
                         <td>1) L-카르니틴: 명 <br>
                             2) 녹차 추출물: 명 <br>
                             3) 가르시니아 캄보지아 : 명 <br>
                             4) 라즈베리 케톤 : 명<br>
                             5) 곡물추출 유지산 (CLA) : 명</td>
                    </tr>
                    <tr> 
                        <td>2. 보조제 복용한 시기는 언제인가요?</td>
                        <td>1) 식전: 명 <br>
                        2) 식후: 명 <br>
                        3) 수시로: 명 </td>
                        
                    </tr>
                    <tr>
                        <td>3. 보조제 복용기간은 얼마나 되셨나요?</td>
                        <td>1) 6개월 이하: 명 <br>
                        2) 6개월 ~ 1년 사이: 명 <br>
                        3) 1년 ~ 3년 사이: 명 <br>
                        4) 3년 이상: 명 </td>
                    </tr>
                    <tr>
                        <td>4. 보조제를 복용하신 원인은 무엇인가요?</td>
                        <td>1) 체중 감량을 위한 도움: 명 <br>
                            2) 자기 관리와 건강 관리: 명 <br>
                            3) 신속한 체중 감량을 위함: 명 <br>
                            4) 기타 원인: 명 
                        </td>
                    </tr>
                    <tr>
                        <td>5. 보조제를 복용시 운동을 병행 하셨나요?</td>
                        <td>1) 네: 명 <br>
                        2) 아니오: 명 </td>
                    </tr>
                    <tr>
                        <td>6. 광고에 나온 효과를 체험 하였습니까?</td>
                        <td>1) 네: 명 <br>
                            2) 아니오: 명 </td>
                    </tr>
                    <tr>
                        <td>7. 가장 크게 효과를 본 작용은 무엇인가요?</td>
                        <td>1) 포만감: 명  <br>
                            2) 체온상승: 명  <br>
                            3) 배변활동 증가: 명  <br>
                            4) 해당사항 없음: 명 
                        </td>
                    </tr>
                    <tr>
                        <td>8. 보조제를 복용 후 얼마나 체중 감량이 되셨나요?</td>
                        <td>1) 효과 없음: 명 <br>
                            2) 5kg 이하: 명 <br>
                            3) 10kg 이하: 명 <br>
                            4) 15kg 이하: 명 
                        </td>
                    </tr>
                    <tr>
                        <td>9. 복용 후 부작용이 있으셨나요?</td>
                        <td>1) 수면장애: 명 <br>
                            2) 폭식: 명 <br>
                            3) 컨디션 저하: 명 <br>
                            4) 환각: 명 <br>
                            5) 변비: 명 <br>
                            6) 해당사항 없음: 명 <br>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>

