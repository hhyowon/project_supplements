<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<body>
    <%@ include file="Header.jsp" %>
    <!-- Menu -->

    <div style="position: relative;">
        <img class="w-100" src="img/다.PNG" alt="" height="700">
        <div style="position: absolute; top: 55%; left: 25%; transform: translate(-50%, -50%);">
            <p style="font-size: 26px; font-weight: bold; color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); white-space: nowrap;">
                다이어트를 원하는 당신</p>
            <p style="font-size: 26px; font-weight: bold; color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); white-space: nowrap;">
                설문조사를 통해 알맞은 보조제를 찾아보세요!</p>
        </div>
        <a href="survey.html">
            <button style="position: absolute; top: 70%; left: 19%; transform: translate(-50%, -50%); background-color: #5B9BD5; color: white; border: none; padding: 20px 40px; font-size: 16px; border-radius: 10px; font-weight: bold;">
                어떤 보조 식품이 나에게 맞을까요?
            </button>
        </a>
    </div>
    <%@ include file="Footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
