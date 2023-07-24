<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <%@ include file="/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->
            <% HashMap result=(HashMap)request.getAttribute("result"); %>


           


                    <div class="container">
                        <h2 class="ui teal image header text-center">
                            랭킹
                            <hr class='hr-solid' />
                        </h2>
                        <br>
                        <div>
                            <h3 style="font-weight: bold;">TOP 3</h3>
                        </div>
                        </br>
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr class="text-center">
                                    <td style="color:#c0daf5; vertical-align: middle;">
                                        <h3 style="font-weight: bold;text-align: center;">01. 가성비 갑!</h3>
                                    </td>
                                    <td rowspan='3' style="background-color: #dbedff;">
                                        <div class="row">
                                            <div class="col-4"> <img src= <%= result.get("SURVEY_OPT_URL") %> alt width="250" 
                                                    height="300"></div>
                                            <div class="col-4"> <img src=/html/img/supplement2.jpg alt width="250"
                                                    height="300"></div>
                                            <div class="col-4"> <img src=/html/img/supplement3.png alt width="250"
                                                    height="300"></div>
                                        </div>
                                    </td>

                                </tr>
                                <tr class="text-center" style="background-color: #c0daf5; vertical-align: middle;">
                                    <td class="text-center">
                                        <h3 style="font-weight: bold; color:white; text-align: center;">02. 체지방 감소</h3>
                                    </td>

                                </tr>
                                <tr class="table-default text-center" style="vertical-align: middle;">
                                    <td style="color:#c0daf5;">
                                        <h3 style="font-weight: bold;">03. 알약형</h3>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <h6 class="text-center"> 본 랭킹은 구매자들의 실제 후기 및 설문조사로 이루어진 랭킹임을 알려드립니다.</h6>
                    </div>


    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </html>