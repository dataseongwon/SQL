## SQL 활용 1

### 1. GROUP 함수

* **ROLLUP(col1,col2...)** : 부분합

  ![image-20231117203448940](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117203448940.png)

  * 첫 인자의 합계에 대해 부분합을 보여주고, 맨 아래는 전체 합을 보여줌. (인자의 순서가 중요함)

* **cube(co1,col2)** : 그룹화 될 수 있는 모든 경우에 대해 부분합을 보여줌.

  ![image-20231117203813172](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117203813172.png)

  * 그룹화 될 수 있는 모든 경우에 대해 생성

* **GROUPING SETS(성별, 연령대)**;

  ![image-20231117203933923](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117203933923.png)

  * 그룹핑 기준 각각따로 합계

* GROUPING 함수

  ![image-20231117204152450](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117204152450.png)

![image-20231117204513560](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117204513560.png)

### 2. JOIN 함수

![image-20231117213224516](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117213224516.png)

* 단순 JOIN

  * SELECT A.이름 B.전화번호

    FROM C_INFO A JOIN PHONE B ON A.회원코드 = B.회원코드;

![image-20231117213445017](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117213445017.png)

* INNER JOIN

  ![image-20231117213547816](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117213547816.png)

```SQL
SELECT A.성별 B.연령
FROM GENDER A INNER JOIN AGE B 
ON A.회원코드=B.회원코드;
-- 위와 아래는 같은 결과
SELECT A.성별 B.연령
FROM GENDER A, AGE B 
WHERE A.회원코드=B.회원코드;

-- 특정 결과만 조회
SELECT A.성별 B.연령
FROM GENDER A INNER JOIN AGE B 
ON A.회원코드=B.회원코드
WHERE A.성별 = 'F';

```

* 결과

  ![image-20231117213733308](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117213733308.png)

* INNER JOIN(3개이상)

![image-20231117213951029](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117213951029.png)

```SQL
SELECT A.성별 B.연령 C.BIRTH
FROM GENDER A JOIN AGE B ON A.회원코드=B.회원코드
JOIN BIRTH C ON B.연령=C.연령

-- 혹은
SELECT A.성별 B.연령 C.BITH
FROM GENDER A, AGE B, BIRTH C
WHERE A.회원코드 = B.회원코드 AND B.연령 = C.연령;
```

* LEFT JOIN

  ![image-20231117214205733](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117214205733.png)

  * A테이블의 값은 전부 나오고, B테이블은 A테이블에 존재하는 회원코드 데이터만 나오게됨.

    ```
    SELECT A.* B.연령
    FROM GENDER A LEFT JOIN AGE B ON A.회원코드 = B.회원코드;
    
    -- 혹은
    
    SELECT A.* B.연령
    FROM GENDER A, AGE B
    WHERE A.회원코드=B.회원코드(+);
    
    -- (+)는 해당 테이블 속성값에 대해 NULL 허용 RIGHT JOIN의 경우에는 A쪽에 (+)
    ```

    

* OUTER JOIN

  ![image-20231117214525010](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117214525010.png)

### 3. JOIN 문제풀이 및 UNION과 MINUS 등

* 문제 3

![image-20231117220545949](C:\Users\123\Desktop\마크다운\image-20231117220545949.png)

* 답 :  LEFT OUTER JOIN = LEFT JOIN

  * c2를 기준으로 

* UNION : 중복된 컬럼은 한번씩만 나타나고 나머지 레코드는 합침

  ![image-20231117221500822](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117221500822.png)

* UNION ALL : 중복제거하지 않고 전부 합치기

* 문제 6

  ![image-20231117221733535](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117221733535.png)

  * 답 : 

![image-20231117221932739](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117221932739.png)

* MINUS

  ![image-20231117222114533](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117222114533.png)

  * 