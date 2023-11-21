## SQL 활용 3

## 1. WINDOW 함수 설명



![image-20231118003144408](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231118003144408.png)

![image-20231118003132643](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231118003132643.png)

![image-20231118003956503](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231118003956503.png)

* 답

  ```
  SELECT 매장코드, 지역명, 메뉴명, 판매량,
  DENSE_RANK() OVER (PARTITION BY 지역명 ORDER BY 판매량 DESC) AS 
  ```

  

![image-20231118004417307](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231118004417307.png)

* SUM(판매량)

### 2. WINDOW 함수

### 그룹내 비율함수

* PERCENT_RANK : 값이 아닌, 순서를 대상으로, 파티션 내에서의 순서별 백분율을 조회함
* NTILE(n) : 파티션별로 전체 건수를 n등분한 값을 반환한다. n=4 이면 4등분 한것 내에서의 몇인지 조회.
* CUME_DIST : 파티션 내 전체에서 현재 행의 값 이하인 레코드 건수에 대한 누적 백분율 조회 / 누적분포상 0~1사이값

### 그룹 내 행 함수

* FIRST_VALUE : 파티션 내에서 가장 처음 나오는 값 반환(MIN과 동일한 결과)
* LAST_VALUE : 파티션 내에서 가장 마지막에 나오는 값 반환 (MAX와 동일한 결과)
* LAG(컬럼명, 레코드위치차이값) : 이전 행을 가져온다
* LEAD(컬럼명, 레코드위치차이값, NULL일경우 대체값) : 다음(특정위치의)행을 가져온다 / default는 1이다.

![image-20231118020042777](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231118020042777.png)

![image-20231118020306752](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231118020306752.png)