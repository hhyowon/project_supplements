
<div style="text-align: center;">
  <img src="src/main/resources/static/html/img/logo.PNG" width="200" alt="Logo">
</div>

## 📃콘텐츠 : 다이어트 보조제 추천 사이트 
 <strong>홈페이지 이용객의 설문조사를 기반하여 다이어트 보조제를 추천해주는 웹 사이트 입니다.</strong>

### 프로젝트 발표
- 수주제안서 : https://drive.google.com/file/d/1YmUQKVRzeXReqGQ6nQSMrjkwI1SmuzNg/view?usp=drive_link
- 프로젝트 최종 발표 : https://drive.google.com/file/d/1mFkEl9tV1wHMJ0vzZ83fXcrRsaOoLc9t/view?usp=drive_link
 
### ✔️프로젝트 설명
코로나 이후 다이어트에대한 관심도가 증가하면서 다이어트 보조제에대한 관심도 또한 증가하였습니다. 이에 기반하여 다이어트 보조제 추천 사이트를 만들고 싶어하는 의뢰팀의 프로젝트를 담당하게 되어 구현한 사이트입니다. 일반적인 추천 사이트와 다르게 사이트 이용객의 설문조사를 기반으로 보조제를 추천해 주는 사이트로 더욱 신뢰도 높은 보조제를 추천 받을 수 있습니다. 

#### 📌 프로젝트 주요 기능 
- 설문조사를 기반한 보조제 추천 랭킹 
- 제형 및 효과별 보조제 검색 기능
- 질문, 후기 및 추천글 공유가 가능한 커뮤니티
- 과거 설문정보 등 나의 기록을 저장하는 마이페이지
- 보조제 홈페이지를 원활하게 관리하는 관리자페이지
- BMI 페이지 : BMI 계산, 통계보기 기능 


### ✔️개발 기간
총 2개월 
- 1차 : 2023년 7월 7일~ 2023년 7월 31일 
- 2차 : 2023년 9월 ~ 2023년 10월

### ✔️구현 영상

- [다이어트 보조제 구현 영상](https://youtu.be/ITC1kb3Hb-8?si=xJxQXpiQGpfbyK9M)

### ✔️구현 화면

<img src="src/main/resources/static/images/화면정의서.png" width="800"> 
<img src="src/main/resources/static/images/화면정의서2.png" width="800"> 


### ✔️ERD
<img src="Docs\Databases\ERD_9998_final.png" width="800"> 


### ✔️사용 기술

<img src="https://img.shields.io/badge/Java-3178C6?style=flat&logo=&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=Spring Boot&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS-1572B6?style=flat&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/MyBatis-4479A1?style=flat&logo=&logoColor=white"/> <img src="https://img.shields.io/badge/JSP Servlet-C5E99B?style=flat&logo=&logoColor=white"/> <img src="https://img.shields.io/badge/GoormIDE-D4DFE6?style=flat&logo=&logoColor=white"/>


### ✔️팀원 및 구현 기능
### 1차
| 김명곤 | 송명주 | 조효원 | 오가배 |
| ------- | ------- | ----------- | --------- |
| - Sample Code | - 설문조사 통계 | - 메인페이지 | - 설문조사 진행 페이지 |
| - 로그인 | - 랭킹 | - BMI 페이지 | - 마이페이지 회원정보 수정 |
| - 권한 설정 | - 마이페이지 설문 이력 | - 다이어트 보조제 검색 | - 마이페이지 커뮤니티 관리 |
| | - 관리자 페이지 설문 이력 | - 커뮤니티 | - 관리자 페이지 커뮤니트 관리 |
| | | - 관리자 페이지 회원 관리 | - 관리자 페이지 보조제 관리 |

### 2차
### 📊 분석 : 오가배 , 송명주 / 💻응용 : 조효원 , 김명곤 

  | 오가배                | 송명주               | 조효원              | 김명곤               |
  | ----------------- | ----------------- | ----------------- | ----------------- |
 | 데이터 수집 및 통합 전처리 | 데이터 수집 및 전처리 | 팀원 업무분장 및 관리 | 회원관리페이지        |
 | LDA 토픽 모델링을 통한 토픽 추출 | 머신러닝 모델링 통한 감성분석 | 회원가입 유지보수 | 랭크페이지 유지보수 |
 | 인사이트 도출 및 보고서 작성 | 인사이트 도출 및 보고서 작성 | BMI페이지(계산, 결과, 마이페이지) | 댓글 구현 |
   | 통계 쿼리 작성    | 통계 쿼리 작성    | 설문조사페이지  | 권한 관리        |
|  | | 통계 그래프 차트 구현   |








### 👩‍💻 김명곤


</details>
<details><summary>Sample Code</summary>

- [SecurityConfiguration.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/configs/SecurityConfiguration.java)
- [SampleController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/SampleController.java)
- [SampleService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/SampleService.java)
- [DietMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/DietMapper.xml)
- [Header.jsp](https://github.com/hhyowon/project_supplements/blob/main/src/main/webapp/WEB-INF/views/etc/Header.jsp)
- [Footer.jsp](https://github.com/hhyowon/project_supplements/blob/main/src/main/webapp/WEB-INF/views/etc/Footer.jsp)
- [list_map_ex.jsp](https://github.com/hhyowon/project_supplements/blob/main/src/main/webapp/WEB-INF/views/etc/list_map_ex.jsp)
</details>

<details>
<summary>로그인</summary>

- [LoginController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/LoginController.java)
- [SignController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/SignController.java)
- [SignService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/SignService.java)

</details>

<details>
<summary>권한 설정 </summary>
  
 - [PrincipalUser.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/security/PrincipalUser.java)
 - [PrincipalUserService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/security/PrincipalUserService.java)
 - [AuthsService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/AuthsService.java)
 - [SecurityConfiguraion.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/configs/SecurityConfiguration.java)
  
</details> 





### 👩‍💻 송명주

<details>
<summary>설문조사 통계</summary>

- [SurveryResultMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/SurveryResultMapper.xml)
- [SurveyResultController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/LoginController.java)
- [SurveyResultService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/SurveyResultService.java)

</details>

<details>
<summary>랭킹</summary>

- [SurveyRankMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/SurveyRankMapper.xml)
- [RankController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/RegisterController.java)
- [RankService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/RankService.java)

</details>

<details>
<summary>마이페이지 설문 이력</summary>

- [UserInfoAdminMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/UserInfoAdminMapper.xml)
- [UserInfoAdminController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/UserInfoAdminController.java)
- [UserInfoAdminService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/UserInfoAdminService.java)

</details>

<details>
<summary>관리자 페이지 설문 이력</summary>

- [UserInfoAdminMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/UserInfoAdminMapper.xml)
- [UserInfoAdminController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/UserInfoAdminController.java)
- [UserInfoAdminService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/UserInfoAdminService.java)

</details>

### 👩‍💻 조효원

<details>
<summary>메인페이지</summary>

- [MainController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/MainController.java)

</details>

<details>
<summary>다이어트 보조제 검색</summary>

- [SearchMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/SearchMapper.xml)
- [SearchController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/SearchController.java)
- [SearchService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/SearchService.java)
</details>

<details>
<summary>커뮤니티</summary>

- [CommunityMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/CommunityMapper.xml)
- [CommunityController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/CommunityController.java)
- [CommunityService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/CommunityService.java)
</details>

<details>
<summary>관리자페이지 회원 관리</summary>

- [AdminMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/AdminMapper.xml)
- [AdminController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/AdminController.java)
- [AdminService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/AdminService.java)

</details>

<details>
<summary>관리자페이지 보조제 관리</summary>

- [AdminProductMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/AdminProductMapper.xml)
- [AdminProductsController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/AdminProductsController.java)
- [AdminProductsService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/AdminProductsService.java)

</details>


### 👩‍💻 오가배 

<details>
<summary>설문조사 진행 페이지</summary>

- [SurveyMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/SurveyMapper.xml)
- [SurveyController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/SurveyController.java)
- [SurveyService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/SurveyService.java)

</details>

<details>
<summary>마이페이지 회원정보 수정 </summary>

- [MypageMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/MypageMapper.xml)
- [MypageController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/MypageController.java)
- [MypageService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/MypageService.java)

</details>

<details>
<summary>마이페이지 커뮤니티 관리 </summary>

- [MypageMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/MypageMapper.xml)
- [MypageController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/MypageController.java)
- [MypageService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/MypageService.java)

</details>

<details>
<summary>관리자 페이지 커뮤니티 관리 </summary>

- [AdminCommunityMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/AdminCommunityMapper.xml)
- [AdminCommunityControll.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/AdminCommunityControll.java)
- [AdminCommunityService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/AdminCommunityService.java)

</details>



### ✔️주요코드 및 진행 통해 느낀 점
### 👍 1차 

```
        <% Paginations paginations=(Paginations)result.get("paginations"); %>
        
          </div>
          <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="/adminproduct/selectSearch?currentPage=<%=paginations.getPreviousPage()%>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Previous</a>
            </li>
              <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                <li class="page-item">
                  <a class="page-link" href="/adminproduct/selectSearch?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">
                    <%= i %>
                  </a>
                </li>
                <% } %>
                <li class="page-item">
                  <a class="page-link" href="/adminproduct/selectSearch?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>">Next</a>
                </li> 
            </ul>
          </nav>
        </div>

        //제품 추가하기
        public Object insert(Map dataMap) {
            String sqlMapId = "Adminproduct.insert";
            if (dataMap.get("PRODUCT_UID") == null || dataMap.get("PRODUCT_UID").equals("")) {
              
                String uuid = commons.generateUUID(); // user_id 받기 (수정)
                dataMap.put("PRODUCT_UID", uuid);
                dataMap.put("USER_ID", commons.getUserID()); 
            } else {
                
            }
            
            Object result_1 = sharedDao.insert(sqlMapId, dataMap);
            HashMap result = (HashMap) this.selectWithPagination(dataMap);
            return result;
        
        }    
}

```

 프로젝트 시작이 여름이라는 계절 특성상 다이어트 보조제에 대한 관심이 있었습니다. 그래서 다이어트 보조제 사이트를 요청한 팀의 프로젝트를 맡고자 했고,  수주 제안서를 가지고 격렬한 PT 경쟁 끝에 이 프로젝트를 담당하게 되었습니다. 처음으로 내가 생각하는 웹 사이트를 구현하는 것이 아니라 수주-의뢰 관계를 기반으로  프로젝트를 수행하는 것이었기 때문에 더 큰 책임감을 느꼈습니다. 먼저,  의뢰한 팀이 웹 사이트에 어떤 내용을 보여주고 어떤 기능을 중요하게 생각하는지 정확하게 파악했습니다. 애매하거나 더 자세한 설명이 필요한 사항들은 Excel로 정리하여 저의 팀 PM에게 제출하고 회의하는 과정을 거쳤고, 그 후 우리와 의뢰팀 PM끼리의  미팅을 통해 더 정확한 방향을 얻을 수 있었습니다. 이 과정을 통해 의사 소통의 중요성과 프로젝트에 대한 이해도의 중요성을 깨닫게 되었습니다.

이 프로젝트에서 주로 검색(search) 및 페이지네이션(pagination) 기능을 구현하는 부분을 담당했습니다. 이러한 기능은 간단해 보일 수 있지만, 올바르게 작동할 때 프로젝트의 완성도를 높이는 데 중요한 역할을 합니다. 특히 페이지네이션을 구현할 때 페이지 번호와 검색어와 같은 매개변수 값이 동적으로 변경될 때, 이를 올바르게 처리하고 쿼리 매개변수의 형태로 전달하는 것이 어려웠습니다. 이 문제를 해결하기 위해 페이지 번호 및 검색어와 같이 동적으로 변하는 매개변수 값을 URL 쿼리 매개변수로 전달하는 방법을 공부하고 구현했습니다. 이 과정을 통해 페이지네이션과 검색 기능을 프로젝트에 성공적으로 통합하였습니다. 

이번 프로젝트를 통해 시스템 흐름도에 따라 어떻게 흘러가고 작동되는지 자세히 이해하게 되었습니다. 또한 수주-의뢰 방식의 프로젝트 경험 덕에 저의 개발역량을 향상시키는데 도움이 되었습니다.

---

### 👍 2차 


### 🙋🏻‍♂️🙋🏻‍♀️ 분석팀 & 응용팀 협업사항

|  분석                   | 분석결과 | 협업사항                             |
| ---------------| ------------------ | ----------------------------------- |
| 크롤링 리뷰 분석 | 사용자가 효능을 가장 중요시 여김 | - 검색 페이지 : 보조제에서 효능 뱃지 색깔 변경   |
|                   |     | - 랭킹페이지 : 효능 별 랭킹 구현                |
| 공공데이터 분석  | 남녀 BMI 평균  | Bar chart : BMI 평균 구현 
|                 | 남녀별 BMI 구분 | Pie chart :  남녀별 BMI TYPE 퍼센트 구현 
| 커뮤니티 게시글 분석  | 게시글 작성으로 월별 이용자 수 확인 | Line Chart : 월별 게시글 작성 수 구현 
| 설문조사 결과 분석 | 설문조사 결과를 통해 결과 시각화 필요 | Pie Chart : 설문조사 보조제별 , 복용원인별  퍼센트 구현  
| 사이트 분석 | 설문조사 내역 중 보조제 선택 문항의 보기가 계속해서 증가할 것 예상 | 복용자 설문조사 페이지 : 라디오버튼 방식의 선택에서 보조제 선택 문항만 드롭다운으로 변경

---
### 🏠 9998팀 문화 
### 1. 데일리 미팅
- 매일 아침 각자 그 날 해야하는 작업에대해 공유하기
- 작업진행정도에대해서 공유하기
- '난 뭐하면 됨?' 금지

### 2. Merge
- 겹치는 사항을 수정하게 된다면 merge하기 전에 공유하기
- 완성된 코드 날리기 방지 

### 3. 함께 고민하기
- 자신이 담당한 부분만 신경쓰지 않고 프로젝트 진행 시 생기는 문제들 함께 고민하기
