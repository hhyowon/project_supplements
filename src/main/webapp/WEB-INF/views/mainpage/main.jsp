<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        @keyframes loading {
          0%, 100% {
            transform: translateY(0);
          }
          50% {
            transform: translateY(15px);
          }
        }
</style>
<%@ include file= "/WEB-INF/views/etc/Header.jsp" %>
<body>
    <!-- Menu -->
        <div style="position: relative;">
            <img class="w-100" src="/html/img/다.PNG" alt="" height="700">
            <div style="position: absolute; top: 55%; left: 25%; transform: translate(-50%, -50%);">
                <div class="loading" style="font-size: 40px; font-weight: bold;">
                    <span>C</span>
                    <span>L</span>
                    <span>I</span>
                    <span>C</span>
                    <span>K</span>
                    <span>!</span>
                  </div>
                <br>
                <p style="font-size: 26px; font-weight: bold; color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); white-space: nowrap;">
                    다이어트를 원하는 당신</p>
                <p style="font-size: 26px; font-weight: bold; color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); white-space: nowrap;">
                    설문조사를 통해 알맞은 보조제를 찾아보세요!</p>
                <br><br>
            </div>

            <!-- <div style="position: absolute; top: 60%; left: 10%;" >
                <img class="w-100" src="/html/img/downarrow.PNG"  height="30" width="40"> 
            </div> -->

            <a href="/survey">
                <button class="btn-round btn-marquee" style="position: absolute; top: 70%; left: 19%; transform: translate(-50%, -50%); background-color: #5B9BD5; color: white; border: none; padding: 20px 40px; font-size: 16px; border-radius: 10px; font-weight: bold;">
                    어떤 보조 식품이 나에게 맞을까요?
                </button>
            </a>
        </div>
        
        <!-- <div style="display: flex; justify-content: center; padding-left: 300px; padding-right: 300px;">
            <img src="/html/img/리뷰.JPG" alt="" height="300">
          </div> -->

    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>

</body>

</html>
