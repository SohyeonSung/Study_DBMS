/* 상관서브쿼리(상호연관 서브쿼리)
-- 메인쿼리의 값을 서브쿼리가 사용하고, 서브쿼리의 결과값을 메인쿼리가 사용
-- 메인쿼리와 서브쿼리가 서로 조인된 형태로 동작
*******************/

SELECT O.ORDERID, 
          O.CUSTID,
          (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUST_NAME,
          O.BOOKID,
          (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) BOOK_NAME,
          O.SALEPRICE,
          O.ORDERDATE
FROM ORDERS O
;

SELECT * FROM ORDERS;
SELECT * FROM BOOK;


-- 출판사별 평균 도서 가격보다 비싼 도서 목록을 구하시오

-- (1)
SELECT B.*
        , (SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = B.PUBLISHER) PUB_AVG
FROM BOOK B
WHERE PRICE > (SELECT AVG(PRICE) FROM BOOK
                        WHERE PUBLISHER = B.PUBLISHER)
;
-- (2) 조인문으로
SELECT * 
FROM BOOK B,
        (SELECT PUBLISHER, AVG(PRICE) AVG_PRICE
         FROM BOOK
         GROUP BY PUBLISHER) A
WHERE B.PUBLISHER = A.PUBLISHER -- 조인조건
    AND B.PRICE > A.AVG_PRICE 
;

--=====================================
-- EXISTS : 존재여부 확인시 사용(있으면 TRUE)
-- NOT EXISTS : 없으면 TRUE


SELECT *
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS)
;
-- ===> EXISTS 적용 : 데이터가 있으면 선택
SELECT *
FROM CUSTOMER C
WHERE EXISTS (SELECT 1 FROM ORDERS
                 WHERE CUSTID = C.CUSTID)
;

-- NOT EXISTS 적용 : 선택된 데이터가 없으면 선택
SELECT *
FROM CUSTOMER C
WHERE NOT EXISTS (SELECT 1 FROM ORDERS
                 WHERE CUSTID = C.CUSTID)
;





















