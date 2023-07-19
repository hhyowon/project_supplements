<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="/css/maintool.css"> 
      <title>Document</title>
  </head>

  <body>
    <%@ include file= "/WEB-INF/views/etc/Header.jsp" %> <!-- Menu -->

      <div class="container">
        <h2 class="ui teal image header text-center">
          다이어트 보조제 검색
        </h2>
        <br>
        <br>
        <div class="container">
          <form action="">
            <div class="d-flex justify-content-center align-items-center input-group mb-3">
              <div class="d-flex align-items-center">
                <div class="input-group">
                  <select class="form-select" name="keyField" id="" style="width: 150px;">
                    <option>카테고리</option>
                    <option value="name">상품명</option>
                    <option value="ingredient">성분</option>
                    <option value="form">제형</option>
                  </select>
                  <input type="text" placeholder="원하는 제품 및 업소명 검색하기" class="form-control" style="width: 500px;" />
                  <button class="btn btn-main" type="submit" formaction="" formmethod="get">검색</button>
                </div>
              </div>
            </div>
          </form>

        </div>

      </div>
      <br>
      <div class="container text-center">
        <table class="table table-bordered table-hover" style="vertical-align: middle;">
          <thead>
            <tr style="background: #8cc1f3;">
              <th style="width: 500px; ">상품 이미지</th>
              <th>상품명</th>
              <th>업소명</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <div class="row justify-content-center">
                  <div class="col-5 text-center">
                    <img src="/html/img/바이탈슬림 다이어트 올인원 유산균.png" alt="바이탈슬림 다이어트 올인원 유산균">
                  </div>
                </div>
              </td>
              <td class="text-center" style=" vertical-align: middle;">
                <a
                  href="https://www.foodsafetykorea.go.kr:443/portal/healthyfoodlife/searchHomeHFDetail.do?prdlstReportLedgNo=2023021000297623">바이탈슬림
                  다이어트 올인원
                  유산균</a>
              </td>
              <td class="text-center" style="vertical-align: middle;">
                (주)알피바이오
              </td>
            </tr>
            <tr>
              <td>
                <div class="row justify-content-center">
                  <div class="col-5 text-center" style=" vertical-align: middle;">
                    <img src="/html/img/원데이 마이너스 원다이어트.png" alt="원데이 마이너스 원다이어트">
                  </div>
                </div>
              </td>
              <td class="text-center" style="vertical-align: middle;">
                <a
                  href="https://www.foodsafetykorea.go.kr:443/portal/healthyfoodlife/searchHomeHFDetail.do?prdlstReportLedgNo=2023021000286180">원데이
                  마이너스 원다이어트</a>
              </td>
              <td class="text-center" style="vertical-align: middle;">
                (주)빈스힐
              </td>
            </tr>
            <tr>
              <td>
                <div class="row justify-content-center">
                  <div class="col-10 text-center" style=" vertical-align: middle;">
                    <img src="/html/img/시서스 다이어트 슬림핏.jpg" alt="	시서스 다이어트 슬림핏">
                  </div>
                </div>
              </td>
              <td class="text-center" style="vertical-align: middle;">
                <a
                  href="https://www.foodsafetykorea.go.kr/portal/healthyfoodlife/searchHomeHFDetail.do?prdlstReportLedgNo=2023021000283605">
                  시서스 다이어트 슬림핏</a>
              </td>
              <td class="text-center" style="vertical-align: middle;">
                코스맥스바이오(주)
              </td>
            </tr>
          </tbody>
        </table>
      </div>


  </body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

  </html>