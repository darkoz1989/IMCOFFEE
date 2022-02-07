ㅁ 1. 새로운 데이터베이스 생성
 - SQL developer 계정만들기/새접속하기
1) cmd 창에서 sqlplus "/as sysdba" 라고 입력
==>  sqlplus "/as sysdba"

2) create user 계정명 identified by 비밀번호; 이렇게 명령어를 입력하여 새로운 계정을 생성
create user imcoffee identified by 1234;

3) grant connect, resource, dba to 계정명
grant connect, resource, dba to imcoffee;

※ server.xml
<Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" loginTimeout="10" maxWait="50000" name="jdbc/pool" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:xe" username="imcoffee"/>

ㅁ 2. 테이블 생성
1) sql develper 실행

2) 테이블 생성
 * 회원테이블 생성
CREATE TABLE MEMBER(
  userId VARCHAR(20),
  userPw VARCHAR(10) NOT NULL,
  userName VARCHAR(30) NOT NULL,
  userPhon NUMBER NOT NULL,
  userEmail VARCHAR(100),
  userAddr VARCHAR(100) NOT NULL,
  regDate  DATE,
  CONSTRAINT MEMBER_PK PRIMARY KEY (userId)
);
commit;

 - 회원테이블 삽입
 insert into member values('admin', '0000','관리자',01012345678,'admin@naver.com','서울시 강서구',sysdate);
 insert into member values('abc', '0000','관리자',01012345678,'admin@naver.com','서울시 강서구',sysdate);
 commit;
 
 
 * 제품테이블 생성
CREATE TABLE PRODUCT(
 pNum NUMBER,
 pCode VARCHAR(10),
 pName VARCHAR(50),
 pPrice NUMBER,
 pDetail VARCHAR(500),
 pOrigin VARCHAR(50),
 pCategory VARCHAR(50),
 pStock NUMBER,
 pCondition VARCHAR(50),
 pFilename VARCHAR(50),
 pQuantity NUMBER,
 pregDate  DATE,
 CONSTRAINT PRODUCT_PK PRIMARY KEY (pCode)
);
commit;

++
product_seq 시퀀스 생성

 - 제품데이터 삽입
insert into PRODUCT values(product_seq.NEXTVAL, 'p1001','에티오피아 원두1',20000,'고품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1001.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1002','에티오피아 원두2',30000,'중품격 커피입니다.','아프리카','AP',100,'밸런스,단맛','p1002.png',20, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1003','에티오피아 원두3',40000,'저품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1003.png',30, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1004','에티오피아 원두4',50000,'고품격 커피입니다.','미국','EP',100,'밸런스,단맛','p1004.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1005','에티오피아 원두5',21000,'고품격 커피입니다.','과테말라','AP',100,'밸런스,단맛','p1005.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1006','에티오피아 원두6',22000,'고품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1006.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1007','에티오피아 원두7',23000,'중품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1007.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1008','에티오피아 원두8',24000,'중품격 커피입니다.','중국','AP',100,'밸런스,단맛','p1008.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1009','에티오피아 원두9',25000,'고품격 커피입니다.','한국','AP',100,'밸런스,단맛','p1009.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1010','에티오피아 원두10',50000,'저품격 커피입니다.','아프칸','EP',100,'밸런스,단맛','p1010.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1011','에티오피아 원두11',55000,'저품격 커피입니다.','서울','EP',100,'밸런스,단맛','p1011.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1012','에티오피아 원두12',99000,'고품격 커피입니다.','부산','EP',100,'밸런스,단맛','p1012.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1013','에티오피아 원두13',27000,'고품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1013.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1014','에티오피아 원두14',52000,'중품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1014.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1015','에티오피아 원두15',59000,'저품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1015.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1016','에티오피아 원두16',66000,'고품격 커피입니다.','에티오피아','EP',100,'밸런스,단맛','p1016.png',10, sysdate);
commit;


 * 장바구니 테이블 생성
CREATE TABLE CART(
cNum NUMBER,
userId VARCHAR(10),
pCode VARCHAR(10),
cQuantity NUMBER,
cregDate DATE,
CONSTRAINT CART_PK PRIMARY KEY (cNum)
);
commit;

++
cart_seq 시퀀스 생성

 - 장바구니 테이블 userId 필드(MEMBER테이블 userId)의 외래키 지정
ALTER TABLE CART
ADD CONSTRAINT FK_CART_userId_MEMBER_userId FOREIGN KEY (userId)
REFERENCES MEMBER (userId) on delete cascade;
commit;

 - 장바구니 테이블 pCode 필드(PRODUCT테이블 pCode)의 외래키 지정
ALTER TABLE CART
ADD CONSTRAINT FK_CART_pCode_PRODUCT_pCode FOREIGN KEY (pCode)
REFERENCES PRODUCT (pCode) on delete cascade;
commit;


* 게시판 테이블 생성
CREATE TABLE BOARD(
bNum NUMBER,
bTitle VARCHAR(100),
bContent VARCHAR(500),
bregDate DATE,
bRef NUMBER,
bRe_Step NUMBER,
bRe_Level NUMBER,
bReadcount NUMBER,
userId VARCHAR(20)
);
commit;

++
board_seq 시퀀스 생성

insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,1,1,1,,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,2,1,1,,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,3,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,4,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,5,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,6,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,7,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,8,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,9,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,10,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,11,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '로그인전 안내문입니다','서비스는 2021/11/05 부터 이용가능합니다.',sysdate,12,1,1,0,'admin');
commit;



* 구매정보 테이블 생성
CREATE TABLE PORDER(
oNum NUMBER,
pCode VARCHAR(20),
userId VARCHAR(20),
oregDate date,
oName VARCHAR(20),
oPhon NUMBER,
oAddr VARCHAR(50),
oRequests VARCHAR(50),
oPayment NUMBER,
oQuantity NUMBER,
oDelivery VARCHAR(20),
CONSTRAINT ORDERS_PK PRIMARY KEY (oNum)
);
commit;



