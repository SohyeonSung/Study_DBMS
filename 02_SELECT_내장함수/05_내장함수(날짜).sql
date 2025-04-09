/* 날짜관련 내장함수
날짜값 연산가능
DATE타입 + 숫자(정수) : 숫자만큼 일자 증가
DATE타입 - 숫자(정수) : 숫자만큼 일자 감소

ADD_MONTHS(날짜, 개월수) : 개월수 만큼 월이 증가 또는 감수
LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 구하기
NEXT_DAY(날짜, 요일) : 요일 날짜 구하기, 날짜 다음에 오는 첫번째 요일날짜(일) 구하기
MONTHS_BETWEEN(날짜1, 날짜2) : 기간 구하기(개월) 연산방식(날짜1 - 날짜2)
**********************/

--날짜 데이터 타입과 숫자 연산(+, -) 연산 가능, 숫자 1은 1일(하루)를 의미
SYSDATE, SYSDATE + 1, SYSDATE - 1을 듀얼에서 선택합니다;
주문에서 주문 ID, 주문 날짜, 주문 날짜 + 1을 선택합니다;

--ADD_MONTHS(날짜, 개월수) : 개월수 만큼 월이 증가 또는 감수
듀얼에서 SYSDATE, ADD_MONGS(SYDATE, 2)를 선택합니다; -- 2 개월 후(뒤)
듀얼에서 SYSDATE, ADD_MONGS(SYDATE, -2)를 선택합니다; -- 2 개월 전(앞)

--LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 구하기
SYSDATE, LAST_DAY(SYDATE), LAST_DAY(SYDATE) + 1을 듀얼에서 선택합니다;
듀얼에서 SYSDATE, LAST_DAY(ADD_MONESS(SYDATE, -2))를 선택합니다;

--NEXT_DAY(날짜, 요일) : 요일 날짜 구하기, 날짜 다음에 오는 첫번째 요일날짜(일) 구하기
듀얼에서 SYSDATE, NEXT_DAY(SYSDATE, '화')를 선택합니다;
듀얼에서 SYSDATE, NEXT_DAY(SYSDATE, '수')를 선택합니다;
듀얼에서 SYSDATE, NEXT_DAY(SYSDATE, '토요일')를 선택합니다;

--MONTHS_BETWEEN(날짜1, 날짜2) : 기간 구하기(개월) 연산방식(날짜1 - 날짜2)
듀얼에서 SYSDATE, ADD_MONGS(SYDATE, 2), ADD_MONGS(SYDATE - 5, 2)를 선택합니다;
듀얼에서 MONGS_BETWIN(SYDATE, ADD_MONGS(SYDATE, 2))을 선택합니다; -- -2
듀얼에서 MONGS_BETE(추가_MONGS(SYDATE), 2, SYDATE)를 선택합니다; -- 2
듀얼에서 MONGS_BETWINE(추가_MONGS(SYDATE - 5, 2, SYDATE)을 선택합니다;



--============================
-- 1 : 1일 -> 24시간, 1시간 : 1일 / 24시간 --> 1시간
-- 1시간 : 60분 ---> 1시간 / 60분 ---> 1분 :::: 1 / 24 / 60 --> 1분
-- 1분 : 60초 ---> 1분 / 60초 -> 1초 :::: 1 / 24 / 60 / 60 --> 1초



