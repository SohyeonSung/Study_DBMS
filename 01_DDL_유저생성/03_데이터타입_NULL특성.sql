/*****************************************************************
컬럼의 기본 데이타 타입(문자열, 숫자, 날짜)
- VARCHAR2(n) : 문자열 가변길이
- CHAR(n) : 문자열 고정길이
- NUMBER(p, s) : 숫자타입 p:전체길이, s:소수점이하 자리수
    예) (5,2) : 정수부 3자리, 소수부 2자리 - 전체 5자리
- DATE : 날짜형 년,월,일 시간 값 저장

문자열 처리 : UTF-8 형태로 저장
- 숫자, 알파벳 문자, 특수문자 : 1 byte 처리(키보드 자판 글자들)
- 한글 : 3 byte 처리
*******************************************************************/


-- 컬럼 특성 (데이터 타입)을 확인하기 위한 테이블 --
CREATE TABLE TEST (
    NUM NUMBER(5, 2),  -- 숫자타입 : 전체 자리수 5, 정수부 3, 소수부 2 
    STR1 CHAR(10), -- 고정길이 문자열 
    STR2 VARCHAR2(10), -- 가변길이 문자열
    DATE1 DATE -- 날짜 데이터 (년월일시분초)
);

SELECT * FROM TEST;
INSERT INTO TEST VALUES (100.454, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES (100.455, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES (100.456, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES (100.456, 'ABDE', 'ABCDE', SYSDATE);
COMMIT;

INSERT INTO TEST VALUES (1234.456, 'ABC', 'ABC', SYSDATE);-- 오류발생 : 정수부 3자리 저장 가능한데 4자리 저장 시도


-- 문자열 붙이기 부호 (||)사용
SELECT '-' || STR1 || '-', '-' || STR2 || '-' FROM TEST;
SELECT STR1, LENGTHB(STR1) ,STR2, LENGTHB(STR2) FROM TEST;

SELECT * FROM TEST WHERE STR1 = STR2; -- 조회(SELECT)된 데이터가 없음
SELECT * FROM TEST WHERE STR1 = 'ABC'; --오라클에서는 조회됨
SELECT * FROM TEST WHERE STR1 = 'ABC          '; -- 모든 DB에서 조회됨
SELECT * FROM TEST WHERE STR1 = 'ABC    '; --오라클에서는 조회됨

-- 숫자타입
SELECT * FROM TEST WHERE NUM = 100.45; --NUMBER VS NUBMER
SELECT * FROM TEST WHERE NUM = '100.45'; -- NUMBER VS 문자  (오라클 조회O 자동 숫자변환)
SELECT * FROM TEST WHERE NUM = '100.45AAA'; -- 오류발생
---------------
INSERT INTO TEST (STR1, STR2) VALUES ('1234567890', '1234567890');
COMMIT;

SELECT * FROM TEST WHERE STR1 = STR2;

SELECT '-' || STR1 || '-', '-' || STR2 || '-' FROM TEST;
SELECT STR1, LENGTHB(STR1) ,STR2, LENGTHB(STR2) FROM TEST;
--------------------
-- 날짜 타입 DATE는 내부에 년월일시분초 데이터 저장
SELECT * FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY-MM-DD HH24:MI:SS') FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY/MM/DD HH24:MI:SS') FROM TEST;
SELECT DATE1, TO_CHAR(DATE1, 'YYYY.MM.DD HH24:MI:SS') FROM TEST;
----------------------
-- 한글 데이터 처리 (UTF -8) : ASCII 코드 1byte, 한글 1글자 3byte 사용 
SELECT * FROM TEST;
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', 'ABCEDFGHIJ');
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', '홍길동'); -- 한글 3글자 * 3 = 9byte
COMMIT;

INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', '대한민국'); -- 오류발생, 글자크기가 너무 큼 (12byte) 


--=======================
/* (NULL)널의 특성
- NULL(널) : 데이터가 존재하지 않는 상태
- NULL 값에 대한 조회(검색)은 IS NULL, IS NOT NULL 키워드 처리
- NULL은 비교처리가 안됨 : =, !=, <>
- NULL과의 연산 결과 처리는 항상 NULL (연산 의미 없음)
*/
--=======================

SELECT * FROM TEST WHERE NUM = NULL; -- 조회 안됨 , NULL은 비교처리 안됨
SELECT * FROM TEST WHERE NUM != NULL; -- 조회 안됨
SELECT * FROM TEST WHERE NUM <> NULL; -- 조회 안됨

SELECT * FROM TEST WHERE NUM IS NULL;
SELECT * FROM TEST WHERE NUM IS NOT NULL;

--  NULL과의 연산결과
SELECT * FROM DUAL; -- 오라클에서 제공하는 DUMMY 테이블
SELECT 100 + 200, 111 + 222 FROM DUAL;
SELECT 100 + NULL FROM DUAL; -- 결과값 : NULL / "NULL에 어떤 걸 계산해도 항상 NULL"

SELECT * FROM TEST;
SELECT NUM, NUM + 100 FROM TEST;

SELECT NUM, NVL(NUM, 0), NVL(NUM, 0) + 100 FROM TEST;

-- =======================
-- 정렬시 ORDER BY --
SELECT * FROM TEST ORDER BY STR2; -- 기본 오름차순 정렬, ASC 키워드 생략 가능
SELECT * FROM TEST ORDER BY STR2 DESC; -- DESC : 내림차순 정렬

-- 정렬시 NULL 값이 있는 경우 --
 -- 기본 오름차순 정렬시 NULL값을 가장 큰 값으로 처리/맨 뒤로(오라클)
 -- NULL 값 조회 순서 조정(변경) : NULLS FIRST, NULLS LAST
SELECT * FROM TEST ORDER BY NUM; -- NULL 맨 뒤에
SELECT * FROM TEST ORDER BY NUM DESC; -- NULL 맨 앞에

SELECT * FROM TEST ORDER BY NUM NULLS FIRST; -- NULLS FIRST : NULL 맨 앞에
SELECT * FROM TEST ORDER BY NUM DESC NULLS LAST; -- NULLS LAST : NULL 맨 뒤에
----------------------
INSERT INTO TEST( NUM1, STR1, STR2) VALUES (200, ' ', NULL);
SELECT * FROM TEST WHERE STR1 = ' '; -- 데이터 조회 안됨, ' ' -> NULL 처리됨 (오라클)

/* (실습) 테이블(TABLE) 만들기(테이블명: TEST2)
    NO : 숫자타입 5자리, PRIMARY KEY 선언
    ID : 문자타입 10자리(영문10자리), 값이 반드시 존재(NULL 허용안함)
    NAME : 한글 10자리 저장 가능하도록 설정, 값이 반드시 존재
    EMAIL : 영문, 숫자, 특수문자 포함 30자리
    ADDRESS : 한글 100자
    INNUM : 숫자타입 정수부 7자리, 소수부 3자리(1234567.123)
    REGDATE : 날짜타입
*********************/

CREATE TABLE TEST2 (
    NO NUMBER(5) PRIMARY KEY,
    ID CHAR(10) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    EMAIL VARCHAR2(30),
    ADDRESS VARCHAR2(100),
    INNUM NUMBER(10, 3),
    REGDATE DATE
);

SELECT * FROM TEST2;

INSERT INTO TEST2 (NO, ID, NAME, EMAIL, ADDRESS, INNUM, REGDATE)
VALUES (12345, 'FIRST_ID', '강아지', 'aaaa@naver.com', '서울시 강남구 역삼동', 1234567.123, SYSDATE);

COMMIT;

--------------------------
-- 테이블 삭제(DROP TABLE)
--DROP TABLE TEST2;

-- 테이블 생성(CREATE TABLE)
CREATE TABLE TEST3 (
    NO NUMBER(5) PRIMARY KEY,
    ID VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(30)
);
--테이블명 변경(수정)
ALTER TABLE "MYSTUDY"."TEST3" RENAME TO TEST_ALTER;
alter table TEST3 rename to TEST_ALTER; --키워드 소문자, 사용자작성명 대문자
ALTER TABLE test3 RENAME TO test_alter; --키워드 대문자, 사용자작성명 소문자
ALTER TABLE TEST3 RENAME TO TEST_ALTER; --전체 대문자
alter table test3 rename to test_alter; --전체 소문자

SELECT * FROM TEST_ALTER;

--=======================
--특정 테이블의 테이블 구조와 데이터를 함께 복사해서 테이블 생성
CREATE TABLE TEST3 
AS
SELECT * FROM TEST2;

--===============
-- 특정 테이블의 특정컬럼과 데이터만 복사해서 테이블 생성
CREATE TABLE TEST4
AS
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 1111;

--===============
--특정 테이블의 구조만 복사(데이터는 복사하지 않음)
CREATE TABLE TEST5
AS
SELECT * FROM TEST2 WHERE 1 = 2;

--==================
--테이블 데이터 전체 삭제(DELETE, TRUNCATE)
SELECT * FROM TEST2;
DELETE FROM TEST2; --테이블 전체 데이터 삭제
ROLLBACK; -- 임시 삭제된 데이터 작업 취소(DELETE 명령문 사용시)

-- TRUNCATE 명령문 : 테이블 전체 데이터 삭제(ROLLBACK 복구 안됨)
TRUNCATE TABLE TEST2;




















