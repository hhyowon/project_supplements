# '9998' Final Project

## 📃콘텐츠 : 다이어트 보조제 추천 사이트 

### ✔️프로젝트 설명
다이어트 보조제 추천 사이트를 만들어 달라는 의뢰를 받아 구현한 사이트. 
사이트 이용객의 설문조사를 기반한 순위를 통해 원하는 효과별 보조제를 추천받을 수 있다. 
제형 및 효과별 보조제를 검색할 수 있으며, 커뮤니티를 통해 보조제에 대한 질문, 후기, 및 추천글을 작성 및 조회할 수 있다. 
더불어 마이페이지, 관리자페이지를 통해 원활한 관리가 될 수 있게끔 구현하였다.

### ✔️사용 기술

<img src="https://img.shields.io/badge/Java-3178C6?style=flat&logo=&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=Spring Boot&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS-1572B6?style=flat&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/MyBatis-4479A1?style=flat&logo=&logoColor=white"/> <img src="https://img.shields.io/badge/JSP Servlet-C5E99B?style=flat&logo=&logoColor=white"/> <img src="https://img.shields.io/badge/GoormIDE-D4DFE6?style=flat&logo=&logoColor=white"/>

### ✔️개발 기간

- 2023년 7월 7일~ 2023년 7월 31일

### ✔️구현 영상

- [다이어트 보조제 구현 영상](https://www.youtube.com/watch?v=eFJFn9SuabQ)

### ✔️구현 화면

<img src="src/main/resources/static/images/화면정의서.png" width="800"> 
<img src="src/main/resources/static/images/화면정의서2.png" width="800"> 


### ✔️ERD

- [ERD](https://github.com/hhyowon/project_supplements/blob/main/Docs/Databases/ERD.png) 

### ✔️팀원 및 구현 기능

### 👩‍💻 김명곤

<details>
<summary>Sample Code</summary>

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

- [SurveryResultMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/LoginMapper.xml)
- [SurveyResultController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/LoginController.java)
- [SurveyResultService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/RegisterService.java)

</details>

<details>
<summary>랭킹</summary>

- [SurveyRankMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/RegisterMapper.xml)
- [RankController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/RegisterController.java)
- [RankService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/RegisterService.java)

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

- [CheckPriceMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/CheckPriceMapper.xml)
- [MainController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/CheckPriceController.java)
- [CheckPriceService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/CheckPriceService.java)

</details>

<details>
<summary>BMI 페이지</summary>

- [BmiMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/SearchMapper.xml)
- [BMIController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/SearchController.java)
- [BmiSerivce.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/SearchService.java)

</details>

<details>
<summary>다이어트 보조제 검색</summary>

- [SearchMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/DealerMapper.xml)
- [SearchController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/DealerController.java)
- [SearchService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/DealerService.java)
</details>


<details>
<summary>관리자페이지 회원 관리</summary>

- [AdminMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/NoticeMapper.xml)
- [AdminController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/NoticeController.java)
- [AdminService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/NoticeService.java)

</details>

<details>
<summary>관리자페이지 보조제 관리</summary>

- [AdminProductMapper.xml](https://github.com/HNNNY35/final_retoree/blob/master/src/main/resources/sqlmapper/mysql/NoticeMapper.xml)
- [AdminProductsController.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/controller/NoticeController.java)
- [AdminProductsService.java](https://github.com/HNNNY35/final_retoree/blob/master/src/main/java/com/project/final_retoree/services/NoticeService.java)

</details>


### 👩‍💻 오가배 

<details>
<summary>설문조사 진행 페이지</summary>

- [SurveyMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/SurveyMapper.xml)
- [SurveyController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/SurveyController.java)
- [SurveyService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/SurveyService.java)

</details>

<details>
<summary>커뮤니티</summary>

- [CommunityMapper.xml](https://github.com/hhyowon/project_supplements/blob/main/src/main/resources/sqlmapper/mysql/CommunityMapper.xml)
- [CommunityController.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/controller/CommunityController.java)
- [CommunityService.java](https://github.com/hhyowon/project_supplements/blob/main/src/main/java/com/example/project_supplements/service/CommunityService.java)
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

### 👍 김명곤

```
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authorize access="isAuthenticated()">
@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
    @Bean
        public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
                // None using csrf protection
                httpSecurity.csrf().disable();
                // 권한에 대한 부분 : url & roles : user url & roles
                // url, roles from Dao
                httpSecurity.authorizeHttpRequests() // 로그인
                .requestMatchers("/manager*").hasAnyRole("ADMIN", "MANAGER")
                .requestMatchers("/admin*/*").hasRole("ADMIN")
                .requestMatchers("/main").authenticated() //로그인한 대상자
                .requestMatchers("/carInfor/map/*").hasRole("USER")
                        .anyRequest().permitAll() //그외 전체 대상
                ;
                httpSecurity.formLogin(login -> login.loginPage("/loginForm") //로그인 하지 않은 사람이 로그인한 후에 접근 가능한 페이지를 눌렀을때 로그인 폼을 띄어라
                                .failureUrl("/loginForm?fail=true") 
                                .loginProcessingUrl("/login") 
                                .defaultSuccessUrl("/")); //로그인 하고 나면 메인으로 간다
                httpSecurity.logout(logout -> logout
                                .logoutSuccessUrl("/home")
                                .invalidateHttpSession(true)
                                .deleteCookies("JSESSIONID"));

                return httpSecurity.build();
        }
                 @Bean
        public BCryptPasswordEncoder encoderPasswordEncoder() {
                return new BCryptPasswordEncoder();
        }       
```
모여서 회의하다가 강사님이 부르시길래 내가 다녀올게~ 하고 나갔다가 로또 5등에 당첨이 되지 않는 제가 백엔드에 당첨되었읍니다.
내가.. 내가 백엔드라니.. 내가 백엔드라니!! 으아니!! 내가 백엔드라니!!!!!
아무고토 모르는 내가 백엔드라 걱정이 많이 되었지만 마른 오징어도 짜면 물이 나온다고
하다보니 되더라구요.
일단 해! 라는 마인드가 중요했읍니다.
하나씩 해결해 나가는 우리 팀을 보면서 우리도 할 수 있다라는 생각을 하게 되었읍니다.
우리 조원들이 많이 도와줘서 프로젝트 1차 완료 할 수 있었읍니다.
권한부여하는 부분에서 시행착오가 많이 있었고 로그인하면서 PASSWORD를 암호화 하는 부분도 인상깊었읍니다.
2차 프로젝트도 잘 해쳐나갔으면 좋겠습니다.
부족한 저를 만나 고생한 팀원들에게 이 영광을 돌립니다.

### 👍 송명주

```
      SELECT T_SURVEYOPT.SURVEY_OPT_URL AS SURVEY_RANK_FIRST
    FROM (
    SELECT T_SURVEY.SURVEY_UID
    FROM SURVEY AS T_SURVEY
    INNER JOIN SURVEYRESULT AS T_SURVEYRESULT ON T_SURVEY.SURVEY_UID = T_SURVEYRESULT.SURVEY_UID
    WHERE T_SURVEY.SURVEY_OPT_ID = 'O-54'
    ) AS T_SURVEYUID
    INNER JOIN SURVEY AS T_SURVEY2 ON T_SURVEYUID.SURVEY_UID = T_SURVEY2.SURVEY_UID
    INNER JOIN SURVEY_OPT AS T_SURVEYOPT ON T_SURVEYOPT.SURVEY_OPT_ID = T_SURVEY2.SURVEY_OPT_ID
    WHERE T_SURVEY2.SURVEY_QUESTION_ID = 'Q-06'
    GROUP BY T_SURVEYOPT.SURVEY_OPT_URL
    ORDER BY COUNT(*) DESC
    LIMIT 3;

    // 관리자 부모테이블 설문조사 삭제
    public Object delete(Map dataMap) {
        String sqlMapId = "Adminsurvey.surveydelete";
        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
        }
    // 관리자 자식테이블 설문조사 삭제
    public Object resultdelete(Map dataMap) {
        String sqlMapId = "Adminsurvey.surveyresultdelete";
        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
        }
    // 관리자 설문조사 삭제 및 select
    public Object deleteAndSelectSearch(String SURVEY_UID, Map dataMap) {
        dataMap.put("SURVEY_UID", SURVEY_UID);
        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(dataMap));
        result.put("deleteCount", this.resultdelete(dataMap));
        result.putAll(this.selectWithPagination(dataMap));
        return result;
        }   
```
    랭킹을 구현하기 위한 쿼리문을 작성하는데 있어서 




### 👍 조효원

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

리투리 프로젝트에서 검색과 시세 기능을 맡았습니다. 제가 생각했던 구현의 중점은 여러 테이블로 분리된 대량의 데이터를 분류하고 가져오는 것이었습니다. 하지만 프로젝트를 완료하면서 불러온 차량 데이터에 대한 이미지 경로를 처리하는 과정에서 불필요한 데이터베이스 호출이 많아져서 성능이 저하되었다는 것이 아쉬웠습니다. 이러한 문제가 발생한 이유는 처음부터 자바 코드를 작성할 때, SQL 문을 고려하지 않았기 때문입니다. 이러한 문제를 사전에 고려하고 SQL 문에서 한 번의 호출로 처리하는 방법을 고려했다면, 성능 저하 문제를 방지할 수 있었을 것입니다. 이번 프로젝트를 통해서 코드를 작성하기 위해 더 다양한 상황에 대한 대처와 고려점이 필요하다고 느꼈습니다.

### 👍 오가배

```
        List surveyMapList = new ArrayList<Map>();
        for (String questionId : dataMap.keySet()) {
            Map<String, String> questionAnswerMap = new HashMap<>();
            String answerId = (String) dataMap.get(questionId);
            questionAnswerMap.put("QuestionId", questionId);
            questionAnswerMap.put("AnswerId", answerId);
            questionAnswerMap.put("SURVEY_ID", this.generateUUID());
            surveyMapList.add(questionAnswerMap);
        }
        dataMap.put("surveyMapList", surveyMapList);
        // 부모테이블 값 insert 먼저 시키기 
        String SURVEY_UID = UUID.randomUUID().toString(); 
        dataMap.put("USER_ID", commons.getUserID()); // user_id 받기
        dataMap.put("SURVEY_UID", SURVEY_UID);
        dataMap.put("DATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        String sqlMapId = "SurveyService.insertsurveyresult";
        Object result01 = sharedDao.insert(sqlMapId, dataMap);

        // 자식테이블 insert

        dataMap.put("SURVEY_TYPE_ID", "F-01");
        sqlMapId = "SurveyService.insertsurvey";
        Object resultMap = sharedDao.insert(sqlMapId, dataMap);
        //String uuid = this.generateUUID();
        return dataMap;

```

설문조사 결과값을 DB에 넣는 과정에서 NAME과 VALUE값을 효율적으로 연결하는 법과 DB에 INSERT를 시키기 위해서는 
부모테이블을 먼저 insert를 시켜야 자식테이블에 insert가 가능하다는 점을 확실히 인지하였습니다. 
더불어 참조 받은 fk값인 SURVEY_UID는 UUID로 받는데 동일한 UUID임을 인지시켜줘야 부모테이블 및 자식테이블이 insert가 된다는 점을 통해 
ERD를 명확하게 이해해야 나머지 코드를 조금 더 수월하게 진행해 나갈 수 있음을 알게 되었습니다. 
마지막으로 팀원분들과 원활한 소통 덕분에 조금 더 빠르고 효율적으로 프로젝트를 진행해 나갈 수 있었음에 감사드립니다!! 
