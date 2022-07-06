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

INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�����', '/resources/image/�����.jpg', '��..����...', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�賲��', '/resources/image/�賲��.jpg', '�� ����!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�����', '/resources/image/�����.jpg', '�� ���� ������~', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '������', '/resources/image/������.jpg', '��! ��ť!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�ڻ��', '/resources/image/�ڻ��.jpg', '���� ����!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '������', '/resources/image/������.jpg', '����! ����!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '������', '/resources/image/������.jpg', '�����ϴ�.', 0, 'F');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�ſ���', '/resources/image/�ſ���.jpg', '���� �� �̷��� ��', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '����ö', '/resources/image/����ö.jpg', '���~ �ʹ� �⻵!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�̹ο�', '/resources/image/�̹ο�.jpg', '�ϸ��ϸ�', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�̿뼮', '/resources/image/�̿뼮.jpg', '(�׷����� �ø���)', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '�̿���', '/resources/image/�̿���.jpg', '�ƾ�..!!', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '���ּ�', '/resources/image/���ּ�.jpg', '����', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '��ö��', '/resources/image/��ö��.jpg', '�̰�.. ���ϱ���..', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '����', '/resources/image/����.jpg', '...��', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '������', '/resources/image/������.jpg', '������ (����)', 0, 'M');
INSERT INTO friends VALUES (seq_friends.NEXTVAL, '������', '/resources/image/������.jpg', '�����մϴ�~!!', 0, 'F');

COMMIT;
ROLLBACK;

SELECT *
FROM friends;

UPDATE friends
SET
    fri_love = 1
WHERE fri_name = '�����';

UPDATE friends
SET
    fri_love = 0;