/* ** 실습문제 : HR유저(DB)에서 요구사항 해결 **********
--1) 사번(employee_id)이 100인 직원 정보 전체 보기
--2) 월급(salary)이 15000 이상인 직원의 모든 정보 보기
--3) 월급이 15000 이상인 사원의 사번, 이름(LAST_NAME), 입사일(hire_date), 월급여 정보 보기
--4) 월급이 10000 이하인 사원의 사번, 이름(LAST_NAME), 입사일, 월급여 정보 보기
---- (급여가 많은 사람부터)
--5) 이름(first_name)이 john인 사원의 모든 정보 조회
--6) 이름(first_name)이 john인 사원은 몇 명인가?
--7) 2008년에 입사한 사원의 사번, 성명('first_name last_name'), 월급여 정보 조회
---- 성명 출력예) 'Steven King'
--8) 월급여가 20000~30000 구간인 직원 사번, 성명(last_name first_name), 월급여 정보 조회
--9) 관리자ID(MANAGER_ID)가 없는 사람 정보 조회
--10) 직종(job_id)코드 'IT_PROG'에서 가장 많은 월급여는 얼마
--------------------
--11) 직종별 최대 월급여 검색
--12) 직종별 최대 월급여 검색하고, 최대 월급여가 10000이상인 직종 조회
--13) 직종별 평균급여 확인하고 8000 이상인 직종명과 평균급여
--14) 직종별 인원수, 급여합계, 평균급여, 가장 적은 급여, 가장 많은 급여를 구하시오
--15) 부서별 인원수, 급여합계, 평균급여, 가장 적은 급여, 가장 많은 급여를 구하시오
--16) 입사년도별 인원수 확인
-------
--17) 직종별 평균급여 이상인 직원을 찾아 사번, 성명, 직종, 급여, 직종별평균급여를 구하시오
---- (직종코드, 급여 순으로 정렬)
****************************/

--1) 사번(employee_id)이 100인 직원 정보 전체 보기
SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100;

-- 2) 월급(salary)이 15000 이상인 직원의 모든 정보 보기
SELECT * 
FROM EMPLOYEES
WHERE SALARY >= 15000;

--3) 월급이 15000 이상인 사원의 사번, 이름(LAST_NAME), 입사일(hire_date), 월급여 정보 보기
SELECT EMPLOYEE_ID AS 사번, 
          LAST_NAME AS 이름,
          HIRE_DATE AS 입사일,
          SALARY AS 월급여
FROM EMPLOYEES
WHERE SALARY >= 15000;

--4) 월급이 10000 이하인 사원의 사번, 이름(LAST_NAME), 입사일, 월급여 정보 보기
---- (급여가 많은 사람부터)
SELECT EMPLOYEE_ID AS 사번, 
          LAST_NAME AS 이름,
          HIRE_DATE AS 입사일,
          SALARY AS 월급여_급여순
FROM EMPLOYEES
WHERE SALARY <= 10000
ORDER BY SALARY DESC;

--5) 이름(first_name)이 john인 사원의 모든 정보 조회
SELECT * 
FROM EMPLOYEES
WHERE FIRST_NAME = 'John';

--6) 이름(first_name)이 john인 사원은 몇 명인가?
SELECT COUNT(*) AS 존은몇명인가용
FROM EMPLOYEES
WHERE FIRST_NAME = 'John';

--7) 2008년에 입사한 사원의 사번, 성명('first_name last_name'), 월급여 정보 조회  *************
---- 성명 출력예) 'Steven King'
SELECT HIRE_DATE AS 짬순,
          EMPLOYEE_ID AS 사번, 
          LAST_NAME || ' ' || FIRST_NAME AS 성명, 
          SALARY AS 월급여
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN ('2008-01-01') AND ('2008-12-31')
ORDER BY HIRE_DATE;


--8) 월급여가 20000~30000 구간인 직원 사번, 성명(last_name first_name), 월급여 정보 조회
SELECT EMPLOYEE_ID AS 사번, 
          LAST_NAME || ' ' || FIRST_NAME AS 성명, 
          SALARY AS 월급여
FROM EMPLOYEES 
WHERE SALARY BETWEEN 20000 AND 30000;

--9) 관리자ID(MANAGER_ID)가 없는 사람 정보 조회
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

--10) 직종(job_id)코드 'IT_PROG'에서 가장 많은 월급여는 얼마
SELECT MAX(SALARY) AS IT_PROG_최고급여
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--11) 직종별 최대 월급여 검색
SELECT JOB_ID AS 직종, 
          MAX(SALARY) AS 직종별_최대급여
FROM EMPLOYEES
GROUP BY JOB_ID;

--12) 직종별 최대 월급여 검색하고, 최대 월급여가 10000이상인 직종 조회
SELECT JOB_ID AS 직종, 
          MAX(SALARY) AS 직종별_최대급여
FROM EMPLOYEES
WHERE SALARY >= 10000
GROUP BY JOB_ID;

--13) 직종별 평균급여 확인하고 8000 이상인 직종명과 평균급여
SELECT JOB_ID AS 직종, 
          AVG(SALARY) AS 평균급여
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >= 8000;

--14) 직종별 인원수, 급여합계, 평균급여, 가장 적은 급여, 가장 많은 급여를 구하시오
SELECT JOB_ID AS 직종, 
          COUNT(*) AS 인원수,
          SUM(SALARY) AS 급여합계,
          AVG(SALARY) AS 평균급여,
          MIN(SALARY) AS 가장적은급여,
          MAX(SALARY) AS 가장많은급여
FROM EMPLOYEES
GROUP BY JOB_ID;

--15) 부서별 인원수, 급여합계, 평균급여, 가장 적은 급여, 가장 많은 급여를 구하시오
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID AS 부서별, 
          COUNT(*) AS 인원수,
          SUM(SALARY) AS 급여합계,
          AVG(SALARY) AS 평균급여,
          MIN(SALARY) AS 가장적은급여,
          MAX(SALARY) AS 가장많은급여
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;   

--16) 입사년도별 인원수 확인
SELECT TO_CHAR(HIRE_DATE, 'YYYY') AS 입사년도,
          COUNT(*) AS 인원수
FROM EMPLOYEES 
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY TO_CHAR(HIRE_DATE, 'YYYY');


--17) 직종별 평균급여 이상인 직원을 찾아 사번, 성명, 직종, 급여, 직종별평균급여를 구하시오
---- (직종코드, 급여 순으로 정렬)
SELECT * FROM EMPLOYEES;

-- WHERE절 --
SELECT E.EMPLOYEE_ID AS 사번,
          E.LAST_NAME || ' ' || FIRST_NAME AS 성명, 
          E.JOB_ID AS 직종,
          E.SALARY AS 급여
FROM EMPLOYEES E
WHERE SALARY >= (
          SELECT AVG(SALARY) AS 평균급여
          FROM EMPLOYEES 
          WHERE JOB_ID = E.JOB_ID)
ORDER BY JOB_ID, SALARY
;

-- FROM절(JOIN)--
SELECT E.EMPLOYEE_ID AS 사번,
          E.LAST_NAME || ' ' || FIRST_NAME AS 성명, 
          E.JOB_ID AS 직종,
          E.SALARY AS 급여,
          R.AVG_SALARY AS 직종평균급여
FROM EMPLOYEES E 
        JOIN (
                 SELECT JOB_ID,
                           AVG(SALARY) AS AVG_SALARY
                  FROM EMPLOYEES
                  GROUP BY JOB_ID
                 ) R ON E.JOB_ID = R.JOB_ID
WHERE E.SALARY >= R.AVG_SALARY
ORDER BY E.JOB_ID, E.SALARY;


-- FROM절--
SELECT E.EMPLOYEE_ID AS 사번,
          E.LAST_NAME || ' ' || FIRST_NAME AS 성명, 
          E.JOB_ID AS 직종,
          E.SALARY AS 급여,
          R.AVG_SALARY AS 직종평균급여
FROM EMPLOYEES E,
         (SELECT JOB_ID,
                    AVG(SALARY) AS AVG_SALARY
          FROM EMPLOYEES
          GROUP BY JOB_ID) R
WHERE E.SALARY >= R.AVG_SALARY
    AND E.JOB_ID = R.JOB_ID
ORDER BY E.JOB_ID, E.SALARY;


            
        
