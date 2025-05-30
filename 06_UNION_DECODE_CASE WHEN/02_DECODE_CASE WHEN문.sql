/* DECODE, CASE WHEN : SQL문 내에서 IF문 구현(CASE : 표준SQL)
DECODE : 동등비교만 가능(동일 데이터 확인)
DECODE(대상, 비교값, 같을때 처리문, 다를때 처리문);
DECODE(대상, 비교값, DECODE(), DECODE());
DECODE(대상, 비교값1, 처리문1
          , 비교값2, 처리문2
          , ...
          , 비교값n, 처리문n
          , 처리문n+1)
**************************************/

-- (1)
SELECT * FROM CUSTOMER ORDER BY NAME;
SELECT NAME, DECODE(NAME, '김연아', '와~김연아!!!')
FROM CUSTOMER
ORDER BY NAME
;
-- (2)
SELECT NAME, DECODE(NAME, '김연아', '와~김연아!!!', '그냥사람')
FROM CUSTOMER
ORDER BY NAME
;
-- (3) 이름이 박지성이면 '축구선수' 아니면 '운동선수'
SELECT NAME, DECODE(NAME, '박지성', '축구선수', '운동선수')
FROM CUSTOMER
ORDER BY NAME
;
-- (4) 김연아면 '피겨스케이팅', 박세리면 '골프', 박지성이면 '축구선수', 나머지 '운동선수'
SELECT NAME
     , DECODE(NAME, '김연아', '피겨스케이팅', '박세리', '골프', '운동선수') AS DECODE1 
     , DECODE(NAME,
           '김연아', '피겨스케이팅',
           '박세리', '골프',
           '박지성', '축구',
           '운동선수'
       ) AS NAME_DECODE
FROM CUSTOMER
ORDER BY NAME
;
--------------------
-- DECODE 구문 안에 DECODE() 사용 가능
--DECODE(대상, 비교값, DECODE(), DECODE());
SELECT NAME
     , DECODE(NAME, '김연아', '피겨스케이팅',
           DECODE(NAME, '박세리', '골프', 
               DECODE(NAME, '박지성', '축구', '운동선수')
           )
       ) AS 운동
FROM CUSTOMER
ORDER BY NAME
;
  
--==========================================================================
/* **** CASE WHEN 문 ************
형태1 : DECODE문 처럼 동등비교
CASE 기준값
     WHEN 비교값1 THEN 일치하면 처리할 구문
     WHEN 비교값2 THEN 일치하면 처리할 구문
     ...
     WHEN 비교값n THEN 일치하면 처리할 구문
     ELSE 위에 일치하는 경우가 없으면 실행할 구문
END
--------
형태2 : IF THEN ELSE 처럼 사용(부등비교 처리 가능)
--CASE문 내의 처리문장에는 CASE중복 사용 가능
--비교구문 : =, <>, !=, >, <, >=, <=, AND, OR, NOT 사용가능
CASE WHEN 비교구문
     THEN 비교구문 결과 TRUE인 경우 처리구문
     ELSE 비교구문 결과 FALSE인 경우 처리구문
END   
------
CASE WHEN 비교구문(예: KOR > 90)
     THEN (CASE WHEN THEN (CASE WHEN THEN ELSE END) 
                     ELSE (CASE WHEN THEN ELSE END)
           END)
     ELSE (CASE WHEN THEN (CASE WHEN THEN ELSE END) 
                     ELSE (CASE WHEN THEN ELSE END)
           END)
END   
-----
CASE WHEN 비교구문 THEN 처리구문
     WHEN 비교구문 THEN 처리구문
     ....
     ELSE 위의 비교구문에 해당되지 않는 경우 처리구문
END 
****************************************/





--==================================
-- [이름이 박지성이면 '축구선수' 아니면 '운동선수']

--(1)
SELECT NAME
        , DECODE(NAME, '박지성', '축구선수', '운동선수') AS DECODE_NAME
        , CASE NAME WHEN '박지성' THEN '축구선수' ELSE '운동선수' END AS CASE_NAME
FROM CUSTOMER
ORDER BY NAME
;
--(2)
SELECT NAME
         , CASE NAME WHEN '박지성'
                  THEN '축구선수'
                  ELSE '운동선수'
            END AS CASE_NAME
FROM CUSTOMER
ORDER BY NAME
;

--=======================================================
-- [김연아면 '피겨스케이팅', 박세리면 '골프', 박지성이면 '축구선수', 나머지 '운동선수']

SELECT NAME
     , CASE NAME 
            WHEN '김연아' THEN '피겨스케이팅'
            WHEN '박세리' THEN '골프'
            WHEN '박지성' THEN '축구'
            ELSE '운동선수'
       END AS CASE_NAME
FROM CUSTOMER
ORDER BY NAME
;

--========================
-- 가격 (PRICE) : ~10000 - '싸다' / 10000~20000 - 적당하다 / 20000~30000 - 비싸다 /30000~ - 너무 비싸다


SELECT B.*
        , CASE WHEN PRICE <= 10000 THEN '싸다'
                 WHEN PRICE > 10000 AND PRICE <= 20000 THEN '적당하다'
                 WHEN PRICE > 20000 AND PRICE <= 30000 THEN '비싸다'
                 ELSE '너무비싸다'
         END AS 평가
FROM BOOK B;





