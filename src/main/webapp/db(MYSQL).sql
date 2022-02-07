-- mysql 디비 연동 방법중 커넥션 풀을 사용하기 위한 작업
Servers > context.xml 파일에 아래코드 추가하기
<Resource
    	name = "jdbc/dbconn"
    	auth = "Container"
    	driverClassName = "com.mysql.jdbc.Driver"
    	url = "jdbc:mysql://localhost:3306/IMCOFFEE"
    	username = "root"
    	password = "1234"
    	type = "javax.sql.DataSource"
    	maxActive = "50"
    	maxIdle = "10"
    	removeAbandoned = "true"
    	maxWait="5000"    
    />

-- 데이터베이스 생성
create database IMCOFFEE;

-- 1.product 테이블 생성
drop table if exists product;
use IMCOFFEE;
create table product(
	pNum int not null auto_increment ,  -- 제품순번
	pCode varchar(20) not null,  -- 제품코드
	pName varchar(20), -- 제품명
	pPrice int, -- 제품가격
	pDescription varchar(200), -- 제품설명
	pManufacturer varchar(20), -- 제품제조
	pCategory varchar(20), -- 제품분류
	pStock int, -- 제품재고
	pCondition varchar(50), -- 제품상태
	pFilename varchar(50), -- 제품사진
	pRegDate varchar(20), -- 제품등록일
	primary key(pNum,pCode)
)default charset=utf8mb4;

-- delete from product where p_id = "p1001"; 아이디값으로 데이터 삭제

-- product 테이블에 데이터 삽입
	insert into product values(1,"p1001", "에티오피아 원두1", 100,"원산지에서 생산한 고급 커피입니다.",
	      "에티오피아","분쇄",1000,"New","p1001.png","20220120");
	insert into product values(2,"p1002", "에티오피아 원두2", 200,"원산지에서 생산한 고급 커피입니다.",
		  "에티오피아","분쇄",2000,"New","p1002.png","20220120");
	insert into product values(3,"p1003", "에티오피아 원두3", 300,"원산지에서 생산한 고급 커피입니다.",
		  "에티오피아","분쇄",3000,"New","p1003.png","20220120");
	insert into product values(4,"p1004", "에티오피아 원두4", 400,"원산지에서 생산한 고급 커피입니다.",
	  "에티오피아","분쇄",4000,"New","p1004.png","20220120");
	  insert into product values(5,"p1005", "에티오피아 원두5", 500,"원산지에서 생산한 고급 커피입니다.",
	  "에티오피아","분쇄",5000,"New","p1005.png","20220120");
	  insert into product values(6,"p1006", "에티오피아 원두6", 600,"원산지에서 생산한 고급 커피입니다.",
	  "에티오피아","분쇄",6000,"New","p1006.png","20220120");
	  insert into product values(7,"p1007", "에티오피아 원두7", 700,"원산지에서 생산한 고급 커피입니다.",
	  "에티오피아","분쇄",7000,"New","p1007.png","20220120");
	  insert into product values(8,"p1008", "에티오피아 원두8", 800,"원산지에서 생산한 고급 커피입니다.",
	  "에티오피아","분쇄",8000,"New","p1008.png","20220120");
                     
select * from product;


-- 2. 제품 주문테이블 생성
drop table if exists porder;
use IMCOFFEE;
CREATE TABLE porder (
	oNum                  int                          auto_increment  ,
	oProductNo      varchar(20)                            NULL  ,
	oQuantity          int                           NULL      ,
	oDate                varchar(20)           NULL      ,
	oState               varchar(10)           NULL      ,
	oId                     varchar(10)           NULL      ,
	oName	varchar(10) NULL,
	oPhon int NULL,
	oAddr varchar(20) NULL,
	PRIMARY KEY ( oNum)
)default charset=utf8mb4;


-- 3. MEMBER 테이블 생성
use IMCOFFEE;
drop table if exists member;
create table member (
	 userId VARCHAR(20),
	 userPw VARCHAR(10) NOT NULL,
	 userName VARCHAR(30) NOT NULL,
	 userPhon int,
	 userEmail VARCHAR(100),
	 userAddr VARCHAR(100) NOT NULL,
	 uRegDate varchar(20),
    primary key(userId)   
)default charset=utf8mb4;

-- MEMBER 테이블 데이터 삽입
 insert into member values("admin", "0000","관리자",01012345678,"admin@naver.com","서울시 강서구","20220120");
 insert into member values("aaaa", "0000","회원",01011112222,"member@naver.com","서울시 강남구","20220120");

select * from member;


-- 4. board 테이블 생성
use IMCOFFEE;

drop table if exists board;
create table board(
	num int not null auto_increment ,    -- 게시글 순번
	id varchar(10) not null,             -- 회원 아이디
	name varchar(20) not null,           -- 회원 이름
	subject varchar(100) not null,       -- 게시글의 제목
	content text not null,               -- 게시글 내용
	regist_day varchar(30),              -- 게시글 등록 일자
	hit int,                             -- 게시글 조회수
	ip varchar(20),                      -- 게시글 등록 시 IP
	primary key(num)
)default charset=utf8mb4;

select * from board;
desc board;



