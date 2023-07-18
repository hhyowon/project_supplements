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

    <div style="text-align: center;">
        <img class="mb-4" src="/html/img/logo.PNG" alt width="240" height="100"
            style="display: block; margin-left: auto; margin-right: auto;">
        <H1>다이어트 보조제 복용인을 대상으로 한 설문조사</H1>
    </div>
    <form method="get" action="">
        <div class="container mx-auto"
            style="border: 2px solid rgb(91, 155, 213); padding: 20px; border-radius: 10px; text-align: center; width: 50%;">
            <br>1. 복용하신 보조제는 무엇인가요? </br>
            <input type="radio" name="Q1" value="다이어트 젤리젤리"> 다이어트 젤리젤리
            <input type="radio" name="Q1" value="우리 사삼 다이어트"> 우리 사삼 다이어트
            <input type="radio" name="Q1" value="시서스 다이어트 슬림핏"> 시서스 다이어트 슬림핏
            <input type="radio" name="Q1" value="미러 다이어트"> 미러 다이어트
            <input type="radio" name="Q1" value="모던풀 다이어트"> 모던풀 다이어트 <br>
            <input type="radio" name="Q1" value="서흥 다이어트 유산균"> 서흥 다이어트 유산균
            <input type="radio" name="Q1" value="경성 다이어트"> 경성 다이어트
            <input type="radio" name="Q1" value="바로환 다이어트"> 바로환 다이어트
            <input type="radio" name="Q1" value="다이어트 츄잉"> 다이어트 츄잉 
            <input type="radio" name="Q1" value="혈당컷 녹차다이어트"> 혈당컷 녹차다이어트<br>

            <br>2. 보조제 복용한 시기는 언제인가요? </br>
            <input type="radio" name="Q2" value="Before meals"> 식전
            <input type="radio" name="Q2" value="After meals"> 식후
            <input type="radio" name="Q2" value="Throughout the day"> 수시로 </br>
            <br>3. 보조제 복용기간은 얼마나 되셨나요? </br>
            <input type="radio" name="Q3" value="Less than 6 months"> 6개월 이하
            <input type="radio" name="Q3" value="6 months to 1 year"> 6개월 ~ 1년 사이
            <input type="radio" name="Q3" value="1 year to 3 years"> 1년 ~ 3년 사이
            <input type="radio" name="Q3" value="More than 3 years"> 3년 이상 </br>
            <br>4. 보조제를 복용하신 원인은 무엇인가요? </br>
            <input type="radio" name="Q4" value=" weight loss"> 체중 감량을 위한 도움
            <input type="radio" name="Q4" value="self-care "> 자기 관리와 건강 관리
            <input type="radio" name="Q4" value=" rapid weight loss"> 신속한 체중 감량을 위함
            <input type="radio" name="Q4" value="Other reasons"> 기타 원인 </br>
            <br>5. 보조제를 복용시 운동을 병행 하셨나요?</br>
            <input type="radio" name="Q5" value="Yes"> 네
            <input type="radio" name="Q5" value="No"> 아니오 </br>
            <br>6. 광고에 나온 효과를 체험 하였습니까?</br>
            <input type="radio" name="Q6" value="Yes"> 네
            <input type="radio" name="Q6" value="No"> 아니오 </br>
            <br>7. 가장 크게 효과를 본 작용은 무엇인가요? </br>
            <input type="radio" name="Q7_1" value="Feeling of fullness"> 포만감
            <input type="radio" name="Q7_2" value="Increase in body temperature"> 체온상승
            <input type="radio" name="Q7_3" value="Increase in bowel movement"> 배변활동 증가
            <input type="radio" name="Q7_4" value="None of the above"> 해당사항 없음 </br>
            <br>8. 보조제를 복용 후 얼마나 체중 감량이 되셨나요?</br>
            <input type="radio" name="Q8" value="No effect"> 효과 없음
            <input type="radio" name="Q8" value="Less than 5kg"> 5kg 이하
            <input type="radio" name="Q8" value="Less than 10kg"> 10kg 이하
            <input type="radio" name="Q8" value="Less than 15kg"> 15kg 이하 </br>
            <br>9. 복용 후 부작용이 있으셨나요? </br>
            <input type="radio" name="Q9_1" value="Sleep disorders"> 수면장애
            <input type="radio" name="Q9_2" value="Binge eating "> 폭식
            <input type="radio" name="Q9_3" value="Decline in condition"> 컨디션 저하
            <input type="radio" name="Q9_4" value="Hallucination "> 환각
            <input type="radio" name="Q9_5" value="Constipation"> 변비
            <input type="radio" name="Q9_6" value="None of the above"> 해당사항 없음 </br>
        </div>
        <div class="container bg-white fs-6 py-6 row mx-auto my-3">
            <div class="text-center d-flex justify-content-center py-2">
                <button type="submit" formaction="/main" class="btn btn-white mx-2 btn-outline-dark" style="border-color: black; color: black;">닫기</button>
                <button type="submit" formaction="/survey/result_yes" class="btn btn-white btn-outline-dark" style="background-color: #5B9BD5; color: white; border-color: transparent;"data-bs-toggle="modal" data-bs-target="#myModal">설문제출</button>
            </div>
        </div>
        
    </form>
</body>

</html>