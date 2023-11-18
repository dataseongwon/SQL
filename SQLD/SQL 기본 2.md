## SQL 기본 2



## 1. 문제풀이

* 문제 1

  ![image-20231117001938756](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117001938756.png)

  * 답 : 3 > 숫자와 특수문자로 시작할 수 없음, A-Z, a-z , 0-9 , #,$,_ 만 사용가능
  * 반드시 문자로 시작해야함.
  * 다른 테이블명과 중복되서는 안되고, 칼럼 뒤 데이터유형은 꼭 지정되야함

## 2. DML 설명 및 문제풀이

* DML : 정의된 데이터베이스에 레코드를 입력하거나, 수정, 삭제 및 조회하기 위한 명령어다.

  * INSERT 

    * 기본구조 : 데이터 입력

      ```sql
      -- INSERT 기초
      INSERT INTO MENU (칼럼명) VALUES ('넣을내용');
      
      INSERT INTO MENU (NAME) VALUES ('연어스시');	
      ```

  * UPDATE

    * 기본구조 : 데이터 수정

      ```sql
      -- UPDATE 기초
      UPDATE 테이블명 SET 칼럼명 = 값 (조건);
      
      UPDATE MENU SET discount_rate = 10 (where name = '연어스시');	
      ```

  * DELETE

    * 기본구조 : 데이터삭제

      ```sql
      -- DELETE 기초
      DELETE FROM 테이블명 (조건);
      
      DELETE FROM MENU (WHERE name = '연어스시');
      
      ```

      

* 문제 2

  ![image-20231117002928149](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117002928149.png)

  * 답 : 3,4
  * 2번 : DELETE문에서 FROM은 생략 가능
  * 숫자는 varchar2와 char에 입력 가능
  * 3번 : **메뉴명이 not null** 이기때문에 오류 발생
  * 4번 : 칼럼명이 지정되지 않았을 경우에는 전체 컬럼에 대한 데이터를 입력해줘야함. 와규 역시 '와규'로 표현되었어야함.

* 문제 3

  ![image-20231117003449071](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117003449071.png)

  * 답 : 2

  * 요약

    ![image-20231117003606016](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117003606016.png)

    * DROP : 모두 삭제 / TRUNCATE : 테이블 구조는 남음 / DELETE : 데이터가 있었던 흔적도 남음.
    * DB에 반영되기전까지는 DELETE는 되돌릴수있음, DROP과 TRUNCATE는 불가능
    * WHERE문을 사용해서 특정 행을 지울 수 있음

## 3. TCL 

* 정의 : 트랜잭션을 제어하기 위한 언어

  * 트랜잭션 : 데이터베이스의 상태를 변화시키기 위해 수행하는 작업의 단위

* COMMIT : 반영 > 데이터에 대한 변화를 DB에 반영 시키기 위한 명령어

  * 

* ROLLBACK : 취소 > 트랜잭션이 시작되기 이전의 상태로 되돌리기 위한 언어, 최신 COMMIT이나 특수한 SAVEPOINT로 돌릴 수 있음

* SAVEPOINT : 위치저장 > 코드를 분할하기 위한 저장 포인트 지정

  * ```sql
    SAVEPOINT 포인트명;
    
    SAVEPOINT S1;
    ```

* 문제4

  ![image-20231117004551999](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117004551999.png)

  * 답 : 250

* 문제5

  ![image-20231117004755766](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117004755766.png)

  * COMMIT : 영구적 반영

  * S1 : 10/20/30

  * S2 : 10/50/30

  * S3 : 10/50

  * INSERT 후 : 10/50/70

  * S2로 롤백 : 10/50/30 >> 답

  * DML은 자동 COMMIT 되지 않음.

    ![image-20231117005020563](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117005020563.png)

  * COMMIT과 ROLLBACK 의 효과

    ![image-20231117005114070](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117005114070.png)

* 문제 6

  ![image-20231117005153388](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117005153388.png)

  * T2 : 10 / 20 / 30 후 COMMIT
  * UPDATE 후 : 10/50/30
  * DELETE 후 : 10/50
  * INSERT 후 : 10/50/70
  * 롤백 : 커밋전으로(DML문은 자동 커밋이 안됨) : 10/20/30 >> 답

* 문제 7

  ![image-20231117010407519](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231117010407519.png)

  * DROP 은 DELETE와 다르게 구조까지 테이블 정보까지 모두 삭제하기 때문에, DML이 맞다.