     
      
   -- ----------------------------------------9.루트----------------------------------------
/*ALTER TABLE ROUTE
   DROP CONSTRAINT PK_ROUTE; -- 루트 기본키*/

-- 루트
DROP TABLE ROUTE cascade constraint;

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
      
      
      
      
      
      
      
------------------------------------------ 10. 루트+리뷰 참조----------------------------------------
/*ALTER TABLE TEMP_ROUTE
   DROP CONSTRAINT FK_ROUTE_TO_TEMP_ROUTE; -- 루트 -> 루트+리뷰 참조

-- 루트+리뷰 참조
ALTER TABLE TEMP_ROUTE
   DROP CONSTRAINT FK_REVIEW_TO_TEMP_ROUTE; -- 리뷰 -> 루트+리뷰 참조 */

-- 루트+리뷰 참조
DROP TABLE TEMP_ROUTE cascade constraint;

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
       
       ;

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
       
       ;
      

      
      
      
      




 
------------------------------------------ 11.미션----------------------------------------
/*ALTER TABLE MISSION_ADMIN
   DROP CONSTRAINT PK_MISSION_ADMIN; -- 미션 기본키*/

-- 미션
DROP TABLE MISSION_ADMIN cascade constraint;

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
      
             
       
       
       
       
    ------------------------------------------ 12.미션 인증 게시판----------------------------------------
/*ALTER TABLE MISSION_CERT_BOARD
   DROP CONSTRAINT FK_MEMBER_TO_MISSION_CERT_BOARD; -- 회원 -> 미션 인증 게시판

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
   DROP CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_CERT_BOARD; -- 미션 -> 미션 인증 게시판

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
   DROP CONSTRAINT PK_MISSION_CERT_BOARD; -- 미션 인증 게시판 기본키*/

-- 미션 인증 게시판
DROP TABLE MISSION_CERT_BOARD cascade constraint;

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
      CONSTRAINT FK_MEMBER_TO__CERT -- 회원 -> 미션 인증 게시판
      FOREIGN KEY (
         email -- 아이디
      )
      REFERENCES MEMBER ( -- 회원
         email -- 아이디
      )
       
       ;

-- 미션 인증 게시판
ALTER TABLE MISSION_CERT_BOARD
   ADD
      CONSTRAINT FK_MISSION_ADMIN_TO_CERT -- 미션 -> 미션 인증 게시판
      FOREIGN KEY (
         mission_num -- 미션번호
      )
      REFERENCES MISSION_ADMIN ( -- 미션
         mission_num -- 미션번호
      )
       
       ;
      
      

------------------------------------------ 13. 미션에 참여한 회원----------------------------------------
/*ALTER TABLE MISSION_MEMBER
   DROP CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_MEMBER; -- 미션 -> 미션에 참여한 회원

-- 미션에 참여한 회원
ALTER TABLE MISSION_MEMBER
   DROP CONSTRAINT FK_MEMBER_TO_MISSION_MEMBER; -- 회원 -> 미션에 참여한 회원*/

-- 미션에 참여한 회원
DROP TABLE MISSION_MEMBER cascade constraint;

-- 미션에 참여한 회원
CREATE TABLE MISSION_MEMBER (
   mission_num NUMBER(20)   NULL, -- 미션번호
   email       VARCHAR2(50) NULL  -- 아이디
);

-- 미션에 참여한 회원
ALTER TABLE MISSION_MEMBER
   ADD
      CONSTRAINT FK_MISSION_TO_MEMBER -- 미션 -> 미션에 참여한 회원
      FOREIGN KEY (
         mission_num -- 미션번호
      )
      REFERENCES MISSION_ADMIN ( -- 미션
         mission_num -- 미션번호
      )
       
       ;

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
       
       ;
      

 
       
----------------------------------14.사진----------------------------



------------------------------------------15. 리뷰사진----------------------------------------
/*ALTER TABLE REVIEW_PHOTO
   DROP CONSTRAINT FK_PHOTO_TO_REVIEW_PHOTO; -- 사진 -> 리뷰사진

-- 리뷰사진
ALTER TABLE REVIEW_PHOTO
   DROP CONSTRAINT FK_REVIEW_TO_REVIEW_PHOTO; -- 리뷰 -> 리뷰사진*/

-- 리뷰사진
DROP TABLE REVIEW_PHOTO cascade constraint;

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
       
       ;

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
       
       ;
      
       
       
   ------------------------------------------16. 미션 사진----------------------------------------
/*ALTER TABLE MISSION_PHOTO
   DROP CONSTRAINT FK_MISSION_ADMIN_TO_MISSION_PHOTO; -- 미션 -> 미션 사진

-- 미션 사진
ALTER TABLE MISSION_PHOTO
   DROP CONSTRAINT FK_PHOTO_TO_MISSION_PHOTO; -- 사진 -> 미션 사진*/

-- 미션 사진
DROP TABLE MISSION_PHOTO cascade constraint;

-- 미션 사진
CREATE TABLE MISSION_PHOTO (
   mission_num NUMBER(20) NULL, -- 미션번호
   photo_num   NUMBER(20) NULL  -- 사진번호
);

-- 미션 사진
ALTER TABLE MISSION_PHOTO
   ADD
      CONSTRAINT FK_MISSION_TO_MP -- 미션 -> 미션 사진
      FOREIGN KEY (
         mission_num -- 미션번호
      )
      REFERENCES MISSION_ADMIN ( -- 미션
         mission_num -- 미션번호
      )
       
       ;

-- 미션 사진
ALTER TABLE MISSION_PHOTO
   ADD
      CONSTRAINT FK_PHOTO_TO_MP -- 사진 -> 미션 사진
      FOREIGN KEY (
         photo_num -- 사진번호
      )
      REFERENCES PHOTO ( -- 사진
         photo_num -- 사진번호
      )
       
       ;
      
      
------------------------------------------17. 미션 인증 사진----------------------------------------
/*ALTER TABLE MISSION_CERT_PHOTO
   DROP CONSTRAINT FK_PHOTO_TO_MISSION_CERT_PHOTO; -- 사진 -> 미션 인증 사진

-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
   DROP CONSTRAINT FK_MISSION_CERT_BOARD_TO_MISSION_CERT_PHOTO; -- 미션 인증 게시판 -> 미션 인증 사진*/

-- 미션 인증 사진
DROP TABLE MISSION_CERT_PHOTO cascade constraint;

-- 미션 인증 사진
CREATE TABLE MISSION_CERT_PHOTO (
   photo_num        NUMBER(20) NULL, -- 사진번호
   mission_cert_num NUMBER(20) NULL  -- 글 번호
);

-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
   ADD
      CONSTRAINT FK_PHOTO_TO_CP -- 사진 -> 미션 인증 사진
      FOREIGN KEY (
         photo_num -- 사진번호
      )
      REFERENCES PHOTO ( -- 사진
         photo_num -- 사진번호
      )
       
       ;

-- 미션 인증 사진
ALTER TABLE MISSION_CERT_PHOTO
   ADD
      CONSTRAINT FK_CERT_BOARD_TO_CP -- 미션 인증 게시판 -> 미션 인증 사진
      FOREIGN KEY (
         mission_cert_num -- 글 번호
      )
      REFERENCES MISSION_CERT_BOARD ( -- 미션 인증 게시판
         mission_cert_num -- 글 번호
      )
       
       ;

