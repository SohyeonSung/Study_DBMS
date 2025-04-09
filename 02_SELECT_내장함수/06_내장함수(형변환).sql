/************************************************
형변환 내장함수
TO_CHAR : 문자타입으로 전환(날짜 -> 문자, 숫자 -> 문자)
TO_NUMBER : 숫자타입으로 전환(문자 -> 숫자)
TO_DATE : 날짜타입으로 전환(문자 -> 날짜)

 <- TO_NUMBER(문자) -> TO_DATE(문자)
 -TO_CHAR(숫자) <- TO_CHAR(날짜)
************************************************
--날짜 -> 문자
TO_CHAR(날짜데이터, '출력형식')
<출력형식>
년도(YYYY, YY), 월(MM), 일(DD)
시간 : HH, HH12(12 시간제), HH24(24 시간제)
분(MI), 초(SS)
오전, 오후: AM, PM
년월일시분초 작성예) YYYY-MM-DD HH24:MI:SS
************************************************/

SELECT ABS(-15) FROM DUAL;SELECT CEIL(15.7) FROM DUAL;
SELECT COS(3.14159) FROM DUAL;
SELECT FLOOR(15.7) FROM DUAL;
SELECT LOG(10, 100) FROM DUAL;
SELECT MOD(11, 4) FROM DUAL;
SELECT POWER(3, 2) FROM DUAL;
SELECT ROUND(15.7) FROM DUAL;
SELECT SIGN(-15) FROM DUAL;
SELECT TRUNC(15.7) FROM DUAL;
SELECT CHR(67) FROM DUAL;
SELECT CONCAT('HAPPY ', 'Birthday') FROM DUAL;
SELECT LOWER('Birthday') FROM DUAL;
SELECT LPAD('Page 1', 15, '*.') FROM DUAL;
SELECT LTRIM('Page 1', 'ae') FROM DUAL;
SELECT REPLACE('JACK', 'J', 'BL') FROM DUAL;
SELECT RPAD('Page 1', 15, '*.') FROM DUAL;
SELECT RTRIM('Page 1', 'ae') FROM DUAL;
SELECT SUBSTR('ABCDEFG', 3, 4) FROM DUAL;
SELECT TRIM(LEADING 0 FROM '00AA00') FROM DUAL;
SELECT UPPER('Birthday') FROM DUAL;
SELECT ASCII('A') FROM DUAL;
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) FROM DUAL;
SELECT LENGTH('Birthday') FROM DUAL;
SELECT ADD_MONTHS(TO_DATE('14/05/21','RR/MM/DD'), 1) FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '화') FROM DUAL;
SELECT ROUND(SYSDATE) FROM DUAL;
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(123) FROM DUAL;
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM DUAL;
SELECT TO_NUMBER('12.3') FROM DUAL;
SELECT DECODE(1, 1, 'aa', 'bb') FROM DUAL;
SELECT NULLIF(123, 345) FROM DUAL;
SELECT NVL(NULL, 123) FROM DUAL;




--==============================
/* TO_CHAR(숫자, '출력형식') : 숫자 -> 문자타입
<형식지정>
0(영) : 자리수를 나타내며, 자리수가 맞지 않는 경우 0을 표시
9(구) : 자리수를 나타내며, 자리수가 맞지 않는 경우 표시하지 않음
L : 지역 통화 문자 표시
.(점) : 소수점
,(콤마) : 1000단위 구분 표시 문자
**************************************/
