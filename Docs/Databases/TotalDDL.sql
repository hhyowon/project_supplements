
CREATE TABLE AUTH_NAMES
(
  AUTH_NAME VARCHAR(200) NOT NULL COMMENT '접근권한명',
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '접근권한 대표값',
  PRIMARY KEY (UNIQUE_ID)
) COMMENT '접근권한명';

CREATE TABLE AUTHS
(
  USER_ID   VARCHAR(50)  NOT NULL COMMENT '회원아이디',
  UNIQUE_ID VARCHAR(200) NOT NULL COMMENT '접근권한 대표값'
) COMMENT '권한들';

CREATE TABLE BMI
(
  BMI_UID    VARCHAR(50) NOT NULL COMMENT 'BMI _UID',
  USER_ID    VARCHAR(50) NOT NULL COMMENT '회원아이디',
  YEAR       VARCHAR(50) NOT NULL COMMENT '연도 ',
  HEIGHT     VARCHAR(50) NOT NULL COMMENT '신장',
  WEIGHT     VARCHAR(50) NOT NULL COMMENT '체중',
  BMI_RESULT VARCHAR(50) NOT NULL COMMENT 'BMI 결과값',
  PRIMARY KEY (BMI_UID)
);

CREATE TABLE CATEGORY
(
  CATEGORY_ID VARCHAR(50)  NOT NULL COMMENT '카테고리UID',
  CATEGORY    VARCHAR(100) NOT NULL COMMENT '카데고리',
  PRIMARY KEY (CATEGORY_ID)
) COMMENT '카테고리';

CREATE TABLE COMMUNITY
(
  COMMUNITY_ID      VARCHAR(100) NOT NULL COMMENT '커뮤니티UID',
  CATEGORY_ID       VARCHAR(50)  NOT NULL COMMENT '카테고리UID',
  COMMUNITY_TITLE   VARCHAR(100) NOT NULL COMMENT '게시글제목',
  COMMUNITY_CONTENT VARCHAR(500) NOT NULL COMMENT '게시글내용',
  COMMUNITY_DATE    VARCHAR(100) NOT NULL COMMENT '게시글작성일',
  USER_ID           VARCHAR(50)  NOT NULL COMMENT '회원아이디',
  PRIMARY KEY (COMMUNITY_ID)
) COMMENT '커뮤니티';

CREATE TABLE COMPANYNAME
(
  COMPANYNAME_UID VARCHAR(100) NOT NULL COMMENT '회사명UID',
  COMPANYNAME     VARCHAR(100) NOT NULL COMMENT '회사명',
  PRIMARY KEY (COMPANYNAME_UID)
) COMMENT '회사명';

CREATE TABLE GENDER
(
  GENDER     VARCHAR(50) NOT NULL COMMENT '성별',
  GENDER_UID VARCHAR(50) NOT NULL COMMENT '성별_UID',
  PRIMARY KEY (GENDER_UID)
) COMMENT '성별';

CREATE TABLE MEMBERS
(
  USER_ID     VARCHAR(50) NOT NULL COMMENT '회원아이디',
  NAME        VARCHAR(50) NOT NULL COMMENT '이름',
  GENDER_UID  VARCHAR(50) NOT NULL COMMENT '성별_UID',
  PASSWORD    VARCHAR(50) NOT NULL COMMENT '비밀번호',
  PHONENUMBER VARCHAR(50) NOT NULL COMMENT '연락처',
  ADDRESS     VARCHAR(50) NOT NULL COMMENT '주소',
  EMAIL       VARCHAR(50) NOT NULL COMMENT '이메일',
  PRIMARY KEY (USER_ID)
) COMMENT '회원';

CREATE TABLE RESEARCH
(
  PRODUCT_UID     VARCHAR(50)  NOT NULL COMMENT '제품_UID',
  PRODUCT         VARCHAR(100) NOT NULL COMMENT '제품명',
  COMPANYNAME_UID VARCHAR(100) NOT NULL COMMENT '회사명UID',
  URL             VARCHAR(500) NOT NULL COMMENT 'url',
  USER_ID         VARCHAR(50)  NOT NULL COMMENT '회원아이디',
  FORMULATION     VARCHAR(50)  NULL     COMMENT '제형',
  PROUDUCT_IMG    VARCHAR(100) NULL     COMMENT '제품이미지',
  EFFECT          VARCHAR(50)  NULL     COMMENT '제품효과',
  PRIMARY KEY (PRODUCT_UID)
) COMMENT '검색';

CREATE TABLE SURVEY
(
  SURVEY_TYPE_ID     VARCHAR(100) NOT NULL COMMENT '설문 폼 종류 ID',
  SURVEY_QUESTION_ID VARCHAR(100) NOT NULL COMMENT '설문 질문 ID',
  SURVEY_ID          VARCHAR(100) NOT NULL COMMENT ' 설문 ID',
  USER_ID            VARCHAR(50)  NOT NULL COMMENT '회원아이디',
  SURVEY_OPT_ID      VARCHAR(100) NOT NULL COMMENT '설문 선택지 ID',
  PRIMARY KEY (SURVEY_ID)
) COMMENT '설문 ';

CREATE TABLE SURVEY_OPT
(
  SURVEY_OPT    VARCHAR(100) NOT NULL COMMENT '설문 답항',
  SURVEY_OPT_ID VARCHAR(100) NOT NULL COMMENT '설문 답항 ID',
  PRIMARY KEY (SURVEY_OPT_ID)
) COMMENT '설문 답항';

CREATE TABLE SURVEY_QUESTION
(
  SURVEY_QUESTION    VARCHAR(100) NOT NULL COMMENT '설문 질문',
  SURVEY_QUESTION_ID VARCHAR(100) NOT NULL COMMENT '설문 질문 ID',
  PRIMARY KEY (SURVEY_QUESTION_ID)
) COMMENT '설문 질문';

CREATE TABLE SURVEY_TYPE
(
  SURVEY_TYPE    VARCHAR(100) NOT NULL COMMENT '설문 폼 종류',
  SURVEY_TYPE_ID VARCHAR(100) NOT NULL COMMENT '설문 폼 종류 ID',
  PRIMARY KEY (SURVEY_TYPE_ID)
) COMMENT ' 설문 폼 종류 ';

CREATE TABLE SURVEY_TYPE_FOR_QUESTION
(
  SURVEY_TYPE_ID     VARCHAR(100) NOT NULL COMMENT '설문 폼 종류 ID',
  SURVEY_QUESTION_ID VARCHAR(100) NOT NULL COMMENT '설문 질문 ID'
) COMMENT '복용여부별 질문';

CREATE TABLE SURVEYRESULT
(
  USER_ID   VARCHAR(50)  NOT NULL COMMENT '회원아이디',
  SURVEY_ID VARCHAR(100) NOT NULL COMMENT ' 설문 ID'
) COMMENT '설문결과';

ALTER TABLE BMI
  ADD CONSTRAINT FK_MEMBERS_TO_BMI
    FOREIGN KEY (USER_ID)
    REFERENCES MEMBERS (USER_ID);

ALTER TABLE COMMUNITY
  ADD CONSTRAINT FK_CATEGORY_TO_COMMUNITY
    FOREIGN KEY (CATEGORY_ID)
    REFERENCES CATEGORY (CATEGORY_ID);

ALTER TABLE COMMUNITY
  ADD CONSTRAINT FK_MEMBERS_TO_COMMUNITY
    FOREIGN KEY (USER_ID)
    REFERENCES MEMBERS (USER_ID);

ALTER TABLE MEMBERS
  ADD CONSTRAINT FK_GENDER_TO_MEMBERS
    FOREIGN KEY (GENDER_UID)
    REFERENCES GENDER (GENDER_UID);

ALTER TABLE RESEARCH
  ADD CONSTRAINT FK_COMPANYNAME_TO_RESEARCH
    FOREIGN KEY (COMPANYNAME_UID)
    REFERENCES COMPANYNAME (COMPANYNAME_UID);

ALTER TABLE RESEARCH
  ADD CONSTRAINT FK_MEMBERS_TO_RESEARCH
    FOREIGN KEY (USER_ID)
    REFERENCES MEMBERS (USER_ID);

ALTER TABLE SURVEY
  ADD CONSTRAINT FK_SURVEY_QUESTION_TO_SURVEY
    FOREIGN KEY (SURVEY_QUESTION_ID)
    REFERENCES SURVEY_QUESTION (SURVEY_QUESTION_ID);

ALTER TABLE SURVEY
  ADD CONSTRAINT FK_SURVEY_OPT_TO_SURVEY
    FOREIGN KEY (SURVEY_OPT_ID)
    REFERENCES SURVEY_OPT (SURVEY_OPT_ID);

ALTER TABLE SURVEY_TYPE_FOR_QUESTION
  ADD CONSTRAINT FK_SURVEY_TYPE_TO_SURVEY_TYPE_FOR_QUESTION
    FOREIGN KEY (SURVEY_TYPE_ID)
    REFERENCES SURVEY_TYPE (SURVEY_TYPE_ID);

ALTER TABLE SURVEY_TYPE_FOR_QUESTION
  ADD CONSTRAINT FK_SURVEY_QUESTION_TO_SURVEY_TYPE_FOR_QUESTION
    FOREIGN KEY (SURVEY_QUESTION_ID)
    REFERENCES SURVEY_QUESTION (SURVEY_QUESTION_ID);

ALTER TABLE SURVEYRESULT
  ADD CONSTRAINT FK_MEMBERS_TO_SURVEYRESULT
    FOREIGN KEY (USER_ID)
    REFERENCES MEMBERS (USER_ID);

ALTER TABLE SURVEYRESULT
  ADD CONSTRAINT FK_SURVEY_TO_SURVEYRESULT
    FOREIGN KEY (SURVEY_ID)
    REFERENCES SURVEY (SURVEY_ID);

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_MEMBERS_TO_AUTHS
    FOREIGN KEY (USER_ID)
    REFERENCES MEMBERS (USER_ID);

ALTER TABLE AUTHS
  ADD CONSTRAINT FK_AUTH_NAMES_TO_AUTHS
    FOREIGN KEY (UNIQUE_ID)
    REFERENCES AUTH_NAMES (UNIQUE_ID);
