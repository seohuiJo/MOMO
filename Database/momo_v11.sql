﻿-----------------------------------
-- DROP 테이블
-----------------------------------
DROP TABLE BLACKLIST;
DROP TABLE NOTIFICATION;
DROP TABLE WE_COMMENT;
DROP TABLE MESSAGE;
DROP TABLE SERVICE_CENTER;
DROP TABLE CAREER;
DROP TABLE ME_COMMENT;
DROP TABLE PLACE_RESERVATION;
DROP TABLE PLACE;
DROP TABLE QNA;
DROP TABLE TEAM_JOIN;
DROP TABLE TEAM_SUGGESTION;
DROP TABLE NOTICE;
DROP TABLE ME;
DROP TABLE WE;
DROP TABLE MEMBER;

-----------------------------------
-- DROP 시퀀스
-----------------------------------
DROP SEQUENCE ME_SEQ;
DROP SEQUENCE MEC_SEQ;
DROP SEQUENCE MS_SEQ;
DROP SEQUENCE NOT_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE PLACE_SEQ;
DROP SEQUENCE PR_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE SERVICE_SEQ;
DROP SEQUENCE WC_SEQ;
DROP SEQUENCE WE_SEQ;

-----------------------------------
-- DROP 트리거
-----------------------------------
DROP TRIGGER trigger_career;
DROP TRIGGER trigger_message_from;
DROP TRIGGER trigger_message_to;
DROP TRIGGER trigger_me;
DROP TRIGGER trigger_mec_writer;
DROP TRIGGER trigger_mec_mid;
DROP TRIGGER trigger_teamsug_from;
DROP TRIGGER trigger_teamsug_to;
DROP TRIGGER trigger_teamsug_m;
DROP TRIGGER trigger_notification;
DROP TRIGGER trigger_service;
DROP TRIGGER trigger_notice;
DROP TRIGGER trigger_we;
DROP TRIGGER trigger_teamjo_t;
DROP TRIGGER trigger_teamjo_to;
DROP TRIGGER trigger_qna_q;
DROP TRIGGER trigger_qna_a;
DROP TRIGGER trigger_wec_wid;
DROP TRIGGER trigger_wec_writer;
DROP TRIGGER trigger_blacklist;
DROP TRIGGER trigger_place_user;
DROP TRIGGER trigger_place_p;

-----------------------------------
-- 시퀀스 생성
-----------------------------------

-- MEC_ID 시퀀스
CREATE SEQUENCE MEC_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- MS_ID 시퀀스
CREATE SEQUENCE MS_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- NOT_ID 시퀀스
CREATE SEQUENCE NOT_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- S_ID 시퀀스
CREATE SEQUENCE SERVICE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- WC_ID 시퀀스
CREATE SEQUENCE WC_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- P_NO 시퀀스
CREATE SEQUENCE PLACE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- W_ID 시퀀스
CREATE SEQUENCE WE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- M_ID 시퀀스
CREATE SEQUENCE ME_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
NOCYCLE
NOCACHE;

-- PR_ID 시퀀스
CREATE SEQUENCE PR_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- QNA_ID 시퀀스
CREATE SEQUENCE QNA_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-- N_ID 시퀀스
CREATE SEQUENCE NOTICE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
NOCACHE;

-----------------------------------
-- MEMBER 테이블 생성
-----------------------------------
CREATE TABLE MEMBER(
USER_ID VARCHAR2(40) PRIMARY KEY,
PASSWORD VARCHAR2(40) NOT NULL,
USER_NAME VARCHAR2(40) NOT NULL,
NICK_NAME VARCHAR2(40) NOT NULL UNIQUE,
GENDER VARCHAR2(10) NOT NULL CHECK(GENDER IN ('M', 'F')), 
BIRTH DATE NOT NULL,
ADDRESS CLOB NOT NULL,
PHONE VARCHAR2(40) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
INTEREST VARCHAR2(100) NOT NULL CHECK(INTEREST IN ('공모전', '스터디',  '취미', '여가', '스포츠', '기타')), 
M_STATUS VARCHAR2(10) NOT NULL CHECK(M_STATUS IN ('Y', 'N'))
);


-----------------------------------
-- QNA 테이블 생성
-----------------------------------
CREATE TABLE QNA (
QNA_ID NUMBER PRIMARY KEY,
Q_USER_ID VARCHAR2(40) NOT NULL,
A_USER_ID VARCHAR2(40) NOT NULL,
Q CLOB NOT NULL,
A CLOB NOT NULL,
FOREIGN KEY(Q_USER_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY(A_USER_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);

-----------------------------------
-- QNA 트리거생성
-----------------------------------

CREATE TRIGGER trigger_qna_q
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE QNA SET Q_USER_ID=:NEW.USER_ID;
END;
/

CREATE TRIGGER trigger_qna_a
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE QNA SET Q_USER_ID=:NEW.USER_ID;
END;
/


-----------------------------------
-- CAREER 테이블 생성
-----------------------------------

CREATE TABLE CAREER(
USER_ID VARCHAR2(40) PRIMARY KEY,
AWARDS CLOB,
CAREER CLOB,
PORTFOLIO CLOB,
C_FILE_NAME VARCHAR2(1000),
C_FILE_PATH VARCHAR2(1000),
FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);

-----------------------------------
-- CAREER 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_career
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE CAREER SET USER_ID=:NEW.USER_ID
WHERE USER_ID=:OLD.USER_ID;
END;
/

-----------------------------------
-- MESSAGE 테이블 생성
-----------------------------------

CREATE TABLE MESSAGE(
MS_ID NUMBER PRIMARY KEY,
FROM_ID VARCHAR2(40) NOT NULL,
TO_ID VARCHAR2(40) NOT NULL,
MS_CONTENT CLOB NOT NULL,
MS_CREATE_DATE DATE NOT NULL,
FOREIGN KEY (FROM_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY (TO_ID) REFERENCES MEMBER(USER_ID)ON DELETE CASCADE
);

-----------------------------------
-- MESSAGE 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_message_from
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE MESSAGE SET FROM_ID=:NEW.USER_ID;
END;
/

CREATE TRIGGER trigger_message_to
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE MESSAGE SET TO_ID=:NEW.USER_ID;
END;
/

-----------------------------------
-- ME 테이블 생성
-----------------------------------
CREATE TABLE ME (
 M_ID NUMBER PRIMARY KEY,
 M_WRITER VARCHAR2(40) NOT NULL,
 M_TITLE VARCHAR2(100) NOT NULL,
 M_CONTENT CLOB NOT NULL,
 M_CATEGORY VARCHAR2(1000) NOT NULL,
 M_CREATE_DATE DATE NOT NULL,
 M_MODIFY_DATE DATE,
 ME_STATUS VARCHAR2(10) NOT NULL CHECK(ME_STATUS IN ('Y', 'N')),
 ME_COUNT NUMBER DEFAULT 0 NOT NULL,
 M_LIKE NUMBER  DEFAULT 0 NOT NULL,
 M_DISLIKE NUMBER DEFAULT 0 NOT NULL,
 FOREIGN KEY(M_WRITER) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);

-----------------------------------
-- ME 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_me
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE ME SET M_WRITER=:NEW.USER_ID;
END;
/

-----------------------------------
-- ME_COMMENT 테이블 생성
-----------------------------------
CREATE TABLE ME_COMMENT(
MEC_ID NUMBER PRIMARY KEY,
MEC_WRITER VARCHAR2(40) NOT NULL,
M_ID NUMBER NOT NULL,
MEC_CONTENT CLOB NOT NULL,
MEC_CREATE_DATE DATE NOT NULL,
FOREIGN KEY(MEC_WRITER)REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY(M_ID)REFERENCES ME(M_ID)ON DELETE CASCADE
);

-----------------------------------
-- ME_COMMENT 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_mec_writer
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE ME_COMMENT SET MEC_WRITER=:NEW.USER_ID;
END;
/

CREATE TRIGGER trigger_mec_mid
AFTER UPDATE OF M_ID ON ME
FOR EACH ROW
BEGIN UPDATE ME_COMMENT SET M_ID=:NEW.M_ID;
END;
/


-----------------------------------
-- TEAM_SUGGESTION 테이블 생성
-----------------------------------
CREATE TABLE TEAM_SUGGESTION(
FROM_ID VARCHAR2(40),
M_ID NUMBER,
TO_ID VARCHAR2(40),
ACCEPT_STATUS VARCHAR2(10) CHECK(ACCEPT_STATUS IN ('Y', 'N')),
FOREIGN KEY (FROM_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY (TO_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY (M_ID) REFERENCES ME(M_ID) ON DELETE CASCADE,
PRIMARY KEY(FROM_ID, M_ID)
);

-----------------------------------
-- TEAM_SUGGESTION 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_teamsug_from
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE TEAM_SUGGESTION SET FROM_ID=:NEW.USER_ID;
END;
/

CREATE TRIGGER trigger_teamsug_to
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE TEAM_SUGGESTION SET TO_ID=:NEW.USER_ID;
END;
/

CREATE TRIGGER trigger_teamsug_m
AFTER UPDATE OF M_ID ON ME
FOR EACH ROW
BEGIN UPDATE TEAM_SUGGESTION SET M_ID=:NEW.M_ID;
END;
/


-----------------------------------
-- NOTIFICATION 테이블 생성
-----------------------------------
CREATE TABLE NOTIFICATION(
NOT_ID NUMBER PRIMARY KEY, 
USER_ID VARCHAR2(40) NOT NULL,
NOT_CONTENT VARCHAR2(1000) NOT NULL,
NOT_CREATE_DATE DATE NOT NULL,
QNA_ID NUMBER,
FOREIGN KEY(USER_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY(QNA_ID) REFERENCES QNA(QNA_ID) ON DELETE CASCADE
);

-----------------------------------
-- NOTIFICATION 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_notification
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE NOTIFICATION SET USER_ID=:NEW.USER_ID;
END;
/

-----------------------------------
-- SERVICE_CENTER 테이블 생성
-----------------------------------
  CREATE TABLE SERVICE_CENTER(
  S_ID NUMBER PRIMARY KEY, 
  USER_ID VARCHAR2(40) NOT NULL,
  S_TITLE VARCHAR2(1000) NOT NULL,
  S_CONTENT CLOB NOT NULL,
  FOREIGN KEY(USER_ID)REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
  );  

-----------------------------------
-- SERVICE_CENTER 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_service
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE SERVICE_CENTER SET USER_ID=:NEW.USER_ID;
END;
/


-----------------------------------
-- PLACE 테이블 생성
-----------------------------------
CREATE TABLE PLACE(
P_NO NUMBER PRIMARY KEY,
P_NAME VARCHAR2(1000) NOT NULL,
P_TIME VARCHAR2(1000) NOT NULL,
P_OPTION CLOB NOT NULL,
P_PRICE NUMBER NOT NULL,
P_FILE_NAME VARCHAR2(1000) NOT NULL,
P_FILE_PATH VARCHAR2(1000) NOT NULL,
P_ACCEPT_NUM NUMBER NOT NULL,
P_ADDRESS CLOB NOT NULL,
P_STATUS VARCHAR2(10)CHECK(P_STATUS IN ('Y', 'N')),
P_REG_DATE DATE NOT NULL
);

-----------------------------------
-- NOTICE 테이블 생성
-----------------------------------
CREATE TABLE NOTICE (
N_ID NUMBER PRIMARY KEY,
N_WRITER VARCHAR2(40) NOT NULL,
N_TITLE VARCHAR2(1000) NOT NULL,
N_CONTENT CLOB NOT NULL,
N_CREATE_DATE DATE NOT NULL,
N_COUNT NUMBER DEFAULT 0 NOT NULL,
FOREIGN KEY(N_WRITER) REFERENCES MEMBER(USER_ID)ON DELETE CASCADE
);

-----------------------------------
-- NOTICE 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_notice
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE NOTICE SET N_WRITER=:NEW.USER_ID;
END;
/

-----------------------------------
-- WE 테이블 생성
-----------------------------------
CREATE TABLE WE(
W_ID NUMBER PRIMARY KEY,
W_WRITER VARCHAR2(40) NOT NULL,
W_TITLE VARCHAR2(1000) NOT NULL,
W_CONTENT CLOB NOT NULL,
W_CATEGORY VARCHAR2(100) NOT NULL,
W_CREATE_DATE DATE NOT NULL,
W_MODIFY_DATE DATE,
TEAM_MEMBER NUMBER DEFAULT 0 NOT NULL,
W_DEADLINE DATE NOT NULL,
W_STATUS VARCHAR2(40) NOT NULL CHECK(W_STATUS IN ('Y', 'N')),
W_COUNT NUMBER DEFAULT 0 NOT NULL,
W_FILE_NAME VARCHAR2(1000) NOT NULL,
W_FILE_PATH VARCHAR2(1000) NOT NULL,
W_LIKE NUMBER DEFAULT 0  NOT NULL,
W_DISLIKE NUMBER DEFAULT 0  NOT NULL,
W_TEAM_NAME VARCHAR2(1000) NOT NULL,
FOREIGN KEY(W_WRITER) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);

-----------------------------------
-- WE 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_we
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE WE SET W_WRITER=:NEW.USER_ID;
END;
/

-----------------------------------
-- TEAM_JOIN 테이블 생성
-----------------------------------
CREATE TABLE TEAM_JOIN (
T_ID NUMBER,
FROM_ID VARCHAR2(40),
TO_ID VARCHAR2(40) NOT NULL,
ACCEPT_YN VARCHAR2(10) NOT NULL,
ACCEPT_DATE DATE,
REJECT_DATE DATE,
TEAM_NAME VARCHAR2(100),
FOREIGN KEY(T_ID) REFERENCES WE(W_ID) ON DELETE CASCADE,
FOREIGN KEY(TO_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
PRIMARY KEY(T_ID,FROM_ID)
);

-----------------------------------
-- TEAM_JOIN 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_teamjo_t
AFTER UPDATE OF W_ID ON WE
FOR EACH ROW
BEGIN UPDATE TEAM_JOIN SET T_ID=:NEW.W_ID;
END;
/

CREATE TRIGGER trigger_teamjo_to
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE TEAM_JOIN SET TO_ID=:NEW.USER_ID;
END;
/


-----------------------------------
-- WE_COMMENT 테이블 생성
-----------------------------------
CREATE TABLE WE_COMMENT(
WC_ID NUMBER PRIMARY KEY, 
WC_WRITER VARCHAR2(40) NOT NULL,
W_ID NUMBER NOT NULL,
WC_CONTENT CLOB NOT NULL,
WC_CREATE_DATE DATE NOT NULL,
FOREIGN KEY(WC_WRITER)REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY(W_ID)REFERENCES WE(W_ID) ON DELETE CASCADE
);

CREATE TRIGGER trigger_wec_writer
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE WE_COMMENT SET WC_WRITER=:NEW.USER_ID;
END;
/

-----------------------------------
-- WE_COMMENT 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_wec_wid
AFTER UPDATE OF W_ID ON WE
FOR EACH ROW
BEGIN UPDATE WE_COMMENT SET W_ID=:NEW.W_ID;
END;
/

-----------------------------------
-- BLACKLIST 테이블 생성
-----------------------------------
CREATE TABLE BLACKLIST(
 USER_ID VARCHAR2(40) PRIMARY KEY,
 REASON VARCHAR2(1000) NOT NULL, 
 FOREIGN KEY(USER_ID)REFERENCES MEMBER(USER_ID) ON DELETE CASCADE
);

-----------------------------------
-- BLACKLIST 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_blacklist
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE BLACKLIST SET USER_ID=:NEW.USER_ID;
END;
/

-----------------------------------
-- PLACE_RESERVATION 테이블 생성
-----------------------------------
CREATE TABLE PLACE_RESERVATION (
PR_ID NUMBER PRIMARY KEY,
USER_ID VARCHAR2(40) NOT NULL,
P_NO NUMBER NOT NULL,
PR_DATE DATE NOT NULL,
P_NAME VARCHAR2(1000) NOT NULL,
P_OPTION CLOB,
P_TIME VARCHAR2(1000) NOT NULL,
FOREIGN KEY(USER_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY(P_NO) REFERENCES PLACE(P_NO) ON DELETE CASCADE
);

-----------------------------------
-- PLACE_RESERVATION 트리거 생성
-----------------------------------

CREATE TRIGGER trigger_place_user
AFTER UPDATE OF USER_ID ON MEMBER
FOR EACH ROW
BEGIN UPDATE PLACE_RESERVATION SET USER_ID=:NEW.USER_ID;
END;
/

CREATE TRIGGER trigger_place_p
AFTER UPDATE OF P_NO ON PLACE
FOR EACH ROW
BEGIN UPDATE PLACE_RESERVATION SET P_NO=:NEW.P_NO;
END;
/


-----------------------------------
-- MEMBER 테이블 insert
-----------------------------------

INSERT INTO MEMBER VALUES('admin', 'admin', '관리자', '관리자', 'F', '1990- 01-01', '서울특별시 영등포구 당산동 78-9', '010-1234-4678', 'momo@naver.com', '기타', 'Y');
INSERT INTO MEMBER VALUES('ang11585', '1346zx','김시연','딸기곤듀시연','F','1998 -01-15', '인천광역시 계양구 경명대로 1045번길 9-9', '010-2373- 7652','ang11585@naver.com','공모전','Y');
INSERT INTO MEMBER VALUES('cosmos7256', 'rlejr11','조서희','둘기덕','F','1997- 07-06', '서울특별시 서초구 양재동 11-3', '010-8332- 7256','cosmos7256@naver.com','취미','Y');
INSERT INTO MEMBER VALUES('40min', 'iloveu','사공민','영자따룽해','M','1983- 02-01', '경기도 부천시 상동 13-2', '010-4791-4216','40min@naver.com','여가','Y');
INSERT INTO MEMBER VALUES('teddy', 'angel','박춘배','제갈쌍배','M','1979-12-31',  '경남 김해시 불암동 22-8 ', '010-6189-1127','boss@naver.com','스터디','Y');
INSERT INTO MEMBER VALUES('niceguy', 'iamgood','곽종팔','종팔뀨','M','1984- 05-23', '부산광역시 금정구 노포동 932-3', '010-0132- 9821','guy12@naver.com','기타','Y');
INSERT INTO MEMBER VALUES('tjsdbs0','asdf102612','김윤선','율스앙','F','2013- 10-26',
'경기도 김포시 김포대로 926번길 22','010-9924-1999','tjsdbs0@nate.com','취미','Y'); 
INSERT INTO MEMBER VALUES('tys1026','ty131026','김태율','태율왕자','M','2013- 10-25',
'서울시 강서구 등촌동 935-22','010-8956-6896','ty1026@nate.com','스포츠','Y');
INSERT INTO MEMBER VALUES ('sys0112','sys160112','김소율','율공주','F','2016-01- 12','
인천시 옹진군 영흥면 선재로 288,라동','010-5422- 3625','sys0112@naver.com','스터디','Y');
INSERT INTO MEMBER VALUES('lotte','magic1006','장동팔','참이슬','M','1988-06 -08',
'서울시 강남구 삼성동 21-2번지','010-8711-2511','lotte11@naver.com','공모전','Y');
INSERT INTO MEMBER VALUES ('candy','candy0315','고소자','처음처럼','F','2001 -03-15',
'서울시 영등포구 당산동 45-2','010-9213-2514','candy@naver.com','여가','N');
INSERT INTO MEMBER VALUES('doy', 'doy756', '김도연', '도이', 'F', '1998-02- 06', '서울시 양천구 남부순환로 31길 51', '010-9971-9984', 'doy@naver.com', '공모전',  'Y');
INSERT INTO MEMBER VALUES('moon', 'tpgml', '김문환', '세희', 'M', '1975-12- 28', '경기 안산시 단원구 선부광장북로 67 ', '010-2345-1212', 'moon@naver.com', '공모전', 'Y');
INSERT INTO MEMBER VALUES('an', 'wldks', '신지안', '지안', 'M', '1980-07-02',  '경기 수원시 권선구 곡선로 20', '010-3854-3243', 'an@naver.com', '스포츠', 'Y');
INSERT INTO MEMBER VALUES('sul', 'tjfghk', '설유하', '설화', 'F', '1987-02-16',  '경기도 광주시 도척면 노곡리 264-16', '010-4928-3927', 'sul@naver.com', '스포츠',  'Y');
INSERT INTO MEMBER VALUES('bella', 'qpffk', '김영서', '벨라', 'F', '1972-07- 04', '경기 안성시 서운로 791-9', '010-2343-3849', 'bella@naver.com', '공모전', 'Y');
INSERT INTO MEMBER VALUES('mark', 'akzm', '이민형', '마크', 'M', '2000-01- 12', '경기 평택시 팽성읍 신흥북로49번길 27', '010-4453-2341',  'markLee@naver.com', '스터디', 'Y');
INSERT INTO MEMBER VALUES('jojo', 'xoals', '이태민', '샤이니', 'M', '1962-06 -01', '대전광역시 동구 가양동 174-48', '010-7354-2315', 'jojo@naver.com', '취미',  'Y');
INSERT INTO MEMBER VALUES('jeny', 'wpsl', '이제니', '제니', 'F', '1992-04-04',  '대전광역시 서구 우명동 108-5', '010-1532-4222', 'jeny@naver.com', '기타', 'Y');



-----------------------------------
-- NOTICE 테이블 insert
-----------------------------------

INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '드디어 모모  서비스를 오픈하였습니다.','오픈행사해요. 놀러와요~',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '모모 이용수칙  입니다.','이용수칙 안지키면 바로 강퇴..',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '장소대관 관 련 공지사항','누구든 결제만 하면 장소대관이 가능합니다.',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '다양한 분야 의 모모 이용해 보세요','취미,공모전,게임 등등 원하는 분야의 사람들을  만나보세요',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '광고는 안됩 니다','광고성 글은 강제 삭제됩니다.',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '시스템 점검  안내','2020-07-30일 시스템 점검으로 사용이 원할하지 못할수 있습니다. 양해 부탁드립니 다.더좋은 서비스로 만나뵙겠습니다.',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '7월부터 관리 자 교체됩니다.','새로운 관리자도 어여쁜 마음으로 봐주세요.',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '새로운 관리 자입니다.','이제 얄짤 없습니다.',SYSDATE,0);
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'admin', '다들 장마철  감기 조심하세요.','마스크도 꼭 끼시고요.',SYSDATE,0);




-----------------------------------
-- CARRER 테이블 insert   
-----------------------------------

INSERT INTO CAREER VALUES('ang11585', '나의사랑상상공모전 은상', '시연스쿨 강 사','포트폴리오 첨부합니다.', '김시연.pdf', 'C:\test');
INSERT INTO CAREER VALUES('teddy', '조폭 경진대회 금상', '장미파 두목','파일로  대신 첨부합니다.', '박춘배.pdf', 'C:\test');
INSERT INTO CAREER VALUES('an', '문화부장관상', '공간디자이너 10년 경력', '포트 폴리오 첨부합니다.', 'jian.hwp', 'C:\test');
INSERT INTO CAREER VALUES('sul', '없음', '품질관리사 5년', '포트폴리오 첨부합니다 .', 'sulhwa.pdf', 'C:\test');
INSERT INTO CAREER VALUES('moon', '마케팅 공모전 당선', '공공기관 2년 사무직',  '포트폴리오 첨부합니다.', 'sehi.pdf', 'C:\test');
INSERT INTO CAREER VALUES('lotte','국가안보공모전 금상','국가안보위원장','포트폴리 오있습니다','장동팔.pdf', 'C:\test');
INSERT INTO CAREER VALUES('tys1026','축구사랑대회 우수상', '초등축구코치','포트폴 리오 Y', '김태율.pdf', 'C:\test');
INSERT INTO CAREER VALUES('mark','물부족 국가 포스터 대회 입상', '대학생','포트 폴리오 ', '이민형.pdf', 'C:\test');

-------------------------------------
-- ME 테이블 insert
-------------------------------------
INSERT INTO ME VALUES(ME_SEQ.NEXTVAL,'an','제주도에 같이 찍사나갈 분 구해요~','취미로 하시는 분보다 전문적으로 하시는 분과 함께 하고  싶습니다.','스터디',SYSDATE,NULL,'Y','0','0','0');
INSERT INTO ME VALUES(ME_SEQ.NEXTVAL,'sul','내가 아닌 우리가 되고 싶습니다.','어느 집단이든 섞여 들어갈 자신 있습니다.','공모전',SYSDATE,NULL,'Y','0','0','0');
INSERT INTO ME VALUES(ME_SEQ.NEXTVAL,'bella','여가시간을 같이 보내요.','저는 일명 인싸로 사람들과 잘 어울립니다. 같이 즐거운 시간을 보내고  싶어요.','취미',SYSDATE,NULL,'Y','0','0','0');
INSERT INTO ME VALUES(ME_SEQ.NEXTVAL,'ang11585','최고의 파트너가 되겠습 니다','배운것을 최대한 표출하겠습니다','공모전',SYSDATE,NULL,'Y','0','0','0');
INSERT INTO ME VALUES(ME_SEQ.NEXTVAL,'cosmos7256','함께산을타요','건강 한 삶을 위해 산을 오릅시다.','취미',SYSDATE,NULL,'Y','0','0','0');
INSERT INTO ME VALUES(ME_SEQ.NEXTVAL,'40min','카트라이더친구','같이 레벨업 합시다','여가',SYSDATE,NULL,'Y','0','0','0');
-----------------------------------
-- ME_COMMENT 테이블 insert
-----------------------------------

SELECT * FROM ME;

INSERT INTO ME_COMMENT VALUES(MEC_SEQ.NEXTVAL, 'teddy', '1', '언제  떠나시나요?', SYSDATE);
INSERT INTO ME_COMMENT VALUES(MEC_SEQ.NEXTVAL, 'mark', '2', '환경  사랑 공모전에 출품하려는데 같이 하실래요?', SYSDATE);
INSERT INTO ME_COMMENT VALUES(MEC_SEQ.NEXTVAL, 'niceguy', '3', '즐거 운 시간을 같이 보내고 싶네요 ㅎㅎ', SYSDATE);
INSERT INTO ME_COMMENT VALUES(MEC_SEQ.NEXTVAL,'niceguy','4','공모전경험  있으신가요?',SYSDATE);
INSERT INTO ME_COMMENT VALUES(MEC_SEQ.NEXTVAL,'teddy','5','이번주에도  모임있을까요?',SYSDATE);
INSERT INTO ME_COMMENT VALUES(MEC_SEQ.NEXTVAL,'ang11585','6','레벨이  어떻게 되시나요?',SYSDATE);

-----------------------------------
-- WE 테이블 insert
-----------------------------------
INSERT INTO WE VALUES(WE_SEQ.NEXTVAL, 'mark', '환경부에서 진행하는 환경  사랑 공모전 팀을 모집합니다.', '영상쪽 일 하시는 분 구합니다.', '공모전', SYSDATE,  NULL, DEFAULT, '2020-07-28', 'Y', DEFAULT ,'8.jpg', 'C:\test', 0, 0,  '환경짱짱1234');
INSERT INTO WE VALUES(WE_SEQ.NEXTVAL, 'teddy', '식구 구합니다.', '벌크업  가능하신 분, 운동하던 분 우대.', '취미', SYSDATE, NULL, DEFAULT, '2020-08-08',  'Y', DEFAULT ,'7.jpg', 'C:\test', 0, 0, '장미파');
INSERT INTO WE VALUES(WE_SEQ.NEXTVAL, 'moon', '마케팅 스터디원  구해요.', '마케팅 쪽 취업을 위해 함께 취업스터디 하실 분 구해요.', '스터디', SYSDATE,  NULL, DEFAULT, '2020-08-01', 'Y', DEFAULT ,'6.jpg', 'C:\test', 0, 0, ' 맛케팅');
INSERT INTO WE VALUES(WE_SEQ.NEXTVAL,'tjsdbs0','함께자전거타실분','자 전거라이딩같이하실분 모집합니다인원은10명내외입니다','취미','2020-06- 15',NULL,'1','2020-07-30','Y','0','5.jpg','C:\test','0','0','달리자');
INSERT INTO WE VALUES(WE_SEQ.NEXTVAL,'sys0112','JAVA함께  공부해요','JAVA 함께 공부하실분찾습니다','스터디','2020-07-10',NULL,'2','2020-07- 20','Y','0','3.jpg','C:\test','0','0','쉽다코딩!');
INSERT INTO WE VALUES(WE_SEQ.NEXTVAL,'lotte','아이디어 공모전','공모전함 께하면 당선할수있어요','공모전','2020-07-11',NULL,'0','2020-07- 15','Y','0','2.jpg','C:\test','0','0','아자아자');



-----------------------------------
-- WE_COMMENT 테이블 insert
-----------------------------------
INSERT INTO WE_COMMENT VALUES(WC_SEQ.NEXTVAL, 'jeny', 1, '솔로로 오래  활동했지만 이제 팀을 구합니다. 같이 하고 싶어요.', SYSDATE);
INSERT INTO WE_COMMENT VALUES(WC_SEQ.NEXTVAL, 'lotte', 2, '햄! 저  부천의 쌍도끼 봉팔입니다. 연락 기다리겠습니다.', SYSDATE);
INSERT INTO WE_COMMENT VALUES(WC_SEQ.NEXTVAL, '40min', 3, '오늘 가 입했습니다. 앞으로 잘 부탁드립니당~', SYSDATE);
INSERT INTO WE_COMMENT VALUES(WC_SEQ.NEXTVAL,'ang11585',1,'나이제한 있나요?',SYSDATE);
INSERT INTO WE_COMMENT VALUES(WC_SEQ.NEXTVAL,'candy',2,'지역이 어디 이신가요?',SYSDATE);
INSERT INTO WE_COMMENT VALUES(WC_SEQ.NEXTVAL,'ang11585',3,'기간은 얼 마나 되나요?',SYSDATE);


-----------------------------------
-- MESSAGE 테이블 insert
-----------------------------------
INSERT INTO MESSAGE VALUES(MS_SEQ.NEXTVAL, 'teddy', 'lotte', '봉팔이냐 . 오랜만이다. 조만간 연락하마 도끼 잘 갈고 기다리고 있어라.', SYSDATE);
INSERT INTO MESSAGE VALUES(MS_SEQ.NEXTVAL, '40min', 'jeny', '제니씨~  이름도 예쁘시네요 ㅎㅎ 얼굴도 예쁘실 거 같은데ㅎㅎ', SYSDATE);
INSERT INTO MESSAGE VALUES(MS_SEQ.NEXTVAL, 'mark', 'jeny', '전공이 어 떻게 되시나요?', SYSDATE);
INSERT INTO MESSAGE VALUES(MS_SEQ.NEXTVAL,'lotte','candy','난참이슬입니 다.',SYSDATE);
INSERT INTO  MESSAGE VALUES(MS_SEQ.NEXTVAL,'tys1026','sys0112','서울입 니다.',SYSDATE);
INSERT INTO MESSAGE VALUES(MS_SEQ.NEXTVAL,'40min','cosmos7256','마 감일알고싶습니다.',SYSDATE);


-----------------------------------
-- TEAM_SUGGESTION 테이블 생성
-----------------------------------
CREATE TABLE TEAM_SUGGESTION(
FROM_ID VARCHAR2(40),
M_ID NUMBER,
TO_ID VARCHAR2(40),
ACCEPT_STATUS VARCHAR2(10) CHECK(ACCEPT_STATUS IN ('Y', 'N')),
FOREIGN KEY (FROM_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY (TO_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
FOREIGN KEY (M_ID) REFERENCES ME(M_ID) ON DELETE CASCADE,
PRIMARY KEY(FROM_ID, M_ID)
);

-----------------------------------
-- NOTIFICATION 테이블 insert
-----------------------------------
INSERT INTO NOTIFICATION VALUES(NOT_SEQ.NEXTVAL, 'jeny', '회원가입을  축하합니다' ,SYSDATE, NULL);
INSERT INTO NOTIFICATION VALUES(NOT_SEQ.NEXTVAL, 'jeny', '회원가입을  축하합니다' , SYSDATE, NULL);
INSERT INTO NOTIFICATION VALUES(NOT_SEQ.NEXTVAL, 'teddy', '회원가 입을 축하합니다' ,SYSDATE, NULL);
INSERT INTO NOTIFICATION VALUES(NOT_SEQ.NEXTVAL, 'an', '회원가입을  축하합니다' , SYSDATE, NULL);
INSERT INTO NOTIFICATION VALUES(NOT_SEQ.NEXTVAL, 'mark', '회원가입 을 축하합니다' , SYSDATE, NULL);


-----------------------------------
-- SERVICE_CENTER 테이블 insert
-----------------------------------
INSERT INTO SERVICE_CENTER VALUES(SERVICE_SEQ.NEXTVAL, 'jeny', '성 희롱 쪽지 신고합니다.', '40min이라는 사람이 저에게 불쾌한 쪽지를 보냈어요. 확인 부탁드 립니다.');
INSERT INTO SERVICE_CENTER VALUES(SERVICE_SEQ.NEXTVAL, 'sul', '조폭 이 있는 거 같아요.', '장미파?라고 조폭인 거 같은데 여기서 조폭원을 모집하더라고요. 확인  부탁드려요.');
INSERT INTO SERVICE_CENTER VALUES(SERVICE_SEQ.NEXTVAL, 'mark', ' 장소 대관 결제가 안돼요.', '카드결제 하려는데 안되네요. 어떻게 해야 하나요?');
INSERT INTO SERVICE_CENTER VALUES(SERVICE_SEQ.NEXTVAL,  'ang11585','쪽지', '쪽지를 어떻게 보내야 하나요?');
INSERT INTO SERVICE_CENTER VALUES(SERVICE_SEQ.NEXTVAL,  'tys1026','나랑일힐래?', '꼭 파일을 첨부해야하나요?');
INSERT INTO SERVICE_CENTER VALUES(SERVICE_SEQ.NEXTVAL,  'cosmos7256','팀원제의', '팀원수락취소도 가능한가요?');


-----------------------------------
-- PLACE 테이블 insert
-----------------------------------
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'KH스터디룸', '13:00-17:00',  'A룸', 70000, '1.jpg', 'C:\test', 8, '서울시 영등포구 당산동', 'Y',  SYSDATE);
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'KH스터디룸','13:00-14:00',  'B룸', 60000, '2.jpg', 'C:\test', 6, '서울시 영등포구 당산동', 'N',  SYSDATE);
INSERT INTO PLACE VALUES(PLACE_SEQ.NEXTVAL,'크림스터디룸', '09:00- 10:00', 'A룸', 5000, '3.jpg', 'C:\test', 5, '서울시 양천구 신월동', 'N',  SYSDATE);




-----------------------------------
-- TEAM_JOIN 테이블 insert
-----------------------------------
INSERT INTO TEAM_JOIN VALUES(1, 'jojo', 'mark', 'Y', SYSDATE, NULL, '환 경짱짱1234');
INSERT INTO TEAM_JOIN VALUES(1, 'doy', 'mark', 'N', SYSDATE, NULL, '환 경짱짱1234');
INSERT INTO TEAM_JOIN VALUES(3, 'doy', 'moon', 'Y', SYSDATE, NULL, '맛 케팅');
INSERT INTO TEAM_JOIN VALUES(1,'cosmos7256', 'tjsdbs0', 'Y', SYSDATE,  NULL, '달리자');
INSERT INTO TEAM_JOIN VALUES(3,'teddy', 'sys0112', 'Y', SYSDATE, NULL,  '쉽다코딩!');
INSERT INTO TEAM_JOIN VALUES(3,'niceguy', 'sys0112', 'Y', SYSDATE,  NULL,'쉽다코딩!');



-----------------------------------
-- QNA 테이블 insert
-----------------------------------
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'an', 'mark', '팀원을 모집할  때 가장 중요하게 생각하는 부분이 무엇인가요?', '끊임 없이 소통할 수 있느냐 입니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'jeny', 'bella', '팀원과 문제가  생겼을 때 어떻게 해결하시나요?', '따로 자리를 만들어 진솔하게 대화하는 시간을 갖습니 다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'teddy', 'cosmos7256',  'MBTI 유형이 무엇인가요?', 'ENTJ 입니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'doy', 'sul', '여가시간을 주로 무 엇을 하면서 보내나요?', '주로 혼자 시간을 보내는데 독서를 하거나 음악을 듣습니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'moon', 'jojo', '잘하는 운동은  무엇인가요?', '농구를 즐겨합니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'tys1026', 'lotte', '평소 건 강 관리를 어떻게 하시나요?', '여가시간을 활용하여 운동을 하고, 영양제를 먹습니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'sys0112', 'ang11585', '팀원들을  효과적으로 동기부여할 수 있는 방법은 뭐라고 생각하시나요?', '제가 앞장서서 일하는 것이 확 실한 동기부여가 된다고 생각합니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'bella', 'doy', '팀을 위해서 어디 까지 할 수 있나요?', '팀을 위해서 저의 여가시간을 희생할 수 있습니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'jojo', 'sys0112', '개인보다 팀 이 더 낫다고 생각하는 이유는 무엇인가요?', '한명보다 여럿일 때 서로의 단점을 채워주며 더  나은 결과물을 도출할 수 있다고 생각합니다.');
INSERT INTO QNA VALUES(QNA_SEQ.NEXTVAL, 'cosmos7256', 'tys1026', ' 자신이 생각하는 이상적인 팀은?', '소통하는 팀입니다.');

-----------------------------------
-- PLACE_RESERVATION 테이블 insert
-----------------------------------
INSERT INTO PLACE_RESERVATION VALUES(PR_SEQ.NEXTVAL, 'ang11585', 1,  '2020-07-06','KH스터디룸', 'A룸','13:00-17:00');
INSERT INTO PLACE_RESERVATION VALUES(PR_SEQ.NEXTVAL, 'niceguy', 2,  '2020-07-06', 'KH스터디룸', 'B룸','13:00-14:00');

-----------------------------------
-- BLACKLIST 테이블 insert
-----------------------------------
INSERT INTO BLACKLIST VALUES('candy', '욕설');

commit;

UPDATE PLACE SET P_FILE_NAME ='1.jpg'
WHERE P_NO='1';
UPDATE PLACE SET P_FILE_NAME ='2.jpg'
WHERE P_NO='2';
UPDATE PLACE SET P_FILE_NAME ='3.jpg'
WHERE P_NO='3';

COMMIT;

