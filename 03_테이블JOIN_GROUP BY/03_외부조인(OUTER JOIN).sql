--(번외) 고객 중 한 권도 구입 안 한 사람은 누구??
----고객 테이블에는 있는데, 주문(판매) 테이블에 없는 사람
------------------
--(방법1) MINUS : 차집합 처리
SELECT CUSTID FROM CUSTOMER --1,2,3,4,5
MINUS
SELECT CUSTID FROM ORDERS --1,1,2,3,4,1....
;
------
--(방법2) 서브쿼리(SUB QUERY)
SELECT *
FROM CUSTOMER
WHERE CUSTID NOT IN (SELECT CUSTID FROM ORDERS)
;
-------------
--(방법3) 외부조인(OUTER JOIN)
--고객중 한번도 구입내역이 없는 고객 명단 구하기
SELECT C.CUSTID, C.NAME, C.ADDRESS, C.PHONE
--SELECT *
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+)  --LEFT OUTER JOIN : 좌측기준
  AND O.ORDERID IS NULL
;
------
-- 표준(ANSI) SQL(LEFT OUTER JOIN)
--고객중 한번도 구입내역이 없는 고객 명단 구하기
SELECT C.*
--SELECT *
FROM CUSTOMER C LEFT OUTER JOIN ORDERS O  --좌측기준
     ON C.CUSTID = O.CUSTID
WHERE O.ORDERID IS NULL    
;

--==============
--RIGHT OUTER JOIN
--고객중 한번도 구입내역이 없는 고객 명단 구하기
SELECT C.*
--SELECT *
FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID(+) = C.CUSTID --우측기준
  AND O.ORDERID IS NULL
;
--표준 SQL(RIGHT OUTER JOIN)
SELECT C.*
--SELECT *
FROM ORDERS O RIGHT OUTER JOIN CUSTOMER C  --우측기준
     ON O.CUSTID = C.CUSTID
WHERE O.ORDERID IS NULL    
;

--==============================

CREATE TABLE DEPT (
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30)
);

INSERT INTO DEPT VALUES (10, '총무부');
INSERT INTO DEPT VALUES (20, '급여부');
INSERT INTO DEPT VALUES (30, 'IT부');

COMMIT;

------------------------------------------

CREATE TABLE DEPT1 (
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30)
);

INSERT INTO DEPT1 VALUES (10, '총무부');
INSERT INTO DEPT1 VALUES (20, '급여부');

COMMIT;

------------------------------------------

CREATE TABLE DEPT2 (
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30)
);

INSERT INTO DEPT2 VALUES (10, '총무부');
INSERT INTO DEPT2 VALUES (30, 'IT부');

COMMIT;

------------------------------------------

SELECT * FROM DEPT;
SELECT * FROM DEPT1;
SELECT * FROM DEPT2;

------------------------------------------
-- FULL OUTER JOIN : 어느 한쪽에만 존재하는 데이터 찾기
SELECT *
FROM DEPT1 D1, DEPT2 D2
WHERE D1.ID = D2.ID --INNER JOIN
;
SELECT *
FROM DEPT1 D1, DEPT2 D2
WHERE D1.ID = D2.ID(+) --LEFT OUTER JOIN(좌측에만 존재하는 데이터 찾기)
  AND D2.ID IS NULL
;
SELECT *
FROM DEPT1 D1, DEPT2 D2
WHERE D1.ID(+) = D2.ID --RIGHT OUTER JOIN(우측에만 존재하는 데이터 찾기)
  AND D1.ID IS NULL
;
-----
--FULL OUTER JOIN
SELECT *
FROM DEPT1 D1 FULL OUTER JOIN DEPT2 D2
     ON D1.ID = D2.ID
WHERE D1.ID IS NULL
   OR D2.ID IS NULL
;




