<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.css">
    <title>Insert Form</title>
</head>

<body>
    <div class="container">
        <div class="text-center mt-4 mb-4 h1">Insert Form</div>
    </div>
    <div class="container">
        <form id="insertForm" action="" method="post">
            <div class="mb-3">
                <label class="form-label" for="commonCodeId">COMMON_CODE_ID:</label>
                <input class="form-control" type="text" id="commonCodeId" name="COMMON_CODE_ID">
            </div>
            <div class="mb-3">
                <label class="form-label" for="name">NAME:</label>
                <input class="form-control" type="text" id="name" name="NAME">
            </div>
            <div class="mb-3">
                <label class="form-label" for="orderNumber">ORDER_NUMBER:</label>
                <input class="form-control" type="text" id="orderNumber" name="ORDER_NUMBER">
            </div>
            <div class="mb-3">
                <label class="form-label" for="attribution1">ATTRIBUTION_1:</label>
                <input class="form-control" type="text" id="attribution1" name="ATTRIBUTION_1">
            </div>
            <div class="mb-3">
                <label class="form-label" for="attribution2">ATTRIBUTION_2:</label>
                <input class="form-control" type="text" id="attribution2" name="ATTRIBUTION_2">
            </div>
            <div class="mb-3">
                <label class="form-label" for="description">DESCRIPTION:</label>
                <input class="form-control" type="text" id="description" name="DESCRIPTION">
            </div>
            <div class="mb-3">
                <label class="form-label" for="systemCodeYn">SYSTEM_CODE_YN:</label>
                <input class="form-control" type="text" id="systemCodeYn" name="SYSTEM_CODE_YN">
            </div>
            <div class="mb-3">
                <label class="form-label" for="useYn">USE_YN:</label>
                <input class="form-control" type="text" id="useYn" name="USE_YN">
            </div>
            <div class="mb-3">
                <label class="form-label" for="parentCommonCodeId">PARENT_COMMON_CODE_ID:</label>
                <input class="form-control" type="text" id="parentCommonCodeId" name="PARENT_COMMON_CODE_ID">
            </div>
            <div class="mb-3">
                <label class="form-label" for="registerSeq">REGISTER_SEQ:</label>
                <input class="form-control" type="text" id="registerSeq" name="REGISTER_SEQ">
            </div>
            <div class="mb-3">
                <label class="form-label" for="registryDate">REGISTRY_DATE:</label>
                <input class="form-control" type="text" id="registryDate" name="REGISTRY_DATE">
            </div>
            <div class="mb-3">
                <label class="form-label" for="modifierSeq">MODIFIER_SEQ:</label>
                <input class="form-control" type="text" id="modifierSeq" name="MODIFIER_SEQ">
            </div>
            <div class="mb-3">
                <label class="form-label" for="modifyDate">MODIFY_DATE:</label>
                <input class="form-control" type="text" id="modifyDate" name="MODIFY_DATE">
            </div>
            <div class="text-center">
                <button class="btn btn-primary" type="submit" formaction="/carInfor/insertAndSelectSearch" method="post">Submit</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>