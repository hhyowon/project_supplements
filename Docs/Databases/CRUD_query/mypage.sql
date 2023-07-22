-- 개인정보 select
SELECT NAME, USER_ID, PASSWORD, PHONENUMBER, ADDRESS, EMAIL
FROM members;

-- 개인정보 update
UPDATE members
SET NAME= '홍길동'
, PASSWORD = '12345'
, PHONENUMBER = '010-1233-5677'
, ADDRESS = '경기도 구리시'
,EMAIL= 'RKQO457@email.com'
WHERE USER_ID = 'honggd123';

-- 본인 게시글만 뽑아오기 위해서 정보 추가 
INSERT INTO community
(COMMUNITY_ID, CATEGORY_ID, COMMUNITY_TITLE, COMMUNITY_CONTENT, COMMUNITY_DATE, USER_ID)
VALUES ('12', 'C_01', '보조제 다들 뭐 드세요?','추천부탁드립니다','2023-07-22','가배457')
,('13', 'C_01', '질문이요~','보조제 랭킹은 설문조사 기반인거 맞나요???','2023-07-21','가배457')
,('14', 'C_03', '보조제 추천해요','해당 사이트에서 추천 받은 보조제 젤리제리 맛있어요~','2023-07-22','가배457')
;

-- 본인 게시글만 뽑아오기 
SELECT CO.COMMUNITY_ID, CA.CATEGORY, CO.COMMUNITY_TITLE,  CO.COMMUNITY_DATE, M.NAME
FROM community as CO
INNER JOIN members AS M
ON CO.USER_ID = M.USER_ID
LEFT JOIN category AS CA
ON CO.CATEGORY_ID = CA.CATEGORY_ID
WHERE CO.USER_ID = '가배457' 
ORDER BY  CO.COMMUNITY_DATE DESC;