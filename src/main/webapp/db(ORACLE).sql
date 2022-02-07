�� 1. ���ο� �����ͺ��̽� ����
 - SQL developer ���������/�������ϱ�
1) cmd â���� sqlplus "/as sysdba" ��� �Է�
==>  sqlplus "/as sysdba"

2) create user ������ identified by ��й�ȣ; �̷��� ��ɾ �Է��Ͽ� ���ο� ������ ����
create user imcoffee identified by 1234;

3) grant connect, resource, dba to ������
grant connect, resource, dba to imcoffee;

�� server.xml
<Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" loginTimeout="10" maxWait="50000" name="jdbc/pool" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:xe" username="imcoffee"/>

�� 2. ���̺� ����
1) sql develper ����

2) ���̺� ����
 * ȸ�����̺� ����
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

 - ȸ�����̺� ����
 insert into member values('admin', '0000','������',01012345678,'admin@naver.com','����� ������',sysdate);
 insert into member values('abc', '0000','������',01012345678,'admin@naver.com','����� ������',sysdate);
 commit;
 
 
 * ��ǰ���̺� ����
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
product_seq ������ ����

 - ��ǰ������ ����
insert into PRODUCT values(product_seq.NEXTVAL, 'p1001','��Ƽ���Ǿ� ����1',20000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1001.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1002','��Ƽ���Ǿ� ����2',30000,'��ǰ�� Ŀ���Դϴ�.','������ī','AP',100,'�뷱��,�ܸ�','p1002.png',20, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1003','��Ƽ���Ǿ� ����3',40000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1003.png',30, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1004','��Ƽ���Ǿ� ����4',50000,'��ǰ�� Ŀ���Դϴ�.','�̱�','EP',100,'�뷱��,�ܸ�','p1004.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1005','��Ƽ���Ǿ� ����5',21000,'��ǰ�� Ŀ���Դϴ�.','���׸���','AP',100,'�뷱��,�ܸ�','p1005.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1006','��Ƽ���Ǿ� ����6',22000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1006.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1007','��Ƽ���Ǿ� ����7',23000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1007.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1008','��Ƽ���Ǿ� ����8',24000,'��ǰ�� Ŀ���Դϴ�.','�߱�','AP',100,'�뷱��,�ܸ�','p1008.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1009','��Ƽ���Ǿ� ����9',25000,'��ǰ�� Ŀ���Դϴ�.','�ѱ�','AP',100,'�뷱��,�ܸ�','p1009.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1010','��Ƽ���Ǿ� ����10',50000,'��ǰ�� Ŀ���Դϴ�.','����ĭ','EP',100,'�뷱��,�ܸ�','p1010.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1011','��Ƽ���Ǿ� ����11',55000,'��ǰ�� Ŀ���Դϴ�.','����','EP',100,'�뷱��,�ܸ�','p1011.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1012','��Ƽ���Ǿ� ����12',99000,'��ǰ�� Ŀ���Դϴ�.','�λ�','EP',100,'�뷱��,�ܸ�','p1012.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1013','��Ƽ���Ǿ� ����13',27000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1013.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1014','��Ƽ���Ǿ� ����14',52000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1014.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1015','��Ƽ���Ǿ� ����15',59000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1015.png',10, sysdate);
insert into PRODUCT values(product_seq.NEXTVAL, 'p1016','��Ƽ���Ǿ� ����16',66000,'��ǰ�� Ŀ���Դϴ�.','��Ƽ���Ǿ�','EP',100,'�뷱��,�ܸ�','p1016.png',10, sysdate);
commit;


 * ��ٱ��� ���̺� ����
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
cart_seq ������ ����

 - ��ٱ��� ���̺� userId �ʵ�(MEMBER���̺� userId)�� �ܷ�Ű ����
ALTER TABLE CART
ADD CONSTRAINT FK_CART_userId_MEMBER_userId FOREIGN KEY (userId)
REFERENCES MEMBER (userId) on delete cascade;
commit;

 - ��ٱ��� ���̺� pCode �ʵ�(PRODUCT���̺� pCode)�� �ܷ�Ű ����
ALTER TABLE CART
ADD CONSTRAINT FK_CART_pCode_PRODUCT_pCode FOREIGN KEY (pCode)
REFERENCES PRODUCT (pCode) on delete cascade;
commit;


* �Խ��� ���̺� ����
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
board_seq ������ ����

insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,1,1,1,,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,2,1,1,,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,3,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,4,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,5,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,6,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,7,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,8,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,9,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,10,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,11,1,1,0,'admin');
insert into BOARD values(board_seq.NEXTVAL, '�α����� �ȳ����Դϴ�','���񽺴� 2021/11/05 ���� �̿밡���մϴ�.',sysdate,12,1,1,0,'admin');
commit;



* �������� ���̺� ����
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



