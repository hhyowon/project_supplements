<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">
            <style>
                .loading span {
                  display: inline-block;
                  margin: 0 -.05em;
                  animation: loading .7s infinite;
                }
                .loading span:nth-child(2) {
                  animation-delay: .1s;
                }
                .loading span:nth-child(3) {
                  animation-delay: .2s;
                }
                .loading span:nth-child(4) {
                  animation-delay: .3s;
                }
                .loading span:nth-child(5) {
                  animation-delay: .4s;
                }
                .loading span:nth-child(6) {
                  animation-delay: .5s;
                }
                .loading span:nth-child(7) {
                  animation-delay: .6s;
                }
                .loading span:nth-child(8) {
                  animation-delay: .6s;
                }
                .loading span:nth-child(9) {
                  animation-delay: .6s;
                }
                @keyframes loading {
                  0%, 100% {
                    transform: translateY(0);
                  }
                  50% {
                    transform: translateY(15px);
                  }
                }
                .satellites {
                    border: 4px solid none;
                    animation: rotate-axis 15s linear infinite;
                    transform-style: preserve-3d;
                    display: flex;
                    justify-content: center;
                }
                
                @keyframes rotate-axis {
                    from {
                        transform:  perspective(800px) rotateY(0deg);
                    }
                    to {
                        transform:  perspective(800px) rotateY(360deg);
                    }
                }
                
                .satellite {
                    position: absolute;
                    width: 100px;
                    transform: rotateY(calc(var(--i) * 1deg)) translateZ(300px);
}
                    </style>
                
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
                <% HashMap firstparams=(HashMap)request.getAttribute("firstparams"); 
                HashMap firstresult=(HashMap)request.getAttribute("firstresult"); 
                HashMap secondparams=(HashMap)request.getAttribute("secondparams"); 
                HashMap secondresult=(HashMap)request.getAttribute("secondresult"); 
                HashMap thirdparams=(HashMap)request.getAttribute("thirdparams"); 
                HashMap thirdresult=(HashMap)request.getAttribute("thirdresult");  %>
    
                
                    <div class="container">
                        <div class="satellites">
                            <img class="satellite" style="--i: 0" src="/html/img/supplement1.png">
                            <img class="satellite" style="--i: 30" src="/images/하루야채 킬팻 다이어트.jpg">
                            <img class="satellite" style="--i: 60" src="/html/img/supplement3.png">
                            <img class="satellite" style="--i: 90" src="/html/img/바이탈슬림 다이어트 올인원 유산균.png">
                            <img class="satellite" style="--i: 120" src="/images/다이어트츄잉.jpg">
                            <img class="satellite" style="--i: 150" src="/images/경성 다이어트.jpg">
                            <img class="satellite" style="--i: 180" src="/images/벨라미 다이어트 젤리(청포도맛).jpg">
                            <img class="satellite" style="--i: 210" src="/images/S 슬림 미인 다이어트 젤리(전량수출).jpg">
                            <img class="satellite" style="--i: 240" src="/images/버블리 파인 다이어트.jpg">
                            <img class="satellite" style="--i: 270" src="/images/벨기에 유산균+다이어트 트리플러스.jpg">
                            <img class="satellite" style="--i: 300" src="/images/뷰티몬스터 칼로컷 다이어트.jpg">
                            <img class="satellite" style="--i: 330" src="/images/혈당컷 다이어트.jpg">
                        </div>

                        <h2 class="ui teal image header text-center" style="margin-top: 300px;">
                            효능별 BEST 3
                            <hr class='hr-solid' />
                        </h2>
                      
    
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                   
                                        <div class="row">
                                            <div class="col-3">

                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff; text-align: center;">
                                                    1위</h3>
                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff ; text-align: center;">
                                                    2위</h3>
                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff; text-align: center;">
                                                    3위</h3>
                                            </div>
                                        </div>
                                 
                                    </tr>
                                <tr class="table-default text-center"
                                    style="background-color: #dbedff; vertical-align: middle;">
                                    <td class="text-center">
                                        <h3 style="font-weight: bold; color:white; text-align: center;">
                                            01. 식욕억제</h3>
                                    </td>

                                    <td rowspan='3' style="background-color: #dbedff;">
                                        <div class="row">

                                            <% ArrayList firstresultList=(ArrayList)firstresult.get("firstresultList");
                                                for (int i=0; i < firstresultList.size(); i++) { HashMap
                                                firstrecord=(HashMap) firstresultList.get(i); String
                                                surveyUrlFirst=(String) firstrecord.get("SURVEY_RANK_FIRST"); %>
                                                <div class="col-4">
                                                        <img src="<%= surveyUrlFirst %>" alt width="250" height="300">

                                                </div>
                                                <% } %>

                                        </div>
                                    </td>
                            </tbody>
                        </table>

                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                   
                                        <div class="row">
                                            <div class="col-3">

                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff; text-align: center;">
                                                    1위</h3>
                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff ; text-align: center;">
                                                    2위</h3>
                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff; text-align: center;">
                                                    3위</h3>
                                            </div>
                                        </div>
                                 
                                    </tr>
                                <tr class="table-default text-center"
                                    style="background-color: #dbedff; vertical-align: middle;">
                                    <td class="text-center">
                                        <h3 style="font-weight: bold; color:white; text-align: center;">
                                            02. 체중감량</h3>
                                    </td>

                                    <td rowspan='3' style="background-color: #dbedff;">
                                        <div class="row">

                                            <% ArrayList secondresultList=(ArrayList)secondresult.get("secondresultList");
                                                for (int i=0; i < secondresultList.size(); i++) 
                                                {HashMap secondrecord = (HashMap) secondresultList.get(i); 
                                                 String surveyUrlSecond = (String) secondrecord.get("SURVEY_RANK_SECOND"); %>
                                                <div class="col-4">
                                                    <img src="<%= surveyUrlSecond %>" alt width="250" height="300">
                                                </div>
                                                <% } %>

                                        </div>
                                    </td>
                            </tbody>
                        </table>

                        
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                   
                                        <div class="row">
                                            <div class="col-3">

                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff; text-align: center;">
                                                    1위</h3>
                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff ; text-align: center;">
                                                    2위</h3>
                                            </div>
                                            <div class="col-3">
                                                <h3 style="font-weight: bold; color:#dbedff; text-align: center;">
                                                    3위</h3>
                                            </div>
                                        </div>
                                 
                                    </tr>
                                <tr class="table-default text-center"
                                    style="background-color: #dbedff; vertical-align: middle;">
                                    <td class="text-center">
                                        <h3 style="font-weight: bold; color:white; text-align: center;">
                                            03. 배변활동</h3>
                                    </td>

                                    <td rowspan='3' style="background-color: #dbedff;">
                                        <div class="row">

                                            <% ArrayList thirdresultList=(ArrayList)thirdresult.get("thirdresultList");
                                                for (int i=0; i < thirdresultList.size(); i++) 
                                                {HashMap thirdrecord = (HashMap) thirdresultList.get(i); 
                                                 String surveyUrlThird = (String) thirdrecord.get("SURVEY_RANK_THIRD"); %>
                                                <div class="col-4">
                                                    <img src="<%= surveyUrlThird %>" alt width="250" height="300">
                                                </div>
                                                <% } %>

                                        </div>
                                    </td>
                            </tbody>
                        </table>


                        <br>
                        <h6 class="text-center">
                        <div>📌본 랭킹은 구매자들의 실제 후기 및 설문조사로 이루어진 랭킹입니다. </div>
                        <div>이 랭킹은 정확하고 신뢰성 있는 설문조사 데이터를 기반으로 구성되었습니다. </div>
                        <div>하지만 각 개인의 상황에 따라 결과가 달라질 수 있으니, </div>
                            자신에게 가장 적합한 제품을 선택하는 데 주의하시기 바랍니다.</h6>
                            <br>
                            <br>
                    </div>
                    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>

        </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        </html>