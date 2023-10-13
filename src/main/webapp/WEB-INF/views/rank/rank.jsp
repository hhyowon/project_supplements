<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <link rel="stylesheet" href="/css/maintool.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/etc/Header.jsp" %>

    <% 
        HashMap firstparams = (HashMap) request.getAttribute("firstparams");
        HashMap firstresult = (HashMap) request.getAttribute("firstresult");
        HashMap secondparams = (HashMap) request.getAttribute("secondparams");
        HashMap secondresult = (HashMap) request.getAttribute("secondresult");
        HashMap thirdparams = (HashMap) request.getAttribute("thirdparams");
        HashMap thirdresult = (HashMap) request.getAttribute("thirdresult");
    %>

    <div class="container mt-5">
        <h2 class="ui teal image header text-center" style="font-size: 100px; color: #707070;
        font-family: 'Paytone One', sans-serif; text-shadow: -.030em .030em #EEEEEE, -.06em .06em #707070;">
            BEST 3
        </h2>

        <br>
        <br>

        <!-- Start of common header structure -->
        <div class="row text-center mb-3">
            <div class="col d-flex justify-content-center align-items-center" style="background-color: #f5f5f5; height: 100px;">
                <h3 style="font-weight: bold; color:#707070;">01. 식욕억제</h3>
            </div>
            <div class="col d-flex justify-content-center align-items-center" style="background-color: #f5f5f5; height: 100px;">
                <h3 style="font-weight: bold; color:#707070;">02. 체중감량</h3>
            </div>
            <div class="col d-flex justify-content-center align-items-center" style="background-color: #f5f5f5; height: 100px;">
                <h3 style="font-weight: bold; color:#707070;">03. 배변활동</h3>
            </div>
        </div>
        <!-- End of common header structure -->

        <!-- Start of first table -->
        <div class="container">
        <div class="row">
            <div class="col-4">

                <% ArrayList firstresultList=(ArrayList)firstresult.get("firstresultList");
                for (int i=0; i < firstresultList.size(); i++) { HashMap
                firstrecord=(HashMap) firstresultList.get(i); String
                surveyUrlFirst=(String) firstrecord.get("SURVEY_RANK_FIRST"); String
                productUrlFirst=(String) firstrecord.get("SURVEY_OPT_WEB_URL"); %>

                <div class="col-4">
                    <a href="<%= productUrlFirst %>" target="_blank">
                        <img src="<%= surveyUrlFirst %>" alt="1st Product" width="350" height="300" class="d-block mx-auto" style="margin-top: 20px; margin-bottom: 20px;">
                    </a>
                </div>
                
                <% } %>
            </div>
            <div class="col-4">
                <!-- secondresult content goes here -->

                <% ArrayList secondresultList=(ArrayList)
                secondresult.get("secondresultList"); for (int i=0; i <
                secondresultList.size(); i++) { HashMap secondrecord=(HashMap)
                secondresultList.get(i); String surveyUrlSecond=(String)
                secondrecord.get("SURVEY_RANK_SECOND"); String productUrlSecond=(String)
                secondrecord.get("SURVEY_OPT_WEB_URL"); %>
                <!-- 제품 이미지와 링크 표시 -->
                <div class="col-4">
                    <a href="<%= productUrlSecond %>" target="_blank">
                        <img src="<%= surveyUrlSecond %>" alt="2nd Product" width="350" height="300" class="d-block mx-auto" style="margin-top: 20px; margin-bottom: 20px;">
                    </a>
                </div>
                <% } %>
            </div>
            <div class="col-4">
                <!-- thirdresult content goes here -->
                <% ArrayList thirdresultList=(ArrayList) thirdresult.get("thirdresultList");
                for (int i=0; i < thirdresultList.size(); i++) { HashMap
                thirdrecord=(HashMap) thirdresultList.get(i); String
                surveyUrlThird=(String) thirdrecord.get("SURVEY_RANK_THIRD"); String
                productUrlThird=(String) thirdrecord.get("SURVEY_OPT_WEB_URL"); %>
                <div class="col-4">
                    <a href="<%= productUrlThird %>" target="_blank">
                        <img src="<%= surveyUrlThird %>" alt="3rd Product" width="350" height="300" class="d-block mx-auto" style="margin-top: 20px; margin-bottom: 20px;">
                    </a>
                </div>
                <% } %>
            </div>
        </div>
    </div>
        <!-- End of first table -->

        <br>
        <h6 class="text-center">
            <div>📌본 랭킹은 구매자들의 실제 후기 및 설문조사로 이루어진 랭킹입니다. </div>
            <div>각 개인의 성향에 따라 효과가 다를 수 있으니, </div>
            자신에게 가장 적합한 제품을 선택하는 데 유의하시기 바랍니다.
        </h6>
        <br>
        <br>
    </div>

    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>
</body>

</html>
