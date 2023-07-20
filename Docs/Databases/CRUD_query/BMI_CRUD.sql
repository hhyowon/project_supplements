SELECT * FROM project_diet.bmi;

INSERT INTO bmi(BMI_UID, USER_ID, YEAR, HEIGHT, WEIGHT, BMI_RESULT)
VALUES ('B-21', 'honggd123', '2024', '180', '80', '25.15');

SELECT * 
FROM project_diet.bmi
WHERE USER_ID = 'honggd123';

/*추가 - 특정아이디 삭제 */