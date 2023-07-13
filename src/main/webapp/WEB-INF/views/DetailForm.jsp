<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <title>Detail Form</title>
</head>

<body>
    <div class="container">
        <div class="text-center mt-4 mb-4 h1">Detail Form</div>
    </div>
    <div class="container">
        <form id="selectDetail" action="" method="post">
            <div class="mb-3">
                <input class="form-control" type="hidden" id="commonCodeId" name="COMMON_CODE_ID">
            </div>
            <% HashMap params=(HashMap)request.getAttribute("params"); 
               String searchStr=(String)params.getOrDefault("search", ""); 
               HashMap result=(HashMap)request.getAttribute("result"); %>
            <div class="mb-3">
                <label class="form-label" for="name">NAME:</label>
                <input class="form-control" type="text" id="name" name="NAME" value="<%= result.get("NAME") %>">
            </div>
            <div class="mb-3">
                <label class="form-label" for="description">DESCRIPTION:</label>
                <input class="form-control" type="text" id="description" name="DESCRIPTION" value="<%= result.get("DESCRIPTION") %>">
            </div>
            <div class="mb-3">
                <label class="form-label" for="system_code_yn">SYSTEM_CODE_YN:</label>
                <input  class="form-control" type="text" id="system_code_yn" name="SYSTEM_CODE_YN" value="<%= result.get("SYSTEM_CODE_YN") %>">
            </div>
            
            <div class="mb-3">
                <label class="form-label" for="use_yn">USE_YN:</label>
                <input class="form-control" type="text" id="use_yn" name="USE_YN" value="<%= result.get("USE_YN") %>">
            </div>
            <div class="mb-3">
                <label class="form-label" for="parent_id"> PARENT_COMMON_CODE_ID:</label>
                <input class="form-control" type="text" id="parent_id" name="PARENT_COMMON_CODE_ID" value="<%= result.get("PARENT_COMMON_CODE_ID") %>">
            </div>
            <div class="text-center">
                <button class="btn btn-primary" type="submit" formaction="/carInfor/exselectSearch">뒤로</button>
                <button class="btn btn-primary" formaction='/carInfor/updateForm/<%= result.get("COMMON_CODE_ID") %>'>updete</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>