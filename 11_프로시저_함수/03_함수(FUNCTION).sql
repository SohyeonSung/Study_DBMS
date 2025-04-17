/* 함수(FUNCTION)
CREATE OR REPLACE FUNCTION FUNC1 (
  PARAM1 IN VARCHAR2 --(옵션)파라미터
) RETURN VARCHAR2 --(필수)리턴타입
AS 
BEGIN
  RETURN NULL; --(필수)RETURN문
END;
**************************************/

-- BOOK 테이블에서 BOOKID로 책제목 확인하는 함수
-- (파라미터값 : BOOKID값 / RETURN 값 : BOOKNAME)

CREATE OR REPLACE FUNCTION GET_BOOKNAME (
    IN_ID IN NUMBER 
) RETURN VARCHAR2 -- (필수) 리턴타입
AS 
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME
    INTO V_BOOKNAME
    FROM BOOK
    WHERE BOOKID = IN_ID;
    
    RETURN V_BOOKNAME;
END;    
------------------------------------------
-- 함수 사용은 내장함수 사용방식과 동일

SELECT GET_BOOKNAME(1) FROM DUAL;
SELECT BOOKID, BOOKNAME FROM BOOK WHERE BOOKID = 1;

--(1) SELECT 절에 사용 
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(BOOKID)
FROM BOOK
;
-- 조인해서 쓰는게 좋음 ㅎㅎ
SELECT O.*, GET_BOOKNAME(BOOKID) 
FROM ORDERS O
;
------------------------------------------
--(2) WHERE 절에서 함수 사용
SELECT O.*, GET_BOOKNAME(BOOKID) 
FROM ORDERS O
WHERE GET_BOOKNAME(BOOKID) LIKE '%야구%'
;


--============================================================
-- (실습) 고객 ID값을 받아서 고객명을 찾아주는 함수 작성 (CUSTOMER 테이블 사용)
-- 함수명 : GET CUSTNAME
-- GET_CUSTNAME 함수 사용해서 고객명 검색 여부 확인해보기
----------------
-- ORDERS 테이블 데이터 조회
-- GET_BOOKNAME, GET_CUSTNAME 함수사용 주문(판매)정보와 책 제목, 고객명 조회

CREATE OR REPLACE FUNCTION GET_CUSTNAME (
    IN_CUSTID IN NUMBER 
) RETURN VARCHAR2 
AS 
    V_NAME CUSTOMER.NAME%TYPE;
BEGIN
    SELECT NAME
    INTO V_NAME
    FROM CUSTOMER
    WHERE CUSTID = IN_CUSTID;
    
    RETURN V_NAME;
END; 

SELECT NAME
FROM CUSTOMER
WHERE CUSTID = 2;
SELECT GET_CUSTNAME(2) FROM DUAL;

SELECT ORDERID
        , CUSTID
        , GET_CUSTNAME (CUSTID) AS NAME
        , BOOKID
        , GET_BOOKNAME(BOOKID) AS BOOKNAME
        , SALEPRICE
        ,ORDERDATE
FROM ORDERS
;




























