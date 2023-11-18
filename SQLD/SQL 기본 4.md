## SQL 기본 4

### 1. WHERE절 연산자

* In(x,y,z....) : x,y,z등으로 구성된 목록 내 값 중 어느 하나라도 일치하면 된다.

* NOT IN(x,y,z...) : x,y,z들 목록 내 값 중 어느 하나라도 일치하면 안된다.

* IS NULL : NULL이면 TRUE

* IS NOT NULL : NULL 이 아니면 TRUE

* BETWEEN A AND B : A와 B사이에 값이 있는지

* 기타 : 비교연산자

* A LIKE B : A 에 대하여 B 와 유사한 문자열을 찾아줌

* % : 문자 0개 이상이 존재한다는 의미

* _ : 문자 한개

* 문제1

  ![image-20231117173550520](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117173550520.png)

  * LIKE 'ki%'

    ![image-20231117174239140](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117174239140.png)

  * LIKE 'ki%' : ki로 시작하는 아무 문자

  * LIKE 'ki__' : ki로 시작하고 그 뒤에 두 자리가 더있는 것

* 문제2 : 임시테이블

  ![image-20231117174349271](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117174349271.png)

  * 이름에 a가 들어가는 사람의 정보를 조회 : SELECT * FROM C_INFO WHERE NAME LIKE '%a%'

  * 임시테이블 만들기(WITH 구문)

    ```
    WITH TableName AS(
    SELECT *
    FROM C_INFO
    WHERE NAME LIKE '%a%'
    )
    SELECT * FROM TableName;
    ```

    ![image-20231117174816740](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117174816740.png)

    * 서브쿼리 : SELECT문 내에 SELECT 문이 또 쓰여진 것
    * 인라인뷰 : 서브쿼리가 FROM 절 내에 쓰여진 것

* 문제3

  ![image-20231117175251256](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117175251256.png)

  * 답 : VIEW 테이블
    * 일종의 가상테이블로서 실제 데이터가 하드웨어에 저장되지 않음. 실제 데이터를 가지고 있지도 않음.
    * 테이블 구조가 변경되더라도 독립적으로 존재한다.

### 2. null 관련 함수

* NVL(col, 대체값) : NULL 이면 다른값으로 바꿔줌
  * NVL(col1, 100) : col1이 null이면 100으로 바꿔줌
* NVL2(col1, 결과1, 결과2) 
  * **NVL2(col1, 'F', 'T') : col1이 NULL일때 T출력, NOT NULL일때 F 출력**
* NULLIF(v1,v2)
  * v1==v2 면 null
  * v1 != v2 면 v1을 출력
* COALESCE(v1,v2,v3,...mvn) : null이 아닌 최초의 값을 반환

* 문제 4

  ![image-20231117180846936](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117180846936.png)

  * 답 : NVL 또는 ISNULL
  * NVL 내의 데이터 타입이 같아야지 오류가 나지 않음.

### 3. GROUP BY

* 문제 5

  ![image-20231117181137625](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117181137625.png)

  * ![image-20231117181226961](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117181226961.png)

  * ORACLE은 NULL값을 포함하고 해줌. SQL서버에서는 

* 문제 6

  ![image-20231117181441634](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117181441634.png)

  * 답 

    ![image-20231117181610566](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117181610566.png)

    * 따로 순서를 지정하지 않았기 때문에 원본 데이터에 가장 먼저 나오는 유형 별로 순서처리

### 집계함수

![image-20231117183817622](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117183817622.png)

* 문제7

  ![image-20231117185146152](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117185146152.png)

  * 우선 성별과 평균 연령을 가져와야함

    ```sql
    SELECT 성별 AVG(연령)
    FROM C_INFO
    GROUP BY 성별
    ```

  * 평균연령이 30대인 데이터만 뽑아내서 성별과 평균 연령을 출력해야함.

    ```SQL
    HAVING AVG(연령) >= 30 AND AVG(연령) < 40
    ```

    

### 조회되는 행 수 제한

![image-20231117185934188](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117185934188.png)

* where문에 ROWNUM=1 으로 지정.

* 문제 9

  ![image-20231117190024047](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117190024047.png)

  * ROWID : 테이블 내에서 블록이 어디에 저장되있는지 알려줌.
  * 2번 : 데이터베이스에 저장되어있는 데이터를 구분할 수 있는 유일한 값이다.