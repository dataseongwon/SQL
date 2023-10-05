
-- 2. SELECT 구문----------------------------------------------------------------
-- 1) 칼럼 조회
SELECT CUSTOMERNUMBER
FROM classicmodels.customers;

-- 2) 칼럼조회를 통한 간단한 계산
-- COUNT, SUM, AVG 등
SELECT SUM(AMOUNT),
COUNT(CHECKNUMBER)
FROM CLASSICMODELS.PAYMENTS;

-- 3)컬럼을 여러개 조회하고 싶을때
-- 모두 조회 : "*"  / 특정 열 : ","으로 구분
-- 실제로는 전체 테이블을 불러오면 시간이 매우 오래걸리기 때문에, 데이터 정의서를 보고 미리 파악한 후 필요한 데이터 호출
SELECT *
FROM classicmodels.products;

SELECT PRODUCTNAME, PRODUCTLINE
FROM classicmodels.products;

-- 4) 특정 칼럼명을 변경해서 조회
-- AS를 입력하지 않아도 변경된다는 점도 확인 가능
select COUNT(productCode) AS N_PRODUCTS,
COUNT(productCode) N_PRODUCTS
FROM CLASSICMODELS.PRODUCTS;

-- 5) DISTINCT
-- 중복을 제외하고 데이터 조회
SELECT DISTINCT ordernumber
FROM CLASSICMODELS.ORDERDETAILS;

-- 3. FROM 구문----------------------------------------------------------------
-- FROM DB명. 테이블명 을 사용하지 않고
-- USE DB명; 을 미리 선언해준 후 FROM TABLE명 만 사용가능하다.
SELECT DISTINCT ordernumber
FROM CLASSICMODELS.ORDERDETAILS;

USE CLASSICMODELS;
SELECT DISTINCT ordernumber
FROM ORDERDETAILS;

-- 4. WHERE 구문----------------------------------------------------------------
-- 조건문 생성
-- EX) 미국에서 판매되고있는 상품코드를 주세요.
-- SELECT 상품 번호
-- FROM DB명.테이블명
-- WHERE 판매 국가 = '미국';

-- 1) BETWEEN 구문
-- WHERE 칼럼명 BETWEEN 시작점 AND 끝점
-- 이상, 이하를 나타냄
USE CLASSICMODELS;
SELECT *
FROM ORDERDETAILS
WHERE PRICEEACH BETWEEN 30 AND 50;

-- 2) 대소관계표현
-- 부등호를 사용 , 같지 않다 : <>

SELECT *
FROM ORDERDETAILS
WHERE PRICEEACH >=30;

-- 3) IN
-- EX) 미국과 영국에서 출시된 상품 번호 전달 부탁드립니다
-- 문자형 데이터는 ''을 씌워주고 숫자형 데이터는 그대로 사용하면 됨
SELECT 칼럼 명
FROM 테이블 명
WHERE 칼럼명 IN (미국, 영국);

SELECT CUSTOMERNUMBER
FROM CUSTOMERS
WHERE COUNTRY IN ('USA', 'CANADA');

-- 4) NOT IN
-- IN과 반대
SELECT CUSTOMERNUMBER
FROM CUSTOMERS
WHERE COUNTRY NOT IN ('USA', 'CANADA');

-- 5) IS NULL
-- 특정 데이터가 NULL값인 것에 대해 연산 가능

SELECT EMPLOYEENUMBER
FROM EMPLOYEES
WHERE REPORTSTO IS NULL;

-- IS NOT NULL 도 가능
SELECT EMPLOYEENUMBER
FROM EMPLOYEES
WHERE REPORTSTO IS NOT NULL;

-- 6) LIKE '%TEXT%'
-- 특정 데이터에 TEXT가 포함되어있는 경우를 출력 가능
SELECT ADDRESSLINE1
FROM CUSTOMERS
WHERE ADDRESSLINE1 LIKE '%ST%';

SELECT ADDRESSLINE1
FROM CUSTOMERS
WHERE ADDRESSLINE1 LIKE '%ST'; -- %자체가 문제를 의미해서 다음과 같은 경우는 끝이 ST로 끝나는 경우를 조회

-- 5. GROUPBY 구문----------------------------------------------------------------
-- 특정 속성을 통해 데이터를 묶음
SELECT COUNTRY, CITY, COUNT(CUSTOMERNUMBER) N_CUSTOMERS
FROM CUSTOMERS
GROUP BY COUNTRY, CITY;
-- CASE WHEN : IF 문과 같음
-- EX) USA거주자의 수를 계산하고 그 비중을 구하세요.
SELECT SUM(CASE WHEN COUNTRY = 'USA' THEN 1 ELSE 0 END) N_USA, -- USA 면 1, 아니면 0으로 하여서 그 합을 계산
SUM(CASE WHEN COUNTRY = 'USA' THEN 1 ELSE 0 END) / COUNT(*) USA_PORTION -- 같은 방식을 적용하고 전체를 카운트한 갯수로 나누어 비율 계산
FROM CUSTOMERS;

-- 6. JOIN구문----------------------------------------------------------------
-- 실무에서는 ERD그림을 보면서 어떻게 JOIN할 것인지 계획을 짬alter
-- 1) LEFT JOIN(LEFT OUTER JOIN)
-- 레프트 조인은 특정 테이블 정보를 기준으로 타 테이블을 결합
-- A테이블 정보 + A테이블과 겹치는 B테이블의 정보만을 남김
-- 아래 코드에서  A와 B는 각각의 테이블의 별칭을 나타냄
-- ORDER에 존재하는 모든 고객번호에 대한 자료가 나옴.
SELECT A.ORDERNUMBER, B.COUNTRY
FROM ORDERS A
LEFT
JOIN CUSTOMERS B
ON A.CUSTOMERNUMBER = B.CUSTOMERNUMBER;

SELECT A.ORDERNUMBER, B.COUNTRY
FROM ORDERS A
LEFT
JOIN CUSTOMERS B
ON A.CUSTOMERNUMBER = B.CUSTOMERNUMBER
WHERE B.COUNTRY = 'USA';

-- 2) INNER JOIN 
-- 두 테이블에서 공통으로 존재하는 정보만 남는 방법.
-- ORDERS와 CUSTOMERS에 공통적으로 존재하는 고객번호만 남음.
SELECT A.ORDERNUMBER, B.COUNTRY
FROM ORDERS A
INNER
JOIN CUSTOMERS B
ON A.CUSTOMERNUMBER = B.CUSTOMERNUMBER
WHERE B.COUNTRY = 'USA';

-- 3) FULL JOIN
-- 두 테이블에 매칭되는 모든 정보를 가져옴.


-- 7. CASE WHEN구문----------------------------------------------------------------
-- 조건에 따라 출력값을 다르게 입력하고 싶을 때
-- EX) 고객 정보 테이블에서 고객명과 고객 연령대(10세단위)를 출력해주세요.
SELECT CASE WHEN 조건1 THEN 결과1
WHEN 조건2 THEN 결과2 ELSE 결과3 END
FROM DB명.테이블명;

-- 나라 이름과 북미여부에 대한 출력
SELECT COUNTRY,
CASE WHEN COUNTRY IN ('Canada','USA') THEN '북미'
ELSE '비북미' END AS REGOIN
FROM CUSTOMERS;

-- 북미 비북미 고객의 수 카운팅
SELECT CASE WHEN COUNTRY IN ('Canada','USA') THEN '북미'
ELSE '비북미' END AS REGOIN,
COUNT(CUSTOMERNUMBER) N_CUSTOMERS
FROM CUSTOMERS
GROUP
BY CASE WHEN COUNTRY IN ('Canada', 'USA') THEN '북미'
ELSE '비북미' END;

SELECT CASE WHEN COUNTRY IN ('Canada','USA') THEN '북미'
ELSE '비북미' END AS REGOIN,
COUNT(CUSTOMERNUMBER) N_CUSTOMERS
FROM CUSTOMERS
GROUP
BY 1; -- BY 1 은 SELECT 의 첫번째 컬럼을 의미함, 이는 SELECT의 첫번째 칼럼으로 그룹핑하겠다는 의미

-- 8. RANK, DENSE_RANK, ROW_NUMBER구문----------------------------------------------------------------
-- 순위를 매기는데 사용하는 구문
-- ORDER BY : 기본적으로 오름차순으로 순위가 정렬되는데 내림차순으로 하고싶다면 칼럼명 뒤에 DESC를 붙여야함.
-- 차이점 : 동점일때의 등수 계산방법
-- RANK : 2등이 2명인경우 3등을 없애고 4등으로 계산
-- ROW_NUMBER : 동점인 경우 위에 나오는 값이 우선 순위
-- DENSE_RANK : 2등이 2명이라도 다음 등수를 3등으로 계산

-- PRODUCTS 테이블에서 BUYPRICE 컬럼으로 순위 매기기(3가지 방법 모두 사용)
SELECT BUYPRICE,
RANK() OVER(ORDER BY BUYPRICE) RNK,
ROW_NUMBER() OVER(ORDER BY BUYPRICE) ROWNUMBER,
DENSE_RANK() OVER(ORDER BY BUYPRICE) DENSE_RAN
FROM PRODUCTS;

-- PRODUCTS 테이블 내에서 PRODUCTLINE 별로 순위 매기기(순위 기준은 BUYPRICE)
SELECT BUYPRICE,
RANK() OVER(PARTITION BY PRODUCTLINE ORDER BY BUYPRICE) RNK
FROM PRODUCTS;


-- 9. SUBQUERY----------------------------------------------------------------
-- SELECT 구문 내에 또 SELECT 구문이 들어가 있는 경우를 SUBQUERY라고 한다.

-- CUSTOMERS와 ORDERS를 이용하여 USA 거주자의 주문 번호 출력
SELECT ORDERNUMBER
FROM ORDERS -- 주문번호 불러오기
WHERE CUSTOMERNUMBER IN (SELECT CUSTOMERNUMBER  
FROM CUSTOMERS
WHERE COUNTRY = 'USA'); -- 어떤 주문번호를 불러오냐 : CUSTOMERS에서 COUNTRY가 USA인 주문번호

