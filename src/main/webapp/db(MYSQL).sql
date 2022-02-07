-- mysql ��� ���� ����� Ŀ�ؼ� Ǯ�� ����ϱ� ���� �۾�
Servers > context.xml ���Ͽ� �Ʒ��ڵ� �߰��ϱ�
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

-- �����ͺ��̽� ����
create database IMCOFFEE;

-- 1.product ���̺� ����
drop table if exists product;
use IMCOFFEE;
create table product(
	pNum int not null auto_increment ,  -- ��ǰ����
	pCode varchar(20) not null,  -- ��ǰ�ڵ�
	pName varchar(20), -- ��ǰ��
	pPrice int, -- ��ǰ����
	pDescription varchar(200), -- ��ǰ����
	pManufacturer varchar(20), -- ��ǰ����
	pCategory varchar(20), -- ��ǰ�з�
	pStock int, -- ��ǰ���
	pCondition varchar(50), -- ��ǰ����
	pFilename varchar(50), -- ��ǰ����
	pRegDate varchar(20), -- ��ǰ�����
	primary key(pNum,pCode)
)default charset=utf8mb4;

-- delete from product where p_id = "p1001"; ���̵����� ������ ����

-- product ���̺� ������ ����
	insert into product values(1,"p1001", "��Ƽ���Ǿ� ����1", 100,"���������� ������ ��� Ŀ���Դϴ�.",
	      "��Ƽ���Ǿ�","�м�",1000,"New","p1001.png","20220120");
	insert into product values(2,"p1002", "��Ƽ���Ǿ� ����2", 200,"���������� ������ ��� Ŀ���Դϴ�.",
		  "��Ƽ���Ǿ�","�м�",2000,"New","p1002.png","20220120");
	insert into product values(3,"p1003", "��Ƽ���Ǿ� ����3", 300,"���������� ������ ��� Ŀ���Դϴ�.",
		  "��Ƽ���Ǿ�","�м�",3000,"New","p1003.png","20220120");
	insert into product values(4,"p1004", "��Ƽ���Ǿ� ����4", 400,"���������� ������ ��� Ŀ���Դϴ�.",
	  "��Ƽ���Ǿ�","�м�",4000,"New","p1004.png","20220120");
	  insert into product values(5,"p1005", "��Ƽ���Ǿ� ����5", 500,"���������� ������ ��� Ŀ���Դϴ�.",
	  "��Ƽ���Ǿ�","�м�",5000,"New","p1005.png","20220120");
	  insert into product values(6,"p1006", "��Ƽ���Ǿ� ����6", 600,"���������� ������ ��� Ŀ���Դϴ�.",
	  "��Ƽ���Ǿ�","�м�",6000,"New","p1006.png","20220120");
	  insert into product values(7,"p1007", "��Ƽ���Ǿ� ����7", 700,"���������� ������ ��� Ŀ���Դϴ�.",
	  "��Ƽ���Ǿ�","�м�",7000,"New","p1007.png","20220120");
	  insert into product values(8,"p1008", "��Ƽ���Ǿ� ����8", 800,"���������� ������ ��� Ŀ���Դϴ�.",
	  "��Ƽ���Ǿ�","�м�",8000,"New","p1008.png","20220120");
                     
select * from product;


-- 2. ��ǰ �ֹ����̺� ����
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


-- 3. MEMBER ���̺� ����
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

-- MEMBER ���̺� ������ ����
 insert into member values("admin", "0000","������",01012345678,"admin@naver.com","����� ������","20220120");
 insert into member values("aaaa", "0000","ȸ��",01011112222,"member@naver.com","����� ������","20220120");

select * from member;


-- 4. board ���̺� ����
use IMCOFFEE;

drop table if exists board;
create table board(
	num int not null auto_increment ,    -- �Խñ� ����
	id varchar(10) not null,             -- ȸ�� ���̵�
	name varchar(20) not null,           -- ȸ�� �̸�
	subject varchar(100) not null,       -- �Խñ��� ����
	content text not null,               -- �Խñ� ����
	regist_day varchar(30),              -- �Խñ� ��� ����
	hit int,                             -- �Խñ� ��ȸ��
	ip varchar(20),                      -- �Խñ� ��� �� IP
	primary key(num)
)default charset=utf8mb4;

select * from board;
desc board;



