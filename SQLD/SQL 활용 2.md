## SQL 활용 2

### 1. JOIN 심화

* EQUI JOIN 과 non-EQUI JOIN

  ![image-20231117222916783](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117222916783.png)

* CROSS JOIN

  ![image-20231117224132743](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117224132743.png)

### 2. 계층형 조회

* 계층구조 시작점(STRAT WITH 로 계층형 조회의 시작점을 설정) >> 부모 데이터, ROOT 노드
* 자식노드
* LEAF 노드 : 자식노드가 없는 데이터

* 한 층씩 내려갈수록 레벨이 커짐

  ![image-20231117232559742](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117232559742.png)

* 문제

  ![image-20231117232755744](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117232755744.png)

  * CONNECT BY : 어떻게 이어지는지 확인
  * ORDER SIBLINGS 겹치는 값이 있을 때 BY 뒤의 열을 통해 순서정하기(디폴트는 오름차순)