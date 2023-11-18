# SQL 기본 1

## 1. DCL (Data Control Language)

* 정의 : 데이터베이스 사용자에게 권한을 부여/회수하는 언어

* 함수 

  * GRANT : 권한 부여
  * REVOKE : 권한 회수

* 기본 문법 

  ![image-20231116020853028](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116020853028.png)

* 권한의 종류 

  ![image-20231116020912377](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116020912377.png)

* GRANT 옵션 포인트 

  ![image-20231116021041581](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116021041581.png)

* 문제 1 

  ![image-20231116021201971](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116021201971.png)

  * 답 : GRANT SELECT, UPDATE ON hoho_qualification.data to hoho;
    * where 조건문을 사용하기 위한 select 권한도 주어야함.
    * GRANT 권한 ON 테이블명 to 유저명;

* 문제 2

  ![image-20231116021443781](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116021443781.png)

  * 답 : ROLE

    ![image-20231116021524041](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116021524041.png)

## 2. DDL : Data Definition Language

* 정의 : 데이터를 보관하고 관리하기 위한 객체의 구조를 정의 하기 위한 언어

* 함수 :

  * CREATE : 데이터베이스상 테이블 구조 생성

    * 예시 :

      ![image-20231116021942945](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116021942945.png)

    * 기본 구조와 데이터 타입 

      ```SQL
      CREATE TABLE 테이블명(
      열이름 조건 제약조건,
      열이름1 조건 제약조건
      );
      ```

      * number : 숫자형
      * date : 날짜형
      * varchar2(n) : 가변길이 문자열 : 최대로 n 까지의 텍스트를 입력 가능
      * char(n) : 고정된 길이의 문자열 : n 길이의 문자열, n보다 부족하게 입력되면 공백으로 채워짐.
      * **컬럼 뒤에 데이터 유형을 지정하는 것은 필수**

    * 제약조건

      * default 9999 : 9999을 기본값으로 지정
      * not null : null 입력불가, 공백 안됨
      * primary key : 기본키 지정
        * pk 는 not null이고 unique한 값(테이블 내 중복 x)

* 문제 3

  ![image-20231116034700654](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116034700654.png)

  * 둘다 4 
  * 전체행을 추출한 a 는 4이고, 메뉴명(pk)를 추출한 select문도 4가 나올수 밖에 없다.

* ![image-20231116041344223](C:\Users\123\AppData\Roaming\Typora\typora-user-images\image-20231116041344223.png)

  * ALTER : 테이블과 칼럼에 대해 이름 및 속성 변경, 추가/삭제 등 구조 수정을 위해 사용

    * 기본 구조 (RENAME, MODIFY, ADD, DROP)

      ```sql
      -- 테이블명 변경
      ALTER TABLE 테이블명 RENAME TO 바꿀테이블명;
      
      -- 컬럼명 변경
      ALTER TABLE 테이블명 RENAME COLUMN 컬럼명 TO 바꿀컬럼명;	
      
      -- 컬럼 속성 변경
      ALTER TABLE 테이블명 MODIFY (컬럼명 조건 제약조건);
      ALTER TABLE MENU MODIFY (이름 varchar(20) not null);
      
      -- 컬럼 추가
      ALTER TABLE 테이블명 ADD (추가할컬럼명 조건);
      ALTER TABLE MENU ADD (거주지역 varchar(10));
      
      -- 컬럼삭제
      ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
      ALTER TABLE MENU DROP COLUMN 컬럼명;
      
      -- 제약조건 추가/삭제
      ALTER TABLE 테이블명 ADD CONSTRAINT;
      ALTER TABLE 테이블명 DROP CONSTRAINT;
      
      -- RENAME을 사용하지 않고 테이블명 동시에 여러개 변경 가능
      RENAME TABLE MENU TO ho_MENU
      RENAME TABLE 테이블명1 TO 변경1, 테이블명2 TO 변경2;
      ```

    * 문제 6

      ![image-20231116220734999](C:\Users\123\Desktop\마크다운\assets\image-20231116220734999.png)

    * 답 
      * ALTER TABLE RIDING MODIFY (phone varchar(15) not null);

  * DROP : 테이블 및 컬럼 삭제

    * 기본 구조

      ``` SQL
      -- 컬럼삭제
      ALTER TABLE 테이블명 DROP COLUMN 열이름;
      
      -- 테이블 삭제
      DROP TABLE 테이블명
      ```

    * 유의

      ![image-20231116221250945](C:\Users\123\Desktop\마크다운\assets\image-20231116221250945.png)

    * truncate : 테이블 초기화

      ```SQL
      --- 테이블 초기화
      TRUNCATE TABLE 테이블명
      --- 테이블 데이터만 삭제되고 구조는 유지
      ```

    * ![image-20231116233018295](C:\Users\123\Desktop\마크다운\assets\image-20231116233018295.png)

      * A : DROP TABLE F_INFO;
      * B : TRUNCATE TABLE F_INFO;