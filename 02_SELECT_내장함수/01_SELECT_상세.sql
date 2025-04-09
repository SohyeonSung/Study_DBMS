/* ===================
SELECT * | [ DISTINCT ] {컬럼명, 컬럼명, ...}
  FROM 테이블명
[WHERE 조건절]
[GROUP BY {컬럼명, ....}
    [HAVING 조건] ] --GROUP BY 절에 대한 조건
[ORDER BY {컬럼명 [ASC | DESC], ....}] 

--ASC : 오름차순(기본/생략가능)
--DESC : 내림차순
===================== */
-- >, <, >=, <=, =, <>, !=
-- AND, OR, NOT
-- IN, NOT IN
-- BETWEEN a AND b
-- NOT BETWEEN a AND b
-- LIKE : %, _(언더바)
---------------------------
SELECT * FROM BOOK; --책
SELECT * FROM CUSTOMER; --고객
SELECT * FROM ORDERS; --주문/판매
-----------------------
SELECT * FROM BOOK ORDER BY BOOKNAME; --기본 오름차순 ASC
SELECT * FROM BOOK ORDER BY BOOKNAME DESC; --내림차순

--출판사 기준 오름차순(또는 내림차순), 책제목 오름차순(또는 내림차순)
SELECT * FROM BOOK ORDER BY PUBLISHER, BOOKNAME;
--출판사 기준 오름차순, 가격이 큰 것부터(내림차순)
SELECT * FROM BOOK ORDER BY PUBLISHER, PRICE DESC;

--------------
-- >, <, >=, <=, =, <>, !=
-- AND, OR, NOT
-- 출판사 대한미디어, 금액이 3만원 이상인 책 조회(검색)
SELECT *
FROM BOOK
WHERE PUBLISHER = '대한미디어' AND PRICE >= 30000
;
-----
-- OR : 출판사 대한미디어 또는 이상미디어 출판한 책 목록
SELECT *
FROM BOOK
WHERE PUBLISHER = '대한미디어' OR PUBLISHER = '이상미디어'
;
-- NOT : 출판사 굿스포츠를 제외하고 나머지 전체
SELECT * FROM BOOK WHERE PUBLISHER != '굿스포츠'; -- != 같지않다(다르다)
SELECT * FROM BOOK WHERE PUBLISHER <> '굿스포츠'; -- <> 같지않다(다르다)
SELECT * FROM BOOK WHERE NOT PUBLISHER = '굿스포츠';
--------------------
--(실습)굿스포츠, 대한미디어 출판사가 아닌 도서 목록
SELECT * FROM BOOK
WHERE NOT (PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어')
;
SELECT * FROM BOOK
WHERE PUBLISHER != '굿스포츠' AND PUBLISHER <> '대한미디어'
;
-----------------
-- IN : 안에 있냐?(OR 문 단순화)
--(실습)나무수, 대한미디어, 삼성당에서 출판한 도서 목록
SELECT * FROM BOOK
WHERE PUBLISHER = '나무수' 
   OR PUBLISHER = '대한미디어' 
   OR PUBLISHER = '삼성당'
;
SELECT * FROM BOOK
WHERE PUBLISHER IN ('나무수', '대한미디어', '삼성당')
;
--(실습)나무수, 대한미디어, 삼성당이 아닌 도서 목록
SELECT * FROM BOOK
WHERE PUBLISHER <> '나무수' 
  AND PUBLISHER <> '대한미디어' 
  AND PUBLISHER <> '삼성당'
;
SELECT * FROM BOOK
WHERE PUBLISHER NOT IN ('나무수', '대한미디어', '삼성당')
;
--================
/* 동등비교, 부등비교식
= : 같다(동일하다)
!=, <> : 같지않다(다르다)
크다(>), 작다(<), 크거나같다(>=), 작거나같다(<=)
---------------*/
--(실습)출판된 책중에 8000원 이상이고, 22000원 이하인 책(가격순 정렬)
SELECT * FROM BOOK
WHERE PRICE >= 8000 AND PRICE <= 22000
ORDER BY PRICE
;
-- BETWEEN 값1(부터) AND 값2(까지) : 값1 부터 값2 까지(경계값 포함)
SELECT * FROM BOOK
WHERE PRICE BETWEEN 8000 AND 22000
ORDER BY PRICE
;

--(실습)출판된 책중에 8000보다 작거나, 22000원 보다 큰 책(가격순 정렬)
SELECT * FROM BOOK
WHERE PRICE < 8000 OR PRICE > 22000
ORDER BY PRICE
;
SELECT * FROM BOOK
WHERE PRICE NOT BETWEEN 8000 AND 22000
ORDER BY PRICE
;
--(실습) 책 제목이 '야구' ~ '올림픽'(책제목 오름차순 정렬)
SELECT * FROM BOOK
WHERE BOOKNAME >= '야구' AND BOOKNAME <= '올림픽'
ORDER BY BOOKNAME
;
SELECT * FROM BOOK
WHERE BOOKNAME BETWEEN '야구' AND '올림픽'
ORDER BY BOOKNAME
;
------------------

-- (실습 BETWEEN) 출판사 나무수 ~ 삼성당 책목록 (출판사명 오름차순 정렬)
SELECT *
FROM BOOK
WHERE PUBLISHER IN ('나무수', '삼성당')
ORDER BY PUBLISHER
;
-- (실습 IN) 대한미디어, 이상미디어 출판한 책목록 (출판사명, 책제목 정렬)
SELECT *
FROM BOOK
WHERE PUBLISHER IN ('대한미디어', '이상미디어')
ORDER BY PUBLISHER
;

-- ============================
-- LIKE : '%', '_' 부호(언더바)와 함께 사용
-- % : 전체 (모든것)을 의미(0, 1, N)
-- _(언더바) : 문자 1개와 매칭되며 모든 것을 의미 (단, 1개 문자 반드시 있어야 함)
---------------------------

SELECT * FROM BOOK
WHERE PUBLISHER LIKE '%미디어' -- 출판사명이 <미디어>로 끝나는 출판사명
;

SELECT * FROM BOOK
WHERE BOOKNAME LIKE '야구%' -- '야구'로 시작하는 책 조회
;

SELECT * FROM BOOK
WHERE BOOKNAME LIKE '%단계%' -- 책 제목에 '단계'가 있는 책 목록 (단계 시작, 단계 중간, 단계 끝 모두 해당)
;

SELECT * FROM BOOK
WHERE BOOKNAME LIKE '_구%' -- 책 제목 2번째 글자가 '구'인 책 목록
;
---------------------------

-- (실습) 책 제목에 '구' 문자가 있는 책 목록 (% 적용)
SELECT * FROM BOOK
WHERE BOOKNAME LIKE '%구%'
;
-- (실습) 책 제목에 3번째 글자가 '의'가 있는 책 조회 (언더바 적용)
SELECT * FROM BOOK
WHERE BOOKNAME LIKE '__의%'
;

-- (실습) 책 제목 중 2, 3번째 글자가 <구의>인 책 목록 (언더바 적용)
SELECT * FROM BOOK
WHERE BOOKNAME LIKE '_구의%'
;


--=====================================
--(실습문제)
--1. 출판된 책 전체 조회(정렬: 출판사, 금액순)
--2. 굿스포츠에서 출판한 책을 책 제목 순으로 조회
--3. 출판된 책 중 10000원 이상인 책(가격순-큰금액부터)
--4. 성이 '김'씨인 고객의 이름과 주소
--5. 성이 '박'이고 이름이 '성'으로 끝나는 고객의 이름과 주소
--6. 책 제목 '야구' 부터 '축구' 까지를 검색하기(책제목으로 정렬)
---- (단, '역도' 관련도서는 제외)
--7. 박지성의 총 구매액(CUSTID = 1)
--8. 박지성이 구매한 도서의 수
--======================================


--1. 출판된 책 전체 조회(정렬: 출판사, 금액순)
SELECT *
FROM BOOK
ORDER BY PUBLISHER, PRICE
;
--2. 굿스포츠에서 출판한 책을 책 제목 순으로 조회
SELECT *
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME
;
--3. 출판된 책 중 10000원 이상인 책(가격순-큰금액부터)
SELECT *
FROM BOOK
WHERE PRICE >= 10000
ORDER BY PRICE DESC
;
--4. 성이 '김'씨인 고객의 이름과 주소
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '김%'
;
--5. 성이 '박'이고 이름이 '성'으로 끝나는 고객의 이름과 주소
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '박%성'
;

--6. 책 제목 '야구' 부터 '축구' 까지를 검색하기(책제목으로 정렬)
---- (단, '역도' 관련도서는 제외)
SELECT *
FROM BOOK
WHERE BOOKNAME >= '야구' AND BOOKNAME <= '축구'
  AND BOOKNAME NOT LIKE '%역도%'
ORDER BY BOOKNAME
;

--7. 박지성의 총 구매액(CUSTID = 1)

SELECT * FROM CUSTOMER;
SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성';

SELECT * FROM ORDERS;
SELECT SALEPRICE FROM ORDERS WHERE CUSTID = 1;
SELECT 6000 + 21000 + 12000 FROM DUAL;  -- 39000 : 수작업으로 해결

--8. 박지성이 구매한 도서의 수
SELECT * FROM ORDERS WHERE CUSTID = 1; -- 3건(권)

SELECT COUNT(*)
FROM ORDERS
WHERE CUSTID = 1
;



