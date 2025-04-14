--서브쿼리(sub query) : SQL 문 내부에 있는 SQL문
--SQL(SELECT, INSERT, UPDATE, DELETE)문 내에 있는 쿼리문
------------------------------------------------
--서브쿼리 위치별 명칭
SELECT O.ORDERID, O.SALEPRICE, O.ORDERDATE
     , O.CUSTID, C.NAME
     , O.BOOKID
     , (SELECT BOOKNAME FROM BOOK 
        WHERE BOOKID = O.BOOKID) BOOK_NAME  -- SELECT문 -> 스칼라 서브쿼리(Scalar subquery)
FROM ORDERS O, 
     (SELECT * FROM CUSTOMER 
      WHERE NAME IN ('장미란', '추신수')) C -- FROM 문 ->인라인 뷰(Inline View)
WHERE O.CUSTID = C.CUSTID
  AND SALEPRICE > (SELECT AVG(SALEPRICE) FROM ORDERS) -- WHERE 문 -> 중첩 서브쿼리(Nested subquery)
ORDER BY SALEPRICE  
;
--=========================
--==[박지성이 구입한 내역을 검색]==--

-- (1) 기본
SELECT * FROM ORDERS; --구입내역
SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성'; --CUSTID : 1
SELECT * FROM ORDERS
WHERE CUSTID = 1;

-- (2) 서브쿼리 사용
SELECT * FROM ORDERS
WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성')
;

-- (3) 조인문 처리
SELECT C.NAME, O.*, C.ADDRESS
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
;

--==============================
--==[박지성, 김연아가 구입한 내역을 검색]==--

-- (1) WHERE 절에서 서브쿼리 사용시 
-- 서브쿼리 조회결과가 2건 이상인 경우 IN 사용
SELECT *
FROM ORDERS
WHERE CUSTID IN (
            SELECT CUSTID
            FROM CUSTOMER 
             WHERE NAME IN ('박지성', '김연아')
             );

--(2) 조인문으로
SELECT *
FROM BOOK B, ORDERS O, CUSTOMER C
WHERE B.BOOKID = O.BOOKID
    AND O.CUSTID = C.CUSTID -- 조인조건
    AND C.NAME = '박지성' -- 찾을조건(선택조건)
;
--========================================================
--== [출판된 책중에 정가가 가장 비싼 도서의 책제목, 출판사명, 정가를 구하시오]==

-- (1) 서브쿼리
SELECT BOOKNAME AS 책제목,
          PUBLISHER AS 출판사명,
          PRICE AS 정가
FROM BOOK
WHERE PRICE = ( SELECT MAX(PRICE)
                       FROM BOOK );
                       
-- (2) 조인문으로                      
SELECT *
FROM BOOK B,
        (SELECT MAX(PRICE) AS MAX_PRICE
        FROM BOOK) M
WHERE B.PRICE = M.MAX_PRICE
;

--=====================================--
--(실습) 서브쿼리 이용
--1. 한 번이라도 구매한 내역이 있는 사람
---- (또는 한 번도 구매하지 않은 사람)
--2. 20000원 이상되는 책을 구입한 고객 명단 조회
--3. '대한미디어' 출판사의 책을 구매한 고객이름 조회
--4. 전체 책가격 평균보다 비싼 책의 목록 조회
--=====================================--

--1. 한 번이라도 구매한 내역이 있는 사람
---- (또는 한 번도 구매하지 않은 사람)
SELECT *
FROM CUSTOMER
WHERE CUSTID IN (
    SELECT CUSTID
    FROM ORDERS
);

SELECT *
FROM CUSTOMER
WHERE CUSTID NOT IN (
    SELECT CUSTID
    FROM ORDERS
);

--2. 20000원 이상되는 책을 구입한 고객 명단 조회
SELECT *
FROM CUSTOMER
WHERE CUSTID NOT IN (SELECT CUSTID FROM ORDERS
                     WHERE SALEPRICE >= 20000) --구입(판매)가 기준
;

SELECT *
FROM CUSTOMER
WHERE CUSTID NOT IN (SELECT CUSTID FROM ORDERS
                     WHERE BOOKID IN (SELECT BOOKID 
                                                FROM BOOK
                                                WHERE PRICE >= 20000) )
;

--3. '대한미디어' 출판사의 책을 구매한 고객이름 조회
SELECT *
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS
                 WHERE BOOKID IN (SELECT BOOKID
                                          FROM BOOK
                                          WHERE PUBLISHER = '대한미디어') )
;

SELECT NAME
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE B.BOOKID = O.BOOKID
    AND O.CUSTID = C.CUSTID 
    AND B.PUBLISHER = '대한미디어'
;

--4. 전체 책가격 평균보다 비싼 책의 목록 조회
SELECT *
FROM BOOK
WHERE PRICE > (
    SELECT AVG(PRICE)
    FROM BOOK)
;







