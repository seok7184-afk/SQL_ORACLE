SELECT * FROM tab;

DESC EMPLOYEES;

-- 직원번호가 100인 사람을 출력
SELECT * 
FROM  EMPLOYEES
WHERE EMPLOYEE_ID = 100;

-- King 이라는 직원을 출력
SELECT * 
FROM  EMPLOYEES
WHERE LAST_NAME = 'King'; -- 2

-- 월급순 내림차순으로 직원정보를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC; -- 107

-- 월급이 500 이상인 직원 정보를 출력
SELECT   EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM     EMPLOYEES
WHERE    SALARY >= 5000
ORDER BY SALARY DESC; --58

-- 전화번호에 100이 포함된 직원
SELECT   *
FROM     EMPLOYEES
WHERE    phone_number LIKE '%100%';

-- 50번 부서의 직원을 출력
SELECT   *
FROM     EMPLOYEES
WHERE    department_id = 50;

-- 부서가 없는 직원을 출력
SELECT   *
FROM     EMPLOYEES
WHERE    department_id is null;