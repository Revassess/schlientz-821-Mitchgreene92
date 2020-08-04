--Sequence--
CREATE SEQUENCE t3sequence
 START WITH     6
 INCREMENT BY   3;
 
 
 drop table app_user;
 drop table user_role;
 drop table study_set_card;
 drop table study_set;
 drop table flashcard;
 
--Tables for ERD--
CREATE TABLE app_user (
user_id NUMBER(5) PRIMARY KEY,
username VARCHAR2(25) UNIQUE NOT NULL,
password VARCHAR2(25) NOT NULL,
first_name VARCHAR2(25) NOT NULL,
last_name VARCHAR2(25) NOT NULL,
role_id number(5)
);

CREATE TABLE user_role (
role_id NUMBER(5) PRIMARY KEY,
name VARCHAR2(25) UNIQUE NOT NULL
);

CREATE TABLE study_set_card (
study_set_id NUMBER(5),
flashcard_id NUMBER(5)
);

CREATE TABLE study_set(
study_set_id NUMBER(5) PRIMARY KEY,
name VARCHAR2(25) UNIQUE NOT NULL,
owner_id NUMBER(5)
);

DROP TABLE flashcard;
CREATE TABLE flashcard (
flashcard_id NUMBER(5) PRIMARY KEY,
question VARCHAR2(250) UNIQUE NOT NULL,
answer VARCHAR2(250) UNIQUE NOT NULL,
category_id NUMBER(5)
);

CREATE TABLE category (
category_id NUMBER(5) PRIMARY KEY,
name VARCHAR2(25) UNIQUE NOT NULL
);

--Constraints--
ALTER TABLE app_user ADD CONSTRAINT fk_app_user_role_id FOREIGN KEY (role_id) REFERENCES user_role(role_id);
ALTER TABLE study_set_card ADD CONSTRAINT fk_study_set_card_study_set_id FOREIGN KEY (study_set_id) REFERENCES study_set(study_set_id);
ALTER TABLE study_set_card ADD CONSTRAINT fk_study_set_card_flashcard_id FOREIGN KEY (flashcard_id) REFERENCES flashcard(flashcard_id);
ALTER TABLE flashcard ADD CONSTRAINT fk_flashcard_category_id FOREIGN KEY (category_id) REFERENCES category(category_id);
ALTER TABLE study_set ADD CONSTRAINT fk_study_set_owner_id FOREIGN KEY (owner_id) REFERENCES app_user(user_id);