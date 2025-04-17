-- [오라클  PL/SQL 프로그래밍 사용 (프로시저, 함수, 트리거 작성)]


--==== [(1) PL/SQL 프로시저 (PROCEDURE)] ====
SET SERVEROUTPUT ON;

DECLARE -- 변수 선언
    V_EMPID NUMBER(5); --변수선언 + 초기값 설정
    V_NAME VARCHAR2(30);
    
BEGIN --실행문 작성영역 (시작)

    V_EMPID := 100;  --치환(대입)문 부호(콜른이퀄 :=) 사용
    V_NAME := '김유신';

    DBMS_OUTPUT.PUT_LINE('HELLO PROCEDURE');            --화면 출력
    DBMS_OUTPUT.PUT_LINE(V_EMPID || ' : ' || V_NAME);     --화면 출력
    
END; --실행문 작성영역 (끝)

-----------------------------------------------
-- BOOK 테이블 데이터 중 일부를 화면 출력

DECLARE
    V_BOOKID NUMBER(2);
    V_BOOKNAME VARCHAR2(40);
    V_PUBLISHER VARCHAR2(40);
    V_PRICE NUMBER(8);

BEGIN
    -- SELECT ~ INTO ~ FROM 형태로 DB 데이터 선택하고 INTO 절 변수에 저장 
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = 1;
    
    DBMS_OUTPUT.PUT_LINE(V_BOOKID || ', ' || V_BOOKNAME || ', ' || V_PUBLISHER || ', ' || V_PRICE);
    
END;

--=====[저장 프로시저 (Stored Procedure)]======
/* 
- DBMS에 저장된 프로시저
- 매개변수(파라미터, Parameter) 유형(모드)

- IN : 입력을 받기만 하는 변수 형태 (기본값)
- OUT : 출력만 하는 변수 형태 (값을 받을 수 없고, 프로시저 실행 후 저장값을 호출한 곳으로 전달)
- IN OUT : 입/출력 가능 (값을 전달받고, 실행 후 저장값을 호출한 곳으로 전달)
*/

CREATE OR REPLACE PROCEDURE BOOK_DISP --프로시저 선언부
-- 매개변수 선언부 : ( ) 안에 작성, 타입만 지정, 구분 문자 콤마( , )
(
    IN_BOOKID IN NUMBER
)

AS -- 변수 선언문 (AS 또는 IS ~ BEGIN 사이)
    V_BOOKID NUMBER(2);
    V_BOOKNAME VARCHAR2(40);
    V_PUBLISHER VARCHAR2(40);
    V_PRICE NUMBER(8);
    
BEGIN
    SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
    INTO V_BOOKID, V_BOOKNAME, V_PUBLISHER, V_PRICE
    FROM BOOK
    WHERE BOOKID = 1;
    
    DBMS_OUTPUT.PUT_LINE(V_BOOKID || ', ' || V_BOOKNAME || ', ' || V_PUBLISHER || ', ' || V_PRICE);
    
END;

/* 프로시저 실행 
- EXECUTE 프로시저명 : SQLPlus, SQLDeveloper 툴에서 사용)
- CALL 프로시저명 : 툴과 PL/SQL 블록내에서도 사용가능
*/
EXECUTE BOOK_DISP(5);
EXEC BOOK_DISP(10);
CALL BOOK_DISP(3);


/* 프로시저 삭제 (DROP PROCEDURE) */
DROP PROCEDURE BOOK_DISP;

--===================================---
/* (실습) 프로시저 작성하고 실행하기
고객테이블(CUSTOMER)에 있는 데이터 조회 프로시저 작성
- 프로시저명 : CUSTOMER_DISP
- 입력받는 값 : 고객ID
- 처리 : 입력받은 고객ID에 해당하는 데이터를 찾아서 화면 출력
- 출력항목 : 고객ID, 고객명, 주소, 전화번호
*********************************/

SET SERVEROUTPUT ON;

DECLARE
    V_CUSTID NUMBER(2);
    V_NAME VARCHAR2(40);
    V_ADDRESS VARCHAR2(50);
    V_PHONE VARCHAR2(20);

BEGIN
    SELECT CUSTID, NAME, ADDRESS, PHONE
    INTO V_CUSTID, V_NAME, V_ADDRESS, V_PHONE
    FROM CUSTOMER
    WHERE CUSTID = 1;
    
    DBMS_OUTPUT.PUT_LINE(V_CUSTID || ', ' || V_NAME || ', ' || V_ADDRESS || ', ' || V_PHONE);
    
END;

------

CREATE OR REPLACE PROCEDURE CUSTOMER_DISP (
    IN_CUSTID IN NUMBER
) AS 
    V_CUSTID NUMBER(2);
    V_NAME VARCHAR2(40);
    V_ADDRESS VARCHAR2(50);
    V_PHONE VARCHAR2(20);
    
BEGIN
    SELECT CUSTID, NAME, ADDRESS, PHONE
    INTO V_CUSTID, V_NAME, V_ADDRESS, V_PHONE
    FROM CUSTOMER
    WHERE CUSTID = 1;
    
    DBMS_OUTPUT.PUT_LINE(V_CUSTID || ', ' || V_NAME || ', ' || V_ADDRESS || ', ' || V_PHONE);
    
END;

----====================
-- 프로시저 파라미터 유형 : IN, OUT 사용

CREATE OR REPLACE PROCEDURE OUT_BOOKINFO (
    IN_BOOKID IN NUMBER,
    OUT_BOOKNAME OUT VARCHAR2,
    OUT_PUBLISHER OUT VARCHAR2,
    OUT_PRICE OUT NUMBER
) AS
BEGIN
END;










