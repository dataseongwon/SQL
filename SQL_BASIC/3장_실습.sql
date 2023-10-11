-- 3장

-- 2) insert 행 추가하기-------------------------------------------------
INSERT INTO TABLE_NAME (COLUMN1, COLUMN2,COLUMN3) VALUES
(VALUE1, VALUE2, VALUE3),
(VALUE4, VALUE5, VALUE6);

-- 3) DELETE 행 삭제하기--------------------------------------------------
DELETE FROM TABLE_NAME
WHERE SOME_COLUMN = SOME_VALUE

DELETE FROM PRODUCT
WHERE 상품 번호 = 'a003';

-- 4) UPDATE, 데이터 갱신하기
UPDATE TABLE_NAME
SET COLUMN_NAME = 'NEW VALUE'
WHERE CONDITION;

-- product 테이블의 상품번호 a002의 원가와 카테고리를 업데이트
UPDATE PRODUCT
SET 원가 = 70000,
카테고리 = '피트니스'
WHERE 상품 번호 = 'a002';

-- 5) procedure 매크로 반복--------------------------------------------------

-- 6) view 제한된 보기 권한부여--------------------------------------------------
-- 협력사에게 주문 취소 건 만을 조회할 수 있는 테이블 만들어주기

-- 단순 조회
SELECT 주문 번호
FROM DB.SALES
WHERE 취소 여부 = 'Y';

-- VIEW 생성 예시
CREATE VIEW DB.view_name
AS
SELECT-STATEMEN;

-- cancel_prodno 라는 view를 생성하는 예시
CREATE VIEW DB.cancel_prodno
AS
SELECT 주문번호
FROM DB.SALES
WHERE 취소 여부 ='Y';

-- 생성된 VIEW 사용법 : 기존 테이블들과 사용 방법은 같다.
SELECT *
FROM DB.cancel_prodno;

