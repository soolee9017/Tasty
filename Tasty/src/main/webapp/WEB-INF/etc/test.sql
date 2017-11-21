-- 회원
ALTER TABLE MEMBER
	DROP CONSTRAINT PK_MEMBER; -- 회원 기본키

-- 회원
DROP TABLE MEMBER;

-- 회원
CREATE TABLE MEMBER (
	email       VARCHAR2(50) NOT NULL, -- 아이디
	password    varchar2(20) NULL,     -- 비밀번호
	nickname    varchar2(50) NULL,     -- 별명
	name        varchar2(50) NULL,     -- 실명
	phone_num   varchar2(13) NULL,     -- 전화번호
	gender      varchar2(10) NULL,     -- 성별
	
	total_ups   NUMBER(3)    NULL,     -- 총 추천수
	total_downs NUMBER(3)    NULL      -- 총 비추천수
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER ( -- 회원
		email ASC -- 아이디
	);

-- 회원
ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER -- 회원 기본키
		PRIMARY KEY (
			email -- 아이디
		);
		
		
-- 회원 입맛
ALTER TABLE MEMBER_TASTE
	DROP CONSTRAINT FK_TASTE_TO_MEMBER_TASTE; -- 입맛 -> 회원 입맛

-- 회원 입맛
ALTER TABLE MEMBER_TASTE
	DROP CONSTRAINT FK_MEMBER_TO_MEMBER_TASTE; -- 회원 -> 회원 입맛

-- 회원 입맛
DROP TABLE MEMBER_TASTE;

-- 회원 입맛
CREATE TABLE MEMBER_TASTE (
	email     VARCHAR2(50) NULL, -- 아이디
	taste_num NUMBER(2)    NULL  -- 맛 번호
);

-- 회원 입맛
ALTER TABLE MEMBER_TASTE
	ADD
		CONSTRAINT FK_TASTE_TO_MEMBER_TASTE -- 입맛 -> 회원 입맛
		FOREIGN KEY (
			taste_num -- 맛 번호
		)
		REFERENCES TASTE ( -- 입맛
			taste_num -- 맛 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 회원 입맛
ALTER TABLE MEMBER_TASTE
	ADD
		CONSTRAINT FK_MEMBER_TO_MEMBER_TASTE -- 회원 -> 회원 입맛
		FOREIGN KEY (
			email -- 아이디
		)
		REFERENCES MEMBER ( -- 회원
			email -- 아이디
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;		
		
-- 맛 + 정도
ALTER TABLE ALL_TASTE
	DROP CONSTRAINT FK_TASTE_TO_ALL_TASTE; -- 입맛 -> 맛 + 정도

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	DROP CONSTRAINT FK_DEGREE_TO_ALL_TASTE; -- 맛의 정도 -> 맛 + 정도

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	DROP CONSTRAINT PK_ALL_TASTE; -- 맛 + 정도 기본키

-- 맛 + 정도
DROP TABLE ALL_TASTE;

-- 맛 + 정도
CREATE TABLE ALL_TASTE (
	td_num     NUMBER(20) NOT NULL, -- 맛정도 번호
	taste_num  NUMBER(2)  NULL,     -- 맛 번호
	degree_num NUMBER(1)  NULL      -- 정도 번호
);

-- 맛 + 정도 기본키
CREATE UNIQUE INDEX PK_ALL_TASTE
	ON ALL_TASTE ( -- 맛 + 정도
		td_num ASC -- 맛정도 번호
	);

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	ADD
		CONSTRAINT PK_ALL_TASTE -- 맛 + 정도 기본키
		PRIMARY KEY (
			td_num -- 맛정도 번호
		);

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	ADD
		CONSTRAINT FK_TASTE_TO_ALL_TASTE -- 입맛 -> 맛 + 정도
		FOREIGN KEY (
			taste_num -- 맛 번호
		)
		REFERENCES TASTE ( -- 입맛
			taste_num -- 맛 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	ADD
		CONSTRAINT FK_DEGREE_TO_ALL_TASTE -- 맛의 정도 -> 맛 + 정도
		FOREIGN KEY (
			degree_num -- 정도 번호
		)
		REFERENCES DEGREE ( -- 맛의 정도
			degree_num -- 정도 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
	-- 입맛
ALTER TABLE TASTE
	DROP CONSTRAINT PK_TASTE; -- 입맛 기본키

-- 입맛
DROP TABLE TASTE;

-- 입맛
CREATE TABLE TASTE (
	taste_num  NUMBER(2)    NOT NULL, -- 맛 번호
	taste_name VARCHAR2(20) NULL      -- 맛 이름
);

-- 입맛 기본키
CREATE UNIQUE INDEX PK_TASTE
	ON TASTE ( -- 입맛
		taste_num ASC -- 맛 번호
	);

-- 입맛
ALTER TABLE TASTE
	ADD
		CONSTRAINT PK_TASTE -- 입맛 기본키
		PRIMARY KEY (
			taste_num -- 맛 번호
		);
		
-- 맛의 정도
ALTER TABLE DEGREE
	DROP CONSTRAINT PK_DEGREE; -- 맛의 정도 기본키

-- 맛의 정도
DROP TABLE DEGREE;

-- 맛의 정도
CREATE TABLE DEGREE (
	degree_num NUMBER(1)    NOT NULL, -- 정도 번호
	degree     VARCHAR2(10) NULL      -- 정도
);

-- 맛의 정도 기본키
CREATE UNIQUE INDEX PK_DEGREE
	ON DEGREE ( -- 맛의 정도
		degree_num ASC -- 정도 번호
	);

-- 맛의 정도
ALTER TABLE DEGREE
	ADD
		CONSTRAINT PK_DEGREE -- 맛의 정도 기본키
		PRIMARY KEY (
			degree_num -- 정도 번호
		);
		
		
		
-- 맛 + 정도
ALTER TABLE ALL_TASTE
	DROP CONSTRAINT FK_TASTE_TO_ALL_TASTE; -- 입맛 -> 맛 + 정도

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	DROP CONSTRAINT FK_DEGREE_TO_ALL_TASTE; -- 맛의 정도 -> 맛 + 정도

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	DROP CONSTRAINT PK_ALL_TASTE; -- 맛 + 정도 기본키

-- 맛 + 정도
DROP TABLE ALL_TASTE;

-- 맛 + 정도
CREATE TABLE ALL_TASTE (
	td_num     NUMBER(20) NOT NULL, -- 맛정도 번호
	taste_num  NUMBER(2)  NULL,     -- 맛 번호
	degree_num NUMBER(1)  NULL      -- 정도 번호
);

-- 맛 + 정도 기본키
CREATE UNIQUE INDEX PK_ALL_TASTE
	ON ALL_TASTE ( -- 맛 + 정도
		td_num ASC -- 맛정도 번호
	);

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	ADD
		CONSTRAINT PK_ALL_TASTE -- 맛 + 정도 기본키
		PRIMARY KEY (
			td_num -- 맛정도 번호
		);

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	ADD
		CONSTRAINT FK_TASTE_TO_ALL_TASTE -- 입맛 -> 맛 + 정도
		FOREIGN KEY (
			taste_num -- 맛 번호
		)
		REFERENCES TASTE ( -- 입맛
			taste_num -- 맛 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 맛 + 정도
ALTER TABLE ALL_TASTE
	ADD
		CONSTRAINT FK_DEGREE_TO_ALL_TASTE -- 맛의 정도 -> 맛 + 정도
		FOREIGN KEY (
			degree_num -- 정도 번호
		)
		REFERENCES DEGREE ( -- 맛의 정도
			degree_num -- 정도 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
		
-- 메뉴의 맛
ALTER TABLE MENU_TASTE
	DROP CONSTRAINT FK_ALL_TASTE_TO_MENU_TASTE; -- 맛 + 정도 -> 메뉴의 맛

-- 메뉴의 맛
ALTER TABLE MENU_TASTE
	DROP CONSTRAINT FK_MENU_TO_MENU_TASTE; -- 메뉴 -> 메뉴의 맛

-- 메뉴의 맛
DROP TABLE MENU_TASTE;

-- 메뉴의 맛
CREATE TABLE MENU_TASTE (
	td_num   NUMBER(20) NULL, -- 맛정도 번호
	menu_num NUMBER(20) NULL  -- 메뉴번호
);

-- 메뉴의 맛
ALTER TABLE MENU_TASTE
	ADD
		CONSTRAINT FK_ALL_TASTE_TO_MENU_TASTE -- 맛 + 정도 -> 메뉴의 맛
		FOREIGN KEY (
			td_num -- 맛정도 번호
		)
		REFERENCES ALL_TASTE ( -- 맛 + 정도
			td_num -- 맛정도 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 메뉴의 맛
ALTER TABLE MENU_TASTE
	ADD
		CONSTRAINT FK_MENU_TO_MENU_TASTE -- 메뉴 -> 메뉴의 맛
		FOREIGN KEY (
			menu_num -- 메뉴번호
		)
		REFERENCES MENU ( -- 메뉴
			menu_num -- 메뉴번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
		
-- 메뉴
ALTER TABLE MENU
	DROP CONSTRAINT FK_REVIEW_TO_MENU; -- 리뷰 -> 메뉴

-- 메뉴
ALTER TABLE MENU
	DROP CONSTRAINT PK_MENU; -- 메뉴 기본키

-- 메뉴
DROP TABLE MENU;

-- 메뉴
CREATE TABLE MENU (
	menu_num   NUMBER(20)   NOT NULL, -- 메뉴번호
	review_num NUMBER(12)   NULL,     -- 리뷰번호
	menu_name  VARCHAR2(30) NULL      -- 메뉴이름
);

-- 메뉴 기본키
CREATE UNIQUE INDEX PK_MENU
	ON MENU ( -- 메뉴
		menu_num ASC -- 메뉴번호
	);

-- 메뉴
ALTER TABLE MENU
	ADD
		CONSTRAINT PK_MENU -- 메뉴 기본키
		PRIMARY KEY (
			menu_num -- 메뉴번호
		);

-- 메뉴
ALTER TABLE MENU
	ADD
		CONSTRAINT FK_REVIEW_TO_MENU -- 리뷰 -> 메뉴
		FOREIGN KEY (
			review_num -- 리뷰번호
		)
		REFERENCES REVIEW ( -- 리뷰
			review_num -- 리뷰번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
		
-- 리뷰
ALTER TABLE REVIEW
	DROP CONSTRAINT FK_MEMBER_TO_REVIEW; -- 회원 -> 리뷰

-- 리뷰
ALTER TABLE REVIEW
	DROP CONSTRAINT PK_REVIEW; -- 리뷰 기본키

-- 리뷰
DROP TABLE REVIEW;

-- 리뷰
CREATE TABLE REVIEW (
	review_num NUMBER(12)     NOT NULL, -- 리뷰번호
	address    VARCHARr2(100) NULL,     -- 식당 주소
	store_name VARCHAR2(50)   NULL,     -- 식당 이름
	email      VARCHAR2(50)   NULL,     -- 이메일
	title      VARCHAR2(50)   NULL,     -- 제목
	content    VARCHAR2(600)  NULL,     -- 내용
	ratings    NUMBER(2)      NULL,     -- 별점
	ups        NUMBER(5)      NULL,     -- 추천수
	downs      NUMBER(5)      NULL,     -- 비추천수
	pos_x      VARCHAR2(25)   NULL,     -- X좌표
	pos_y      VARCHAR2(25)   NULL      -- Y좌표
);

-- 리뷰 기본키
CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW ( -- 리뷰
		review_num ASC -- 리뷰번호
	);

-- 리뷰
ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW -- 리뷰 기본키
		PRIMARY KEY (
			review_num -- 리뷰번호
		);

-- 리뷰
ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEW -- 회원 -> 리뷰
		FOREIGN KEY (
			email -- 이메일
		)
		REFERENCES MEMBER ( -- 회원
			email -- 아이디
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
		
		
-- 루트+리뷰 참조
ALTER TABLE TEMP_ROUTE
	DROP CONSTRAINT FK_ROUTE_TO_TEMP_ROUTE; -- 루트 -> 루트+리뷰 참조

-- 루트+리뷰 참조
ALTER TABLE TEMP_ROUTE
	DROP CONSTRAINT FK_REVIEW_TO_TEMP_ROUTE; -- 리뷰 -> 루트+리뷰 참조

-- 루트+리뷰 참조
DROP TABLE TEMP_ROUTE;

-- 루트+리뷰 참조
CREATE TABLE TEMP_ROUTE (
	route_num  NUMBER(20) NULL, -- 루트번호
	review_num NUMBER(12) NULL  -- 리뷰번호
);

-- 루트+리뷰 참조
ALTER TABLE TEMP_ROUTE
	ADD
		CONSTRAINT FK_ROUTE_TO_TEMP_ROUTE -- 루트 -> 루트+리뷰 참조
		FOREIGN KEY (
			route_num -- 루트번호
		)
		REFERENCES ROUTE ( -- 루트
			route_num -- 루트번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 루트+리뷰 참조
ALTER TABLE TEMP_ROUTE
	ADD
		CONSTRAINT FK_REVIEW_TO_TEMP_ROUTE -- 리뷰 -> 루트+리뷰 참조
		FOREIGN KEY (
			review_num -- 리뷰번호
		)
		REFERENCES REVIEW ( -- 리뷰
			review_num -- 리뷰번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		

	-- 루트
ALTER TABLE ROUTE
	DROP CONSTRAINT PK_ROUTE; -- 루트 기본키

-- 루트
DROP TABLE ROUTE;

-- 루트
CREATE TABLE ROUTE (
	route_num  NUMBER(20)    NOT NULL, -- 루트번호
	route_name VARCHAR2(50)  NOT NULL, -- 루트이름
	content    VARCHAR2(500) NOT NULL  -- 내용
);

-- 루트 기본키
CREATE UNIQUE INDEX PK_ROUTE
	ON ROUTE ( -- 루트
		route_num ASC -- 루트번호
	);

-- 루트
ALTER TABLE ROUTE
	ADD
		CONSTRAINT PK_ROUTE -- 루트 기본키
		PRIMARY KEY (
			route_num -- 루트번호
		);
		
		
-- 리뷰사진
ALTER TABLE REVIEW_PHOTO
	DROP CONSTRAINT FK_PHOTO_TO_REVIEW_PHOTO; -- 사진 -> 리뷰사진

-- 리뷰사진
ALTER TABLE REVIEW_PHOTO
	DROP CONSTRAINT FK_REVIEW_TO_REVIEW_PHOTO; -- 리뷰 -> 리뷰사진

-- 리뷰사진
DROP TABLE REVIEW_PHOTO;

-- 리뷰사진
CREATE TABLE REVIEW_PHOTO (
	photo_num  NUMBER(20) NULL, -- 사진번호
	review_num NUMBER(12) NULL  -- 리뷰번호
);

-- 리뷰사진
ALTER TABLE REVIEW_PHOTO
	ADD
		CONSTRAINT FK_PHOTO_TO_REVIEW_PHOTO -- 사진 -> 리뷰사진
		FOREIGN KEY (
			photo_num -- 사진번호
		)
		REFERENCES PHOTO ( -- 사진
			photo_num -- 사진번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 리뷰사진
ALTER TABLE REVIEW_PHOTO
	ADD
		CONSTRAINT FK_REVIEW_TO_REVIEW_PHOTO -- 리뷰 -> 리뷰사진
		FOREIGN KEY (
			review_num -- 리뷰번호
		)
		REFERENCES REVIEW ( -- 리뷰
			review_num -- 리뷰번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		

		-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
	DROP CONSTRAINT FK_MEMBER_TO_MISSION_CERT_BOARD; -- 회원 -> 미션 인증 게시판

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
	DROP CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_CERT_BOARD; -- 미션 -> 미션 인증 게시판

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
	DROP CONSTRAINT PK_MISSION_CERT_BOARD; -- 미션 인증 게시판 기본키

-- 미션 인증 게시판
DROP TABLE MISSION_CERT_BOARD;

-- 미션 인증 게시판
CREATE TABLE MISSION_CERT_BOARD (
	mission_cert_num NUMBER(20)    NOT NULL, -- 글 번호
	email            VARCHAR2(50)  NULL,     -- 아이디
	title            VARCHAR2(100) NULL,     -- 제목
	content          VARCHAR2(300) NULL,     -- 내용
	mission_num      NUMBER(20)    NULL      -- 미션번호
);

-- 미션 인증 게시판 기본키
CREATE UNIQUE INDEX PK_MISSION_CERT_BOARD
	ON MISSION_CERT_BOARD ( -- 미션 인증 게시판
		mission_cert_num ASC -- 글 번호
	);

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
	ADD
		CONSTRAINT PK_MISSION_CERT_BOARD -- 미션 인증 게시판 기본키
		PRIMARY KEY (
			mission_cert_num -- 글 번호
		);

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_MISSION_CERT_BOARD -- 회원 -> 미션 인증 게시판
		FOREIGN KEY (
			email -- 아이디
		)
		REFERENCES MEMBER ( -- 회원
			email -- 아이디
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
	ADD
		CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_CERT_BOARD -- 미션 -> 미션 인증 게시판
		FOREIGN KEY (
			mission_num -- 미션번호
		)
		REFERENCES MISSION_ADMIN ( -- 미션
			mission_num -- 미션번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
		
-- 미션
ALTER TABLE MISSION_ADMIN
	DROP CONSTRAINT PK_MISSION_ADMIN; -- 미션 기본키

-- 미션
DROP TABLE MISSION_ADMIN;

-- 미션
CREATE TABLE MISSION_ADMIN (
	mission_num     NUMBER(20)    NOT NULL, -- 미션번호
	mission_content VARCHAR2(600) NULL,     -- 미션내용
	CURRENT_PEOPLE  NUMBER(2)     NULL,     -- 현재인원
	MAX_PEOPLE      NUMBER(2)     NULL,     -- 최대인원
	START_DATE      DATE          NULL,     -- 시작날짜
	END_DATE        DATE          NULL,     -- 마감날짜
	mission_name    VARCHAR2(100) NULL      -- 미션이름
);

-- 미션 기본키
CREATE UNIQUE INDEX PK_MISSION_ADMIN
	ON MISSION_ADMIN ( -- 미션
		mission_num ASC -- 미션번호
	);

-- 미션
ALTER TABLE MISSION_ADMIN
	ADD
		CONSTRAINT PK_MISSION_ADMIN -- 미션 기본키
		PRIMARY KEY (
			mission_num -- 미션번호
		);
		
		
-- 미션에 참여한 회원
ALTER TABLE MISSION_MEMBER
	DROP CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_MEMBER; -- 미션 -> 미션에 참여한 회원

-- 미션에 참여한 회원
ALTER TABLE MISSION_MEMBER
	DROP CONSTRAINT FK_MEMBER_TO_MISSION_MEMBER; -- 회원 -> 미션에 참여한 회원

-- 미션에 참여한 회원
DROP TABLE MISSION_MEMBER;

-- 미션에 참여한 회원
CREATE TABLE MISSION_MEMBER (
	mission_num NUMBER(20)   NULL, -- 미션번호
	email       VARCHAR2(50) NULL  -- 아이디
);

-- 미션에 참여한 회원
ALTER TABLE MISSION_MEMBER
	ADD
		CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_MEMBER -- 미션 -> 미션에 참여한 회원
		FOREIGN KEY (
			mission_num -- 미션번호
		)
		REFERENCES MISSION_ADMIN ( -- 미션
			mission_num -- 미션번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 미션에 참여한 회원
ALTER TABLE MISSION_MEMBER
	ADD
		CONSTRAINT FK_MEMBER_TO_MISSION_MEMBER -- 회원 -> 미션에 참여한 회원
		FOREIGN KEY (
			email -- 아이디
		)
		REFERENCES MEMBER ( -- 회원
			email -- 아이디
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		

	-- 미션 사진
ALTER TABLE MISSION_PHOTO
	DROP CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_PHOTO; -- 미션 -> 미션 사진

-- 미션 사진
ALTER TABLE MISSION_PHOTO
	DROP CONSTRAINT FK_PHOTO_TO_MISSION_PHOTO; -- 사진 -> 미션 사진

-- 미션 사진
DROP TABLE MISSION_PHOTO;

-- 미션 사진
CREATE TABLE MISSION_PHOTO (
	mission_num NUMBER(20) NULL, -- 미션번호
	photo_num   NUMBER(20) NULL  -- 사진번호
);

-- 미션 사진
ALTER TABLE MISSION_PHOTO
	ADD
		CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_PHOTO -- 미션 -> 미션 사진
		FOREIGN KEY (
			mission_num -- 미션번호
		)
		REFERENCES MISSION_ADMIN ( -- 미션
			mission_num -- 미션번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 미션 사진
ALTER TABLE MISSION_PHOTO
	ADD
		CONSTRAINT FK_PHOTO_TO_MISSION_PHOTO -- 사진 -> 미션 사진
		FOREIGN KEY (
			photo_num -- 사진번호
		)
		REFERENCES PHOTO ( -- 사진
			photo_num -- 사진번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
		
-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
	DROP CONSTRAINT FK_PHOTO_TO_MISSION_CERT_PHOTO; -- 사진 -> 미션 인증 사진

-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
	DROP CONSTRAINT FK_MISSION_CERT_BOARD_TO_MISSION_CERT_PHOTO; -- 미션 인증 게시판 -> 미션 인증 사진

-- 미션 인증 사진
DROP TABLE MISSION_CERT_PHOTO;

-- 미션 인증 사진
CREATE TABLE MISSION_CERT_PHOTO (
	photo_num        NUMBER(20) NULL, -- 사진번호
	mission_cert_num NUMBER(20) NULL  -- 글 번호
);

-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
	ADD
		CONSTRAINT FK_PHOTO_TO_MISSION_CERT_PHOTO -- 사진 -> 미션 인증 사진
		FOREIGN KEY (
			photo_num -- 사진번호
		)
		REFERENCES PHOTO ( -- 사진
			photo_num -- 사진번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
	ADD
		CONSTRAINT FK_MISSION_CERT_BOARD_TO_MISSION_CERT_PHOTO -- 미션 인증 게시판 -> 미션 인증 사진
		FOREIGN KEY (
			mission_cert_num -- 글 번호
		)
		REFERENCES MISSION_CERT_BOARD ( -- 미션 인증 게시판
			mission_cert_num -- 글 번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
INSERT INTO TASTE (TASTE_NUM, TASTE_NAME) VALUES (1,'짠');
INSERT INTO TASTE VALUES (TASTE_NUM.NEXTVAL,'단');
INSERT INTO TASTE VALUES ("신");
INSERT INTO TASTE VALUES ("매운");
INSERT INTO TASTE VALUES ("감칠");
INSERT INTO TASTE VALUES ("쓴");
INSERT INTO TASTE VALUES ("싱거운");
INSERT INTO TASTE VALUES ("완벽한");

INSERT INTO DEGREE VALUES ("1");
INSERT INTO DEGREE VALUES ("2");	
INSERT INTO DEGREE VALUES ("3");

DELETE FROM TASTE
CREATE SEQUENCE TASTE_NUM;
CREATE SEQUENCE DEGREE_NUM;

SELECT * FROM TASTE;
		
		
		
