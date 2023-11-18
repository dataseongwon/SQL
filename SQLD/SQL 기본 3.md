# SQL 기본 3



## 1. 문제 풀이

* 문제 1

  ![image-20231116233914615](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116233914615.png)

  * 트랜잭션의 특징

    ![image-20231116234018751](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116234018751.png)

* 문제 2

  ![image-20231116234239091](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116234239091.png)

  * ㄱ : SELECT / ㄴ : FROM / ㄷ : WHERE

    ![image-20231116234502834](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116234502834.png)

* 문제 3

  ![image-20231116234529893](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116234529893.png)

  * 답 : 4행
  * DISTINCT 가 성별에만 적용될 경우 : F, M, NULL 로 3행

* 문제 4

  ![image-20231116234757745](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116234757745.png)

  * ![image-20231116235447084](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116235447084.png)
  * 1번 : 5 / 전체행 카운트
  * 2번 : 4 / NULL 제외 카운트
  * 3번 : 2 / NULL 제외 COUNT
  * 4번 : 3행 추출 / NULL 포함 3개 행



## 2. SELECT 문 문자형 함수

* LOWER('SQL') >> sql : 소문자로 변화

* UPPER('sql') >> SQL : 대문자로 변환

* CONCAT(문자열1,문자열2) : 문자열1과 문자열2를 결합

* SUBSTR(문자열,m,n) : 문자열을 m번째 자리값부터 n개 짜름

  * SUBSTR('KATE', 2, 2) >> 'AT'

* LENGTH(문자열) = LEN(문자열) : 문자열 길이 출력 (공백포함)

* TRIM(제거대상 FROM 문자열) : 문자열에서 제거대상에 해당하는 문자를 지움. 지정된 문자가 없을 경우 공백 제거

  * TRIM('AA' FROM 'AABBCCDD') >> BBCCDD
  * TRIM(' AA BB CC DD ') >> AABBCCDD

* LTRIM(문자열, 제거대상) : 왼쪽에서 지정된 문자 삭제, 없으면 공백 제거

* RTRIM(문자열, 제거대상) : 오른쪽에서 지정된 문자 삭제, 없으면 공백 제거

* 문제 5

  ![image-20231117001023727](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117001023727.png)

  * 답 : SELECT 회원코드, 연령대, UPPER(이름) FROM C_INFO;

* 문제6

  ![image-20231117001428950](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117001428950.png)

  * 답 : SELECT 회원코드, RTRIM(연령대, '대'), UPPER(이름) FROM C_INFO;



## 3. 숫자형, 날짜형함수 형변환

### 숫자형 함수

* ROUND(숫자, 소수점 자리수) : 반올림
  * ROUND(23.4556, 2)  >> 23.46
* TRUNC(숫자, 소수점 자리수) : 버림
  * TRUNC(23.4556,2) >> 23.45
* CEIL(숫자) : 크거나 같은 최소 정수 반환
  * CEIL(23.4556) : 24
* FLOOR(숫자) : 작거나 같은 최소 정수 반환
  * FLOOR(23.4556) : 23
* MOD(분자,분모) : 분자를 분모로 나눈 나머지 반환
  * MOD(3,2) : 1
* SIGN(숫자) : 숫자가 양수면 1, 0이면 0, 음수면 -1 반환

### 날짜형함수

* SYSDATE : 쿼리를 돌리는 현재 날짜&시각 출력
  * ex) 2022/01/31 14:00:26(datetime 형태)
* EXTRACT : 날짜형 데이터에서 원하는 값 추출
  * EXTRACT(YEAR FROM date '2022-01-31') : 2022
  * 추출가능부분 : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
  * TO_NUMBER(TO_CHAR(sysdate,'YYYY)) = EXTRACT(YEAR FROM sysdate)

## 4. 명시적/암시적 형변환

* 명시적 형변환 : 형변환함수가 강제로 data type을 변경하는것

  * TO_NUMBER('문자열') : 문자열을 숫자로 변환
    * TO_NUMBER('2022')
  * TO_CHAR(숫자 or 날짜, 포맷) : 숫짜 날짜형데이터를 포맷에 맞게 문자로 바꿈
    * TO_CHAR(date '2022-02-11', 'day') >> 금요일
    * TO_CHAR(200) > 200
  * TO_DATE(문자열, 포맷)
    * TO_DATE('2022013120', 'YYYYMMDDHH24') > 2022/01/31 20:00:00

* 암시적 형변환 : 데이터 베이스가 알아서 바꾸어주는 것

  ![image-20231117162041757](C:\Users\123\Desktop\마크다운\assets\image-20231117162041757.png)

* 문제 7

  ![image-20231117162557818](C:\Users\123\Desktop\마크다운\assets\image-20231117162557818.png)

  * 답 : TO_CHAR(SYSDATE - 1, 'YYYYMMDD')

## 5. 조건문과 정렬

* DECODE (IF문)

  * DECODE(값1, 값2, 참일때출력 값, 거짓일때 출력값)
  * 예시 : DECODE(col1, 'KATE', '본인', '다른사람')

* CASE WHEN(길어진 IF문)

  * CASE WHEN 조건 THEN 참일때 결과 ELSE 거짓일 때 결과 END

  * CASE WHEN col1 < 10 THEN '한자리수'

    WHEN col1 BETWEEN 10 AND 99 THEN '두자리수'

    ELSE '세자리수'

    END

* 문제 8

  ![image-20231117163502678](C:\Users\123\Desktop\마크다운\assets\image-20231117163502678.png)

  ![image-20231117163959080](C:\Users\123\Desktop\마크다운\assets\image-20231117163959080.png)