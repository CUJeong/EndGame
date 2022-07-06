CREATE TABLE friends(
    fri_no NUMBER(3),
    fri_name VARCHAR2(40),
    fri_image VARCHAR2(80),
    fri_thanks VARCHAR2(80),
    fri_love NUMBER(3),
    fri_gender VARCHAR2(10),
    CONSTRAINT friends_pk PRIMARY KEY (fri_no)
);

DROP TABLE friends;

SELECT 'private ' 
|| decode(data_type, 'NUMBER', 'int ', 'String ')
|| lower(substr(column_name, 1, instr(column_name, '_')-1)) || initcap(substr(column_name, instr(column_name, '_')+1)) || ';' AS field
FROM user_tab_columns 
WHERE table_name = 'FRIENDS';

CREATE SEQUENCE seq_friends
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
       
DROP SEQUENCE seq_friends;

INSERT INTO friends VALUES (seq_friends.NEXTVAL, '강욱근', '/resources/image/강욱근.jpg', '고..고마워...', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '김남규', '/resources/image/김남규.jpg', '오 좋아!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '김범석', '/resources/image/김범석.jpg', '오 마이 지져스~', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '김지훈', '/resources/image/김지훈.jpg', '음! 땡큐!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '박상우', '/resources/image/박상우.jpg', '정말 고마워!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '박재훈', '/resources/image/박재훈.jpg', '으악! 고마워!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '소은지', '/resources/image/소은지.jpg', '고맙습니다.', 0, 'F');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '신예반', '/resources/image/신예반.jpg', '아유 뭘 이런걸 다', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '오현철', '/resources/image/오현철.jpg', '우와~ 너무 기뻐!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '이민우', '/resources/image/이민우.jpg', '하모하모', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '이용석', '/resources/image/이용석.jpg', '(그랜절을 올린다)', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '이원태', '/resources/image/이원태.jpg', '아앗..!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '이주석', '/resources/image/이주석.jpg', 'ㄱㅅ', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '이철현', '/resources/image/이철현.jpg', '이건.. 귀하군요..', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '전영', '/resources/image/전영.jpg', '...♡', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '조서준', '/resources/image/조서준.jpg', '고마워요 (찡긋)', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '최지혜', '/resources/image/최지혜.jpg', '감사합니다~!!', 0, 'F');

COMMIT;
ROLLBACK;

SELECT *
FROM friends;

UPDATE friends
SET
    fri_love = 1
WHERE fri_name = '강욱근';

UPDATE friends
SET
    fri_love = 0;