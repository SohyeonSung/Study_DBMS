/**********************************
<숫자 관련 내장함수>
숫자함수 : SQL에서는 사칙연산(+, -, *, /)과 나머지 연산(MOD) 사용
ABS(숫자) : 절대값
FLOOR(숫자) : 소수점 아래 버림
CEIL(숫자) : 올림 
ROUND(숫자) : 반올림 - 소수점 이하 반올림
ROUND(숫자, 자리수) : 자리수 이하 반올림 예) ROUND(95.789, 2) -> 95.79
TRUNC(숫자) : 정수만 남기고, 소수부 버림
TRUNC(숫자, 자리수) : 정수 이하 자리수까지 유지 
MOD(숫자, 나누는수) : 나머지
SIGN(숫자) : 부호값 반환(양수: 1, 영: 0, 음수: -1)
POWER(숫자, n) : 숫자의 n제곱 값 계산(POWER(2, 3) -> 8) 
***********************************/

--숫자연산 : SQL에서는 사칙연산(+, -, *, /)과 나머지 연산(MOD) 사용
-- MOD(숫자, 나누는수) : 나머지
듀얼에서 10+3, 10-3, 10*3, 10/3, MOD(10,3)를 선택합니다;

--ABS(숫자) : 절대값
듀얼에서 ABS(-30.45), ABS(30.45)를 선택합니다;

--FLOOR(숫자) : 내림(작은숫자 선택)
듀얼에서 플로어(30.9999), 플로어(30.1111)를 선택합니다;
플로어(-30.9999), 플로어(-30.1111)를 듀얼에서 선택; -- -31, -31

--CEIL(숫자) : 올림(큰숫자 선택)
듀얼에서 CELI(30.9999), CELI(30.1111)을 선택합니다;
듀얼에서 CELI(-30.9999), CELI(-30.1111) 선택; -- -30, -30

--ROUND(숫자) : 반올림 - 소수점 이하 반올림
--ROUND(숫자, 자리수) : 자리수 이하 반올림 예) ROUND(95.789, 2) -> 95.79
듀얼에서 라운드(30.5), 라운드(30.4) 선택; -- 31, 30
듀얼에서 라운드(30.45, 1), 라운드(30.44, 1) 선택; --30.5 30.4
듀얼에서 라운드(30.445, 2), 라운드(30.444, 2) 선택; --30.45 30.44

--TRUNC(숫자) : 정수만 남기고, 소수부 버림
--TRUNC(숫자, 자리수) : 정수 이하 자리수까지 유지 예) TRUNC(3.141592, 2) -> 3.14
듀얼에서 Trunc(30.99), Trunc(30.59)를 선택합니다; -- 30 30
듀얼에서 Trunc(-30.99), Trunc(-30.59)를 선택합니다; -- -30 -30

듀얼에서 TRUNC(1234.123, 1), TRUNC(1234.123, 2)를 선택합니다; -- 1234.1 1234.12

--SIGN(숫자) : 부호값 반환(양수: 1, 영: 0, 음수: -1)
듀얼에서 기호(0), 기호(55), 기호(-55) 선택; --0 1 - 1

--POWER(숫자, n) : 숫자의 n제곱 값 계산(POWER(2, 3) -> 8) 
듀얼에서 파워(2,3), 파워(2,4), 파워(2,8), 파워(2,16), 파워(2,32), 파워(2,64)를 선택합니다;
듀얼에서 파워(8,1), 파워(8,2), 파워(8,3), 파워(8,4), 파워(8,16), 파워(8,32)를 선택합니다;







