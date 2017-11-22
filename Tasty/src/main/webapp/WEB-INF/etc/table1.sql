/* table1.sql 파일 : 회원, 리뷰, 맛 관련 테이블들 
 * table2.sql 파일: 루트, 미션, 사진들 관련 테이블들 
 * 
 */


-------------------------------------1.회원------------------------------

/*ALTER TABLE MEMBER
   DROP CONSTRAINT PK_MEMBER; --회원 기본키*/

-- 회원
DROP TABLE MEMBER cascade constraint;

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
      
      
      
     
      
--   ---------------------------- 2.입맛-------------------------------------------------------------

/*ALTER TABLE TASTE
   DROP CONSTRAINT PK_TASTE; -- 입맛 기본키*/

-- 입맛
DROP TABLE TASTE cascade constraint;

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
      
------------------------------------------3.맛의 정도----------------------------------------
/*ALTER TABLE DEGREE
   DROP CONSTRAINT PK_DEGREE; -- 맛의 정도 기본키*/

-- 맛의 정도
DROP TABLE DEGREE cascade constraint;

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
      
            
      
      
      
------------------------------------------4.회원 입맛----------------------------------------
/*ALTER TABLE MEMBER_TASTE
   DROP CONSTRAINT FK_TASTE_TO_MEMBER_TASTE; -- 입맛 -> 회원 입맛

-- 회원 입맛
ALTER TABLE MEMBER_TASTE
   DROP CONSTRAINT FK_MEMBER_TO_MEMBER_TASTE; -- 회원 -> 회원 입맛*/

-- 회원 입맛
DROP TABLE MEMBER_TASTE cascade constraint;

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
       
       ;      
      
      
      
      
      
      
------------------------------------------5. 맛 + 정도----------------------------------------
/*ALTER TABLE ALL_TASTE
   DROP CONSTRAINT FK_TASTE_TO_ALL_TASTE; -- 입맛 -> 맛 + 정도

-- 맛 + 정도
ALTER TABLE ALL_TASTE
   DROP CONSTRAINT FK_DEGREE_TO_ALL_TASTE; -- 맛의 정도 -> 맛 + 정도

-- 맛 + 정도
ALTER TABLE ALL_TASTE
   DROP CONSTRAINT PK_ALL_TASTE; -- 맛 + 정도 기본키*/

-- 맛 + 정도
DROP TABLE ALL_TASTE cascade constraint;

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
       
       ;

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
       
       ;
      

      

      
------------------------------------------6. 리뷰----------------------------------------
/*ALTER TABLE REVIEW
   DROP CONSTRAINT FK_MEMBER_TO_REVIEW; -- 회원 -> 리뷰

-- 리뷰
ALTER TABLE REVIEW
   DROP CONSTRAINT PK_REVIEW; -- 리뷰 기본키 */

-- 리뷰
DROP TABLE REVIEW cascade constraint;

-- 리뷰
CREATE TABLE REVIEW (
   review_num NUMBER(12)     NOT NULL, -- 리뷰번호
   address    VARCHAR2(100) NULL,     -- 식당 주소
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
       
       ;
            
      

      
      
------------------------------------------7. 메뉴----------------------------------------
/*ALTER TABLE MENU
   DROP CONSTRAINT FK_REVIEW_TO_MENU; -- 리뷰 -> 메뉴

-- 메뉴
ALTER TABLE MENU
   DROP CONSTRAINT PK_MENU; -- 메뉴 기본키 */

-- 메뉴
DROP TABLE MENU cascade constraint;

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
       
       ;
      
      

            
  
      
      
      
      
-- ----------------------------------------8.메뉴의 맛----------------------------------------
/*ALTER TABLE MENU_TASTE
   DROP CONSTRAINT FK_ALL_TASTE_TO_MENU_TASTE; -- 맛 + 정도 -> 메뉴의 맛

-- 메뉴의 맛
ALTER TABLE MENU_TASTE
   DROP CONSTRAINT FK_MENU_TO_MENU_TASTE; -- 메뉴 -> 메뉴의 맛 */

-- 메뉴의 맛
DROP TABLE MENU_TASTE cascade constraint;

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
       
       ;

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
       
       ;
      
      

      
      
 
      
      
      
      

--

drop sequence taste_seq;
create sequence taste_seq;

drop sequence degree_seq;
create sequence degree_seq;

delete from taste;
delete from degree;

INSERT INTO TASTE VALUES (taste_seq.nextval,'짠');
INSERT INTO TASTE VALUES (taste_seq.nextval,'단');
INSERT INTO TASTE VALUES (taste_seq.nextval,'신');
INSERT INTO TASTE VALUES (taste_seq.nextval,'매운');
INSERT INTO TASTE VALUES (taste_seq.nextval,'감칠');
INSERT INTO TASTE VALUES (taste_seq.nextval,'쓴');
INSERT INTO TASTE VALUES (taste_seq.nextval,'싱거운');
INSERT INTO TASTE VALUES (taste_seq.nextval,'완벽한');

INSERT INTO DEGREE VALUES (degree_seq.nextval,'1');
INSERT INTO DEGREE VALUES (degree_seq.nextval,'2');   
INSERT INTO DEGREE VALUES (degree_seq.nextval,'3');



      