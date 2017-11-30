/*
 * HANWOOL
 */




  		select *
  		from member m, member_taste mbt, taste t 
  		where m.email = #{value}
  		and m.email=mbt.email
  		and t.taste_num=mbt.taste_num(+)




------- DROP TABLE ---------------------------

DROP TABLE MEMBER cascade constraint; -- MEMBER

DROP TABLE TASTE cascade constraint; -- TASTE

DROP TABLE MEMBER_TASTE cascade constraint; -- MEMBER_TASTE

DROP TABLE AUTHORITY; -- AUTHORITIES

drop table authority cascade constraint;

delete from member


------- CREATE + ALTER TABLE --------------------------

CREATE TABLE MEMBER (
   email       VARCHAR2(50) NOT NULL, -- 아이디
   password    varchar2(80) NULL,     -- 비밀번호
   nickname    varchar2(50) NULL,     -- 별명
   name        varchar2(50) NULL,     -- 실명
   phone_num   varchar2(13) NULL,     -- 전화번호
   gender      varchar2(10) NULL,     -- 성별
   
   total_ups   NUMBER(3)    NULL,     -- 총 추천수
   total_downs NUMBER(3)    NULL,      -- 총 비추천수
   MEMBER_CERT NUMBER(1)	DEFAULT 1 NOT NULL -- 1 : 인증가능
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
      



      

------- ↑ MEMBER -------------------------------      
      
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
      
------- ↑ TASTE -----------------------------------
      
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
       
       ;

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
      
      ON DELETE CASCADE;
       
 ------- ↑ MEMBER_TASTE -----------------------------------     
            
/*권한 테이블 - ROLE_ADMIN, ROLE_MEMBER*/
CREATE TABLE AUTHORITY(
	EMAIL VARCHAR2(50),
	AUTHORITY VARCHAR2(20) NOT NULL,
	CONSTRAINT PK_AUTHORITY PRIMARY KEY(EMAIL, AUTHORITY),
	CONSTRAINT FK_AUTHORITY_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER
)

	ON DELETE CASCADE;

-------------------------------

CREATE TABLE AUTHORITY(
	EMAIL VARCHAR2(50),
	AUTHORITY VARCHAR2(20) NOT NULL,
	CONSTRAINT PK_AUTHORITY PRIMARY KEY(EMAIL, AUTHORITY),
	CONSTRAINT FK_AUTHORITY_MEMBER FOREIGN KEY(EMAIL) REFERENCES MEMBER
);    
    

CREATE TABLE AUTHORITY(
	EMAIL VARCHAR2(50),
	AUTHORITY VARCHAR2(20) NOT NULL,
	CONSTRAINT PK_AUTHORITY PRIMARY KEY(EMAIL, AUTHORITY)
);


CREATE TABLE AUTHORITY(
	EMAIL VARCHAR2(50),
	AUTHORITY VARCHAR2(20) NOT NULL
);


ALTER TABLE AUTHORITY
	ADD
		CONSTRAINT PK_AUTHORITY PRIMARY KEY(EMAIL, AUTHORITY);
		
ALTER TABLE AUTHORITY
	ADD
		CONSTRAINT FK_AUTHORITY_MEMBER 
		FOREIGN KEY(
		EMAIL
		) REFERENCES MEMBER(
		EMAIL
		)
		
		ON DELETE CASCADE;
		
	
		
		
		
		
		ALTER TABLE MEMBER_TASTE
   ADD
      CONSTRAINT FK_MEMBER_TO_MEMBER_TASTE -- 회원 -> 회원 입맛
      FOREIGN KEY (
         email -- 아이디
      )
      REFERENCES MEMBER ( -- 회원
         email -- 아이디
      )
      	ON DELETE CASCADE;
		
		
		
		
		
		
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
      		
		
		

	ON DELETE CASCADE
	ON UPDATE CASCADE;
    
    
    

select * from users;

select * from AUTHORITIES;

insert into AUTHORITIES VALUES('admin', 'ROLE_ADMIN')



















