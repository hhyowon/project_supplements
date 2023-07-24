-- 질문을 뽑아오는 쿼리 
SELECT Q.SURVEY_QUESTION, Q.SURVEY_QUESTION_ID
FROM survey_type_for_question AS T
INNER JOIN survey_question AS Q
ON T.SURVEY_QUESTION_ID = Q.SURVEY_QUESTION_ID
WHERE T.SURVEY_TYPE_ID = 'F-01';

-- 답변 뽑아오는 쿼리 
select O.SURVEY_QUESTION_ID, O.SURVEY_OPT, O.SURVEY_OPT_ID 
from survey_opt AS O
	;

-- 질문과 답항을 뽑아오는 쿼리(복용x) 
SELECT Q.SURVEY_QUESTION, O.SURVEY_OPT, Q.SURVEY_QUESTION_ID
FROM survey_type_for_question AS T
INNER JOIN survey_question AS Q 
ON T.SURVEY_QUESTION_ID = Q.SURVEY_QUESTION_ID
LEFT JOIN survey_opt AS O 
ON Q.SURVEY_QUESTION_ID = O.SURVEY_QUESTION_ID
WHERE T.SURVEY_TYPE_ID = 'F-01'
ORDER BY O.OPT_ORDER;

-- 질문과 답항을 뽑아오는 쿼리( 복용o)
SELECT Q.SURVEY_QUESTION, O.SURVEY_OPT, Q.SURVEY_QUESTION_ID
FROM survey_type_for_question AS T
INNER JOIN survey_question AS Q 
ON T.SURVEY_QUESTION_ID = Q.SURVEY_QUESTION_ID
LEFT JOIN survey_opt AS O 
ON Q.SURVEY_QUESTION_ID = O.SURVEY_QUESTION_ID
WHERE T.SURVEY_TYPE_ID = 'F-02'
ORDER BY Q.QUESTION_ORDER, O.OPT_ORDER;

-- 설문조사 결과 INSERT 
INSERT INTO surveyresult
(USER_ID, DATE_TIME, SURVEY_UID)
VALUES 
('honggd123',NOW(), 'SUID_78');

INSERT INTO survey (SURVEY_TYPE_ID, SURVEY_QUESTION_ID, SURVEY_ID,SURVEY_OPT_ID, SURVEY_UID)    
 VALUES      ('F-01', 'Q-01', 'SU-550','O-01', 'SUID_77');