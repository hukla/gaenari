
DROP TABLE centerinfo;
CREATE TABLE centerinfo(
	cntrno INT AUTO_INCREMENT PRIMARY KEY,
	cntrname VARCHAR(36) NOT NULL,
	cntrloc VARCHAR(50) NOT NULL,
	cntrcontact VARCHAR(18) NOT NULL, 
	cntrsize CHAR(1) NOT NULL 
);

DROP TABLE userinfo;
CREATE TABLE userinfo(
	userno INT PRIMARY KEY AUTO_INCREMENT,
	userid VARCHAR(18) NOT NULL UNIQUE,
	passwd VARCHAR(12) NOT NULL,
	email VARCHAR(30) NOT NULL,
	username VARCHAR(18) NOT NULL,
	address VARCHAR(50) NOT NULL,
	usertype INT CONSTRAINT user_type_fk REFERENCES centerinfo(cntrno) DEFAULT 0,
	point INT DEFAULT 0,
	img VARCHAR(200)
);

DROP TABLE dog;
CREATE TABLE dog( 
	dogno INT AUTO_INCREMENT PRIMARY KEY,
	dogname VARCHAR(36) NOT NULL,
	dogage INT NOT NULL,
	dogkind VARCHAR(30) NOT NULL,
	userno INT CONSTRAINT user_no_fk REFERENCES userinfo(userno) NOT NULL
);

DROP TABLE friendinfo;
CREATE TABLE friendinfo( 
	prmuser INT PRIMARY KEY CONSTRAINT frnd_no_fk REFERENCES userinfo(userno),
	subuser INT CONSTRAINT sub_no_fk REFERENCES userinfo(userno)
);

DROP TABLE qlinfo;
CREATE TABLE qlinfo(
	userno INT PRIMARY KEY CONSTRAINT user_no_fk REFERENCES userinfo(userno),
	job VARCHAR(30) NOT NULL,
	resstyle VARCHAR(30) NOT NULL,
	lifestyle VARCHAR(30) NOT NULL,
	family VARCHAR(30) NOT NULL,
	personality VARCHAR(50) NOT NULL
);

--2014.04.26 price, qty의 default값 설정
--2014.05.03 재희 iteminfo column 추가
DROP TABLE donreq;
DROP TABLE iteminfo;
CREATE TABLE iteminfo( 
	itemno INT PRIMARY KEY AUTO_INCREMENT,
	itemname VARCHAR(30) NOT NULL, 
	price INT NOT NULL DEFAULT 0, 
	qty INT NOT NULL DEFAULT 0,
	itemdetail VARCHAR(1000)
);

DROP TABLE donreq;
CREATE TABLE donreq( 
	drno INT PRIMARY KEY AUTO_INCREMENT,
	userno INT CONSTRAINT user_no_fk REFERENCES userinfo(userno) NOT NULL,
	itemno INT CONSTRAINT item_no_fk REFERENCES iteminfo(itemno) NOT NULL,
	targetuser INT NOT NULL
);

--2014.04.23 title을 null로 수정! ALTER board MODIFY title VARCHAR(30) NULL;
DROP TABLE board;
CREATE TABLE board(
	brdno INT PRIMARY KEY AUTO_INCREMENT,
	brdcontent VARCHAR(1000) NOT NULL, 
	wrdate DATE NOT NULL, 
	userid CHAR(18) NOT NULL, 
	title VARCHAR(30) NULL, 
	brdtype VARCHAR(2) NOT NULL,
	userno INT CONSTRAINT user_no_fk REFERENCES userinfo(userno) 
);

DROP TABLE comment;
CREATE TABLE comment(
	cmtno INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) NOT NULL,
	wrtdate DATE NOT NULL, 
	userid CHAR(18) NOT NULL,
	userno INT CONSTRAINT user_no_fk REFERENCES userinfo(userno) NOT NULL,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL 
); 

DROP TABLE planboardinfo;
CREATE TABLE planboardinfo( 
	pbrdno INT PRIMARY KEY AUTO_INCREMENT,
	pdate DATE NOT NULL, 
	ploc VARCHAR(50) NOT NULL,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL
); 
-- 2014.06.06 adpdoginfo 필드 삭제 - 수진
DROP TABLE adpboardinfo;
CREATE TABLE adpboardinfo( 
	abrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL 
);
-- 2014.05.27 mboardinfo와 fboardinfo로 수정! - 수진
DROP TABLE mfboardinfo;
DROP TABLE mboardinfo;
CREATE TABLE mboardinfo(
	mbrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL,
	mloc VARCHAR(50) NOT NULL,
	mdate VARCHAR(50) NOT NULL,
	mcontact VARCHAR(30) NOT NULL,
	mkind VARCHAR(30) NOT NULL,
	mgender VARCHAR(10) NOT NULL,
	mage VARCHAR(5) NOT NULL,
	mname VARCHAR(50) NOT NULL
);
--2014.05.27 새로 생성! - 수진
--2014.05.31 fboardinfo 테이블에 brdno 칼럼 추가 - 수진
DROP TABLE fboardinfo;
CREATE TABLE fboardinfo(
	fbrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL,
	floc VARCHAR(50) NOT NULL
);

DROP TABLE diaryinfo;
CREATE TABLE diaryinfo(
	dbrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL,
	mood VARCHAR(50)
);

DROP TABLE voluboardinfo;
CREATE TABLE voluboardinfo(
	vbrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL,
	vhour VARCHAR(30) NOT NULL
);

DROP TABLE ptboardinfo;
CREATE TABLE ptboardinfo(
	ptbrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL,
	worktype VARCHAR(50) NOT NULL,
	workloc VARCHAR(50) NOT NULL,
	workhour VARCHAR(30) NOT null
);
--2014.04.23 방명록 테이블 추가
DROP TABLE visitinfo;
CREATE TABLE visitinfo( 
	vbrdno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL 
);
--2014.06.06 설문조사 테이블 추가 & userno를 primary key로 수정
DROP TABLE questionaire;
CREATE TABLE questionaire(
	qno INT AUTO_INCREMENT,
	userno INT PRIMARY KEY CONSTRAINT user_no_fk REFERENCES userinfo(userno),
	q1 VARCHAR(10) NOT NULL,
	q2 VARCHAR(10) NOT NULL,
	q3 VARCHAR(10) NOT NULL,
	q4 VARCHAR(10) NOT NULL,
	q5 VARCHAR(10) NOT NULL
);
--2014.06.11 입양/봉사/도우미 요청/내역확인을 위해 테이블 추가
DROP TABLE brdreq;
CREATE TABLE brdreq(
	reqno INT PRIMARY KEY AUTO_INCREMENT,
	brdno INT CONSTRAINT brd_no_fk REFERENCES board(brdno) NOT NULL,
	userno INT CONSTRAINT user_no_fk REFERENCES userinfo(userno) NOT NULL,
	status VARCHAR(5) NOT NULL,
	type varchar(5) NOT NULL
);
-------2014-04-23 검색, 컬럼확인, 테이블별 INSERT 쿼리----------------------------------------------------------------------------

SELECT * FROM userinfo;
SELECT * FROM diaryinfo;
SELECT * FROM planboardinfo;
SELECT * FROM board;
SELECT * FROM dog;
SELECT * FROM visitinfo;
SELECT * FROM board b JOIN diaryinfo d ON b.brdno = d.brdno;
SELECT d.dbrdno, d.mood, b.wrdate, b.brdcontent, b.title
		 FROM board b JOIN diaryinfo d ON b.brdno = d.brdno AND b.userno=1;

DESC board;
DESC userinfo;
DESC diaryinfo;
DESC dog;
DESC planboardinfo;
DESC visitinfo;

--user입력란----
INSERT INTO userinfo VALUES (NULL,'hoonc','tjdgns','csh8908@nate.com','최성훈','Gyeonggi-Gwangju',null);
INSERT INTO userinfo VALUES(NULL,'csh8908','tjdgns','csh8908@gmail.com','최성훈2','경기도 광주시',null);

--board입력란---
INSERT INTO board VALUES (NULL,'연습입니다. 하하하하하하 ??ㅇ?','2014-04-20','hoonc','제목제목','pl',1);
INSERT INTO board(brdcontent,wrdate,userid,title,brdtype,userno)
VALUES ('내용을 적절히 적다. 내용을 적다 적절히. 적절히 내용을 적다. 적절히 적다 내용을. 적다 내용을 적절히. 적다 적절히 내용을.',
SYSDATE,'csh8908','주저리','dy',1); 
INSERT INTO board(brdcontent,wrdate,userid,brdtype,userno) 
VALUES ('첫번째 방명록이다. 24시간이 모자라 너와 눈을 맞추고 ㅇㅇ',SYSDATE,'csh8908','vi',1);

--plan입력란----
INSERT INTO planboardinfo VALUES (NULL, '2014-04-20','Gyeonggi-Gwangju', 1);---plan꺼

--diary입력란---
INSERT INTO diaryinfo VALUES (NULL, 2,'GOOD');---diary꺼

--dog입력란
INSERT INTO dog VALUES (NULL,'모찌',2,'푸들',1);
INSERT INTO dog VALUES (NULL,'동건이',2,'강아지',2);

--visit입력란
INSERT INTO visitinfo(brdno) VALUES (3);



-------2014-04-23 검색, 컬럼확인, 테이블별 INSERT 쿼리----------------------------------------------------------------------------