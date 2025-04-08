-- SQL에서 한 줄 주석부호(--)
-- HTTP 포트 변경 : 8080 -> 8090
SELECT DBMS_XDB.getHttpPort() from dual;
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;

-- HTTP 포트 8090 변경
EXEC DBMS_XDB.setHttpPort(8090);

SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;