SELECT * FROM tab;  -- 테이블 목록 조회

/*
SELECT    칼럼이름1  별칭1,
 FROM     테이블명
 WHERE    조건
 ORDER BY 정령할 칼럼1 ASC, 정령할 칼럼1 DESC;
 */
 
 -- 직원이름 성과 이름을 붙여서 출력
 SELECT    FIRST_NAME, LAST_NAME,
           FIRST_NAME || ' ' || LAST_NAME EMPNAME
  FROM     EMPLOYEES
  ORDER BY 3  --3번째 칼럼을 기준으로
  ;
  
   -- 부서번호가 60인 직원
   -- 조건 =, !=(<>, ^=)
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES
  WHERE    DEPARTMENT_ID = 60
  ORDER BY EMPLOYEE_ID ASC;
  
    -- 부서번호가 90인 직원
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES
  WHERE    DEPARTMENT_ID = 90
  ORDER BY EMPLOYEE_ID ASC;
  
    -- 부서번호가 60, 90인 직원
SELECT     E.EMPLOYEE_ID   번호,
           E.FIRST_NAME || ' ' || E.LAST_NAME 이름,
           E.EMAIL         이메일,
           E.DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES E
  WHERE    DEPARTMENT_ID = 60
  OR       DEPARTMENT_ID = 90
  ORDER BY 번호 ASC;
 
 -- IN 명령어 
  SELECT   E.EMPLOYEE_ID   번호,
           E.FIRST_NAME || ' ' || E.LAST_NAME 이름,
           E.EMAIL         이메일,
           E.DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES E
  WHERE    DEPARTMENT_ID IN (90, 60, 80)
  ORDER BY 부서번호 ASC, 이름 ASC; 
  -- 부서번호순, 부서번호가 같으면 이름순
  
  
  -- 1. 월금이 12000 이상인 직원의 번호, 이름, 이메일, 월급을 월급순으로 출력
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           SALARY        월급
  FROM     EMPLOYEES
  ORDER BY 월급 DESC;
  -- 2. 월금이 10000 ~ 15000 인 직원의 사번, 이름, 월급, 부서번호
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           SALARY        월급,
           DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES
  WHERE    SALARY >= 10000 -- BETWEEN 10000 AND 15000
  AND      SALARY <= 15000
  ORDER BY 월급 DESC;
  
  -- 3. 직업 ID가 IT_PROG 인 직원 명단
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           DEPARTMENT_ID 부서번호,
           JOB_ID        직업아이디
  FROM     EMPLOYEES
  WHERE    JOB_ID = 'IT_PROG'
  ORDER BY EMPLOYEE_ID ASC;
  
  -- 3 - 2) UPPER() LOWER() INITCAP() 함수
  SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           DEPARTMENT_ID 부서번호,
           JOB_ID        직업아이디
  FROM     EMPLOYEES
  WHERE    LOWER(JOB_ID) = 'it_prog'
  ORDER BY EMPLOYEE_ID ASC;
  
  -- 4. 직원이름이 GRANT 인 직원
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           EMAIL         이메일,
           DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES
  WHERE    UPPER(FIRST_NAME) LIKE '%GRANT%'
  OR       UPPER(LAST_NAME)  LIKE '%GRANT%'
  ORDER BY EMPLOYEE_ID ASC;
  
  -- 5. 사번, 월급, 10% 인상한 월급
SELECT     EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           SALARY          월급,
           SALARY * 1.1    인상월급
  FROM     EMPLOYEES
  ORDER BY EMPLOYEE_ID ASC;
  
  -- 6. 50번 부서의 직원명단, 월급, 부서번호
  SELECT   EMPLOYEE_ID   번호,
           FIRST_NAME || ' ' || LAST_NAME 이름,
           SALARY        월급,
           DEPARTMENT_ID 부서번호
  FROM     EMPLOYEES
  WHERE    DEPARTMENT_ID = 50
  ORDER BY EMPLOYEE_ID ASC;
  
  -- 7. 20,80,60,90번 부서의 직원명단, 월급, 부서번호
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          SALARY         월급,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    DEPARTMENT_ID IN (20,80,60,90)
 ORDER BY 부서번호 ASC, 이름 ASC;
 
 -- 중요 데이터를 2개 입력
 -- 전체 자료수 
SELECT    COUNT(*)
 FROM      EMPLOYEES; -- 107 ROW 의 COUNT
 
SELECT SYSDATE
 FROM  DUAL;  -- 오늘의 날짜: 연월일시분초
 
 -- 신입사원 입사 (박보검, 장원영)
INSERT    INTO   EMPLOYEES
 VALUES   (207, '보검', '박', 'BOGEOM', '1.650.555.8888', SYSDATE, 
          'IT_PROG', NULL, NULL, NULL, NULL);
          
INSERT    INTO   EMPLOYEES
 VALUES   (208, '원영', '장', 'ONENYOUNG', '1.650.555.9999', SYSDATE, 
          'IT_PROG', NULL, NULL, NULL, NULL);
          
UPDATE  EMPLOYEES
 SET    EMAIL        =  'JWY',
        PHONE_NUMBER = '010-1234-5678'
 WHERE  EMPLOYEE_ID  = 208;
          
SELECT *  FROM EMPLOYEES;
SELECT COUNT(*)  FROM EMPLOYEES; --109

COMMIT;
ROLLBACK;

 -- 8. 보너스 없는 직원명단(COMMISSION_PCT가 없다)
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          COMMISSION_PCT 보너스,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    COMMISSION_PCT IS NULL
 ORDER BY employee_id ASC;
 
 -- 9. 전화번호가 010으로 시작하는 것
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          PHONE_NUMBER   전화번호,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    PHONE_NUMBER LIKE '010%'
 ORDER BY employee_id ASC;
 
 -- 9-2. 전화번호가 010으로 시작하는 것
 -- PATTERN MATCHING
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          PHONE_NUMBER   전화번호
 FROM     EMPLOYEES
 WHERE    PHONE_NUMBER LIKE '%555'
 ORDER BY employee_id ASC;
 
 -- 10. LAST_NAME 세번째, 네번째 글자가 LL인 것
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    UPPER(LAST_NAME) LIKE '__LL%'
 ORDER BY employee_id ASC;
 
 -- 11. 입사년월이 17년 2월인 사원출력
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          HIRE_DATE      입사년월,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    HIRE_DATE 
  BETWEEN '2017-02-01'
  AND     LAST_DAY('2017-02-01')
 ORDER BY employee_id ASC;

-- 오늘 날짜를 정확히 
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';

SELECT SYSDATE FROM DUAL;
SELECT 7/2     FROM DUAL;
SELECT 0/2     FROM DUAL;
SELECT 2/0.0   FROM DUAL;
SELECT SYSTIMESTAMP   FROM DUAL;

-- 크리스마스와 오늘날짜의 차이
SELECT TO_DATE('26/12/25') - SYSDATE
 FROM DUAL;

-- 소수이하 3자리로 반올림: ROUND(VAL, 3)
-- 소수이하 3자리로 절사  : TRUNC(VAL, 3)
SELECT  SYSDATE, ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH')
 FROM DUAL;
 
SELECT  NEXT_DAY(SYSDATE, '월요일') FROM DUAL; -- 다음 월요일이 언제
SELECT  TRUNC(SYSDATE, 'MONTH') FROM DUAL; -- 해당월 첫번째 날
SELECT  LAST_DAY(SYSDATE) FROM DUAL; -- 해당월 마지막 날

 
 -- 12. '17/02/07'에 입사한 사람출력
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          HIRE_DATE      입사년월,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    HIRE_DATE = '2017/02/07'
 ORDER BY employee_id ASC;
 
 -- 12-2. '12/06/07'에 입사한 사람출력
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          HIRE_DATE      입사년월,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    HIRE_DATE = '2012/06/07'
 ORDER BY employee_id ASC;
 
 -- 13. 오늘 입사한 사람
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          HIRE_DATE      입사년월,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    '2026-04-07 00:00:00' <= HIRE_DATE
 AND      HIRE_DATE <= '2026-04-07 23:59:59'
 ORDER BY employee_id ASC;
 
 -- TYPE 변환
 -- TO_DATE(문자) -> 날짜
 -- TO_NUMBER(문자) -> 숫자
 -- TO_CHAR(숫자, '') -> 글자
 -- TO_CHAR(날짜, '') -> 날짜 형태의 문자
 -- FORMAT : YYYY-MM-DD HH24:MI:SS DAY AM
    -- YYYY : 연도
    -- MM   : 월
    -- DD   : 일
    -- HH24 : 시 /  MI : 분  / SS : 초
    -- DAY  : 요일 , 일요일
    -- DY   : 요일 , 일
    -- AM/PM   : 오전/ 오후


  -- 14. 화요일 입사자를 출력
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          TO_CHAR(HIRE_DATE, 'YYYY-MM-DD'),
          TO_CHAR(HIRE_DATE, 'DY')
 FROM     EMPLOYEES
 WHERE    TO_CHAR(HIRE_DATE, 'DY') = '화'
 ORDER BY HIRE_DATE ASC;
  
  -- 15. 입사 후 일주일 이내인 직원명단
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          HIRE_DATE      입사년월,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    TRUNC(SYSDATE) - TRUNC(HIRE_DATE) <= 7
 ORDER BY employee_id ASC;
 
  -- 16. 8월 입사자의 사번, 이름, 입사일 입사일순으로
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          TO_CHAR(HIRE_DATE, 'YYYY-MM-DD'),
          TO_CHAR(HIRE_DATE, 'MM')
 FROM     EMPLOYEES
 WHERE    TO_CHAR(HIRE_DATE, 'MM') = 8
 ORDER BY HIRE_DATE ASC;
 
  -- 17. 부서번호 80이 아닌 직원
SELECT    EMPLOYEE_ID    번호,
          FIRST_NAME || ' ' || LAST_NAME 이름,
          HIRE_DATE      입사년월,
          DEPARTMENT_ID  부서번호
 FROM     EMPLOYEES
 WHERE    DEPARTMENT_ID != 80
 ORDER BY DEPARTMENT_ID ASC;
 
 -- 18. 2026년 04월 07일 10시 05분 04초 오전 수요일
 -- 한자로 출력
 SELECT TO_CHAR(
 TO_DATE('2026-04-07 10:05:04', 'YYYY-MM-DD HH24:MI:SS'), 
 'YYYY"年" MM"年" DD"日" AM HH"時" MI"分" SS"秒"')
 FROM DUAL;
 
 -----어제입사 직원
SELECT EMPLOYEE_ID , HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = '15/09/21';           -- 명령 실행 전 !


ALTER SESSION SET NLS_DATE_FORMAT = "YYYY-MM-DD HH24:MI:SS";    -- 이 설정을 하면 이 출력을해야함 !!

SELECT EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = '2014-02-17';         -- 명령 실행 후 !



--------------------------------------------------------------------------------------------
------------------------앞으로 날짜 표현은 다음과 같이 표현하자!!---------------------------
SELECT  EMPLOYEE_ID, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')
FROM    EMPLOYEES
WHERE   TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') = '2026-04-07'; 
--------------------------------------------------------------------------------------------


-- 입사후 일주일 이내인 직원명단
SELECT      EMPLOYEE_ID, TO_DATE(HIRE_DATE, 'YYYY-MM-DD')
FROM        EMPLOYEES
WHERE       HIRE_DATE >= SYSDATE - 7
;

--08월 입사자의 사번, 이름, 입사일을 입사일 순으로
SELECT  EMPLOYEE_ID                      "사 번",      
        FIRST_NAME||' '||LAST_NAME       이름,
        TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') 입사일
FROM    EMPLOYEES
WHERE   TO_CHAR(HIRE_DATE, 'MM') = '08'               
ORDER BY 입사일 ASC
;                           

-- 부서번호 80 이 아닌 직원
SELECT      EMPLOYEE_ID, DEPARTMENT_ID
FROM        EMPLOYEES
WHERE       DEPARTMENT_ID <> 80     --   != 같지 않다   
ORDER BY    EMPLOYEE_ID ASC
;

-- =, <>, >, >=, <, <=, BETWEEN ~AND
-- +, -, *, /, MOD(7, 2) 


--  /* 직원사번, 입사일*/ 2026년 04월 07일 10시 05분 04초 오전 수요일 -> 한자로 출력하기  日, 月, 火, 水, 木, 金, 土
-- 午前   午後 日 月 火 水 木 金 土 年 月 日 時 分 秒 曜日
SELECT  SYSDATE,
        TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS DAY AM'),
        TO_CHAR(SYSDATE, 'AM')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY') || '年 '
    || TO_CHAR(SYSDATE, 'MM') || '月 '
    || TO_CHAR(SYSDATE, 'DD') || '日 '
    || TO_CHAR(SYSDATE, 'HH12') || '時 '
    || TO_CHAR(SYSDATE, 'MI') || '分 '
    || TO_CHAR(SYSDATE, 'SS') || '秒 '
    || CASE TO_CHAR(SYSDATE, 'DY') 
        WHEN '일'  THEN  '日'     
        WHEN '월'  THEN  '月'
        WHEN '화'  THEN  '火'
        WHEN '수'  THEN  '水'
        WHEN '목'  THEN  '木'
        WHEN '금'  THEN  '金'
        WHEN '토'  THEN  '土'
        END                     || '曜日 '
    || DECODE(TO_CHAR(SYSDATE, 'AM'), '오전', '午前', '午後')
 FROM DUAL;

-- 1) TO_CHAR 활용
SELECT  SYSDATE,
        TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS DAY AM') 날짜1,               -- 아무FORMAT안했을때
--      TO_CHAR(SYSDATE, 'YYYY년 MM월 DD일  HH24시MI분SS초 DAY AM') 날짜2,    -- ORA-01821 : 날짜 형식이 부적합합니다.
        TO_CHAR(SYSDATE, 'YYYY"年" MM"月" DD"日"  HH24"時"MI"分"SS"秒" DAY AM') 날짜2,
        TO_CHAR(SYSDATE, 'AM')
FROM DUAL;

-- 2) IF를 구현    
-- 2-1) NVL(), NVL2()   
        --  사번, 이름, 월급, COMMISSION_PCT( NULL -> 0으로 출력 )
SELECT  EMPLOYEE_ID                 사번, 
        FIRST_NAME||' '||LAST_NAME  이름, 
        SALARY                      월급,
        NVL(COMMISSION_PCT,0)       보너스  ---> NVL(COMMISSION_PCT가 NULL이면 0을 찍는다)
FROM    EMPLOYEES
;

SELECT  EMPLOYEE_ID                 사번, 
        FIRST_NAME||' '||LAST_NAME  이름, 
        SALARY                      월급,
        NVL2(COMMISSION_PCT,            SALARY + (SALARY * COMMISSION_PCT), SALARY)       보너스  
    --> NVL2( NULL인지 아닌지 검사할 대상, VALUE_IF_NOT_NULL              ,VALUE_IF_NULL)

FROM    EMPLOYEES
;


-- 2-2) NULLIF()       둘을 비교해서 같으면 NULL, 다르면 EXPR1

-- 2-3) DECODE(expr, search1, result1,
--                   search2, result2,
--                   …, 
--                   default)
/*
DECODE는       expr과 search1을 비교해 두 값이 같으면 result1을, 
      ELSE 다시 search2와 비교해 값이 같으면 result2를 반환하고, 
          계속 비교한 뒤 같은 값이 없으면 default 값을 반환한다.
*/
-- 사번, 부서번호(단 부서번호가 NULL이면 '부서없음')
SELECT  EMPLOYEE_ID                                         사번,
        --NVL(DEPARTMENT_ID,'부서없음')       부서번호
        DECODE(DEPARTMENT_ID,NULL,'부서없음',DEPARTMENT_ID) 부서번호
FROM    EMPLOYEES 
;

-- 午前   午後 日 月 火 水 木 金 土 年 月 日 時 分 秒 曜日
SELECT  TO_CHAR(SYSDATE, 'AM'),
        DECODE(TO_CHAR(SYSDATE, 'AM'),'오전','午前','午後')
FROM DUAL;

---------------------------------------------------------------

-- DECODE로
-- 사번 , 이름, 부서명(DEPARTMENTS 표 안에있는 DEPARTMENT_NAME
SELECT  DEPARTMENT_ID                       사번,
        FIRST_NAME||' '||LAST_NAME          이름,
        DECODE(DEPARTMENT_ID, 60, 'IT',
                              90, 'Executive',
                              80, 'Sales'
                                , '그 외'
        )                                   부서명
FROM    EMPLOYEES
;

-- GREATEST 문법 해보세용~~: https://thebook.io/006696/0118/

-- 사번, 이름, 부서명 : 모든 부서명, NULL : 부서없음
SELECT  EMPLOYEE_ID                                 사번,
        FIRST_NAME||' '||LAST_NAME                  이름,
        DECODE(DEPARTMENT_ID, 10,'Administration'
                            , 20,'Marketing'
                            , 30,'Purchasing'
                            , 40,'Human Resources'
                            , 50,'Shipping'
                            , 60,'IT'
                            , 70,'Public Relations'
                            , 80,'Sales'
                            , 90,'Executive'
                            , 100,'Finance'
                            , 110,'Accounting'
                                 ,'부서없음'
        )                                           부서명  
FROM    EMPLOYEES
;

--NULL이 계산에 포함되면 결과는 NULL
-- 직원명단, 직원의 월급, 보너스 출력 -> 연봉출력    ->F5로
SELECT  EMPLOYEE_ID                                         사번,
        FIRST_NAME||' '||LAST_NAME                          이름,
        SALARY                                      "직원의 월급",
        NVL(SALARY*COMMISSION_PCT,0)                     "보너스",
        SALARY * 13 + SALARY*COMMISSION_PCT                 "연봉",
        SALARY * 13 + NVL(SALARY*COMMISSION_PCT,0)     "연봉출력"
FROM EMPLOYEES
;


-- 3) CASE WHEN THEN END
--WHEN 점수 BETWEEN 90 AND 100      THEN 'A'
--WHEN 90 < = 점수 AND 점수 <= 100 THEN 'A'


-- 사번 , 이름, 부서명
SELECT  EMPLOYEE_ID                     사번,
        FIRST_NAME||' '||LAST_NAME      이름, 
        CASE DEPARTMENT_ID
            WHEN    60  THEN    'IT'
            WHEN    80  THEN    'Sales'
            WHEN    90  THEN    'Executive'
            ELSE                '그외'
        END                             부서명
FROM    EMPLOYEES
;

----------
SELECT  EMPLOYEE_ID                  사번,
        FIRST_NAME||' '||LAST_NAME   이름, 
        CASE 
            WHEN    DEPARTMENT_ID = 60  THEN    'IT'
            WHEN    DEPARTMENT_ID = 80  THEN    'Sales'
            WHEN    DEPARTMENT_ID = 90  THEN    'Executive'
            ELSE                                '그외'        --순서대로 출력됨
        END                          부서명
FROM    EMPLOYEES
;

/*
 집계함수 : AGGREGATE 함수
 모든 집계함수는 NULL 값을 포함하지 않는다
 SUM(), AVG(), MIN(), MAX(), COUNT(), STDDEV(), VARIANCE()
 합계,  평균,  최소,  최대,  줄수,    표준편차,  분산
 그루핑 : GROUP BY
 ~별 인원수
*/
SELECT *                    FROM EMPLOYEES;            --모두 출력
SELECT COUNT(*)             FROM EMPLOYEES;            --COUNT(*)      : 109 : ROW 줄 수 
SELECT COUNT(EMPLOYEE_ID)   FROM EMPLOYEES;            --COUNT(어쩌고) : 109 
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES;            --COUNT(어쩌고) : 106  -> NULL이 빠져서 -->

SELECT COUNT(EMPLOYEE_ID)   FROM EMPLOYEES
 WHERE DEPARTMENT_ID        IS NULL;                   -- 3 출력
SELECT EMPLOYEE_ID          FROM EMPLOYEES
 WHERE DEPARTMENT_ID        IS NULL;                   -- 3명의 EMPLOYEE_ID 출력


-- 전체 직원의 월급 합
SELECT COUNT(SALARY)        FROM EMPLOYEES;            --COUNT(SALARY) :     107
SELECT SUM(SALARY)          FROM EMPLOYEES;            --SUM(SALARY)   :  691416    결과값 한줄
SELECT AVG(SALARY)          FROM EMPLOYEES;            --AVG(SALARY)   :  6461.~
SELECT MAX(SALARY)          FROM EMPLOYEES;            --MAX(SALARY)   :   24000    결과값 한줄
SELECT MIN(SALARY)          FROM EMPLOYEES;            --MIN(SALARY)   :    2100    결과값 한줄

SELECT SUM(SALARY) / COUNT(SALARY) FROM EMPLOYEES;      --6461.831775700934579439252336448598130841
SELECT SUM(SALARY) / COUNT(*)      FROM EMPLOYEES;      --6343.266055045871559633027522935779816514  =>NULL 때문에

-- 60번 부서의 평균월급  => 5760
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE   DEPARTMENT_ID = 60
;
-- EMPLOYEES 테이블의 부서수를 알고 싶다   =>106
SELECT  COUNT(DEPARTMENT_ID)
FROM    EMPLOYEES
;

-- 중복을 제거(DISTINCT)한 부서의 수를 출력
-- 중복을 제거 한 부서 번호 LIST      : NULL 출력(O)
SELECT  DISTINCT(DEPARTMENT_ID)        
FROM    EMPLOYEES       
;
-- 중복을 제거 한 부서 번호 LIST의 수 : NULL 출력(X)  
SELECT  COUNT(DISTINCT(DEPARTMENT_ID))
FROM    EMPLOYEES       
;

-- 직원이 근무하는 부서의 수: 부서장이 있는 부서 수: DEPARTMENTS
SELECT COUNT(DISTINCT DEPARTMENT_ID)
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL;
 
SELECT COUNT(*)
 FROM DEPARTMENTS
 WHERE MANAGER_ID IS NOT NULL;

-- 직원 수, 월급합, 월급평균, 최대월급, 최소월급
SELECT COUNT(EMPLOYEE_ID) 직원수,
       SUM(SALARY) 월급합,
       ROUND(AVG(SALARY),3) 월급평균,
       MAX(SALARY) 최대월급,
       MIN(SALARY) 최소월급
FROM EMPLOYEES;

--
SELECT 7 / 2,
       ROUND(156.456,2),  ROUND(156.456,-2),
       TRUNC(156.456,2),  TRUNC(156.456,-2)
FROM DUAL;

-----------------------------------------------
SQL 문의 실행순서
1. FROM
2. WHERE
3. SELECT
4. ORDER BY
-- 부서 60번 부서 인원수, 월급 합, 월급 평균
SELECT COUNT(DEPARTMENT_ID)    부서인원수,
       SUM(SALARY) 월급합,
       AVG(SALARY) 월급평균
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60;

-- 부서 50, 60, 80번 부서가 아닌 인원수, 월급합, 월급평균
SELECT  COUNT(*)  인원수,
        SUM(SALARY)           월급합,
        AVG(SALARY)           월급평균
 FROM   EMPLOYEES
 WHERE  DEPARTMENT_ID != 50
 AND    DEPARTMENT_ID != 60
 AND    DEPARTMENT_ID != 80
 -- DEPARTMENT_ID NOT IN (50, 60 ,80)
 -- OR     DEPARTMENT_ID IS NULL;
 
 -------------------------------------------
 부서별 사원수
SELECT  DEPARTMENT_ID      부서번호,
         COUNT(EMPLOYEE_ID) 사원수
 FROM    EMPLOYEES;
 -- ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
 
SELECT    DEPARTMENT_ID      부서번호,
          COUNT(EMPLOYEE_ID) 사원수
 FROM     EMPLOYEES
 -- WHERE
 GROUP BY ROLLUP(DEPARTMENT_ID)
 -- HAVING
 ORDER BY DEPARTMENT_ID;
 
 -- 부서별 월급합, 월급평균 
SELECT    DEPARTMENT_ID         부서번호,
          SUM(SALARY)           월급합,
          ROUND(AVG(SALARY), 2) 월급평균
 FROM     EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID;
 
 -- 부서별 사원수 통계
SELECT    DEPARTMENT_ID         부서번호,
          COUNT(EMPLOYEE_ID)  사원수
 FROM     EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID;
 
 -- 부서별 인원수, 월급합
SELECT    DEPARTMENT_ID         부서번호,
          COUNT(EMPLOYEE_ID)    사원수,
          SUM(SALARY)           월급합
 FROM     EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID;
 
 -- 부서별 인원수가 5명 이상인 부서번호
SELECT    DEPARTMENT_ID         부서번호,
          COUNT(EMPLOYEE_ID)  사원수
 FROM     EMPLOYEES
 GROUP BY DEPARTMENT_ID
  HAVING  COUNT(DEPARTMENT_ID) >= 5
 ORDER BY DEPARTMENT_ID;
 
 -- 부서별 월급총계가 20000이상인 부서번호
SELECT    DEPARTMENT_ID         부서번호,
          COUNT(EMPLOYEE_ID)  사원수,
          SUM(SALARY)           월급합
 FROM     EMPLOYEES
 GROUP BY DEPARTMENT_ID
  HAVING  SUM(SALARY) >= 20000
 ORDER BY DEPARTMENT_ID;
 
 -- JOB_ID 별 인원수
SELECT    JOB_ID         직업코드,
          COUNT(EMPLOYEE_ID)  사원수
 FROM     EMPLOYEES
 GROUP BY JOB_ID
 ORDER BY JOB_ID;
 
 -- JOB_TITLE 별 인원수(DECODE, CASE)
 
 -- 입사일기준 월별 인원수, 2017년 기준
SELECT    TO_CHAR(HIRE_DATE, 'MM') 입사월,
          COUNT(EMPLOYEE_ID)  사원수
 FROM     EMPLOYEES
 WHERE    TO_CHAR(HIRE_DATE, 'YYYY') = '2017'
 GROUP BY TO_CHAR(HIRE_DATE, 'MM')
 ORDER BY TO_CHAR(HIRE_DATE, 'MM');
 
 -- 부서별 최대월급이 14000 이상인 부서의 부서번호, 최대월급
SELECT    DEPARTMENT_ID         부서번호,
          COUNT(EMPLOYEE_ID)    사원수,
          MAX(SALARY)           최대월급
 FROM     EMPLOYEES
 GROUP BY DEPARTMENT_ID
  HAVING  MAX(SALARY) >= 14000
 ORDER BY DEPARTMENT_ID;
 
 -- 부서별 모으고 같은 부서는 직업별 인원수, 월급평균
SELECT     DECODE(DEPARTMENT_ID,
                   10, 'Administration',
                   20, 'Marketing',
                   30, 'Purchasing',
                   40, 'Human Resources',
                   50, 'Shipping',
                   60, 'IT',
                   70, 'Public Relations',
                   80, 'Sales',
                   90, 'Executive',
                   100, 'Finance',
                   110, 'Accounting',
                   120, 'Treasury',
                   130, 'Corporate Tax',
                   140, 'Control And Credit',
                   150, 'Shareholder Services',
                   160, 'Benefits',
                   170, 'Manufacturing',
                   180, 'Construction',
                   190, 'Contracting',
                   200, 'Operations',
                   210, 'IT Support',
                   220, 'NOC',
                   230, 'IT Helpdesk',
                   240, 'Government Sales',
                   250, 'Retail Sales',
                   260, 'Recruiting',
                   270, 'Payroll') 부서이름,
           CASE JOB_ID    -- JOB_TITLE
                WHEN 'AD_PRES'    THEN 'President'
                WHEN 'AD_VP'      THEN 'Administration Vice President'
                WHEN 'AD_ASST'    THEN 'Administration Assistant'
                WHEN 'FI_MGR'     THEN 'Finance Manager'
                WHEN 'FI_ACCOUNT' THEN 'Accountant'
                WHEN 'AC_MGR'     THEN 'Accounting Manager'
                WHEN 'AC_ACCOUNT' THEN 'Public Accountant'
                WHEN 'SA_MAN'     THEN 'Sales Manager'
                WHEN 'SA_REP'     THEN 'Sales Representative'
                WHEN 'PU_MAN'     THEN 'Purchasing Manager'
                WHEN 'PU_CLERK'   THEN 'Purchasing Clerk'
                WHEN 'ST_MAN'     THEN 'Stock Manager'
                WHEN 'ST_CLERK'   THEN 'Stock Clerk'
                WHEN 'SH_CLERK'   THEN 'Shipping Clerk'
                WHEN 'IT_PROG'    THEN 'Programmer'
                WHEN 'MK_MAN'     THEN 'Marketing Manager'
                WHEN 'MK_REP'     THEN 'Marketing Representative'
                WHEN 'HR_REP'     THEN 'Human Resources Representative'
                WHEN 'PR_REP'     THEN 'Public Relations Representative'
           END    직업이름,
           COUNT(JOB_ID)         업무별인원, 
           ROUND(AVG(SALARY), 2) 월급평균
 FROM      EMPLOYEES
 -- GROUP BY  ROLLUP(DEPARTMENT_ID, JOB_ID) : 부서번호별 서브토탈
 GROUP BY  CUBE(DEPARTMENT_ID, JOB_ID) -- 담당업무별 평균도
 ORDER BY  DEPARTMENT_ID, JOB_ID;
 
 
 
  