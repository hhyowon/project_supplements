<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<body>
    <%@ include file= "/WEB-INF/views/etc/Header.jsp" %>
    
    <!-- 마이페이지 옆-->
    <div class="row g-0 vh-100">
        <nav class="p-5 navbar-light bg-light d-md-block col-2">
            <div>
                <ul class="list-unstyled navbar-nav">
                    <li class="d-flex align-items-center">
                        <div class="text-decoration-none nav-link fs-5 fw-bold">마이페이지</div>
                    </li>
                    <li class="d-flex align-items-center">
                        <a href="./mypage.html" class="text-decoration-none nav-link">개인정보 수정</a>
                    </li>
                    <li class="d-flex align-items-center">
                        <a href="./mypage_community.html" class="text-decoration-none nav-link">내가 작성한 글</a>
                    </li>
                    <li class="d-flex align-items-center">
                        <a href="" class="text-decoration-none nav-link">내 설문조사 이력</a>
                    </li>
                    <br>
                    <li class="d-flex align-items-center">
                        <a href="./mainnavs.html" class="text-decoration-none nav-link fw-bold">로그아웃</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="col-9 p-0 mb-5 ms-5">
            <div style="text-align:center;">
                <h1 class="h3 mb-3 fw-normal">내 글 관리</h1>
            </div>
            <br>
            <div class="container">
                <form action="">
                    <div class="d-flex justify-content-center align-items-center input-group mb-3">
                        <div class="d-flex align-items-center">
                            <div class="input-group">
                                <select class="form-select" name="keyField" id="" style="width: 150px;">
                                    <option>카테고리</option>
                                    <option value="Q">질문</option>
                                    <option value="review">후기</option>
                                    <option value="recommend">추천</option>
                                </select>
                                <input type="text" placeholder="검색어를 입력하세요" class="form-control" style="width: 300px;" />
                                <button class="btn btn-main" type="submit" formaction="" formmethod="get" >검색</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>


            <br>
            <div class="container">
                <table class="ui celled table table text-center table-bordered table-hover">
                    <thead>
                        <tr style="background: #8cc1f3;">
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>등록자</th>
                            <th>등록일</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody id="list">
                        <tr>

                            <td>1</td>
                            <td>질문</td>
                            <td>다이어트 보조제 부작용 중에 변비도 있나요?</a></td>
                            <td>효원</td>
                            <td>2023.07.10.</td>
                            <td>
                                <a href="mypage_community_post.html" class="btn btn-sm btn-outline-secondary">수정</a>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit" formaction="">삭제</button>
                            </td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>질문</td>
                            <td>다이어트 성공 가능할까요..?</td>
                            <td>효원</td>
                            <td>2023.07.10.</td>
                            <td>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit"
                                    formaction="">수정</button>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit"
                                    formaction="">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>질문</td>
                            <td>워터밤에 가려고 하는데 효과 직빵인 다이어트 보조제 있나요:?</td>
                            <td>효원</td>
                            <td>2023.07.10.</td>
                            <td>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit"
                                    formaction="">수정</button>
                                <button class="btn  btn-sm btn-outline-secondary" type="submit"
                                    formaction="">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>