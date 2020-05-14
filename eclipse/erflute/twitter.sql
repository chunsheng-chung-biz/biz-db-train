

/* Create Tables */

CREATE TABLE COUNTRY
(
	COUNTRY_ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'Country ID',
	COUNTRY_NAME VARCHAR(100) COMMENT 'Country Name',
	PRIMARY KEY (COUNTRY_ID)
) ENGINE = InnoDB COMMENT = 'Country';


CREATE TABLE DISPLAY_LANGUAGE
(
	DISPLAY_LANGUAGE_ID BIGINT NOT NULL COMMENT 'Display Language ID',
	DISPLAY_LANGUAGE_NAME VARCHAR(100) NOT NULL COMMENT 'Display Language Name',
	PRIMARY KEY (DISPLAY_LANGUAGE_ID)
) ENGINE = InnoDB COMMENT = 'Didsplay Language';


-- User information
CREATE TABLE USER
(
	UID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'User ID : Unique UID in database as primary key.',
	EMAIL VARCHAR(127) NOT NULL COMMENT 'Email address : Email address of the user. Also used as login information.',
	USERNAME VARCHAR(20) NOT NULL COMMENT 'Username : Unique user id for @ mention etc.',
	PASSWORD_HASH VARCHAR(255) NOT NULL COMMENT 'Hashed password',
	PASSWORD_SALT CHAR(32) NOT NULL COMMENT 'Password salt : Random password salt for each user',
	CREATED_AT DATETIME NOT NULL COMMENT 'Table creation date',
	UPDATED_AT DATETIME NOT NULL COMMENT 'Table update date',
	PRIMARY KEY (UID)
) ENGINE = InnoDB COMMENT = 'User : User information';


CREATE TABLE USER_PROF
(
	USER_PROF_ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'User Profile ID : Unique UID in database as primary key.',
	NICKNAME VARCHAR(20) NOT NULL COMMENT 'Nickname : Displayed nickname for the account',
	PHONE_NUMBER VARCHAR(20) COMMENT 'Phone number',
	DATE_OF_BIRTH_AT DATE COMMENT 'Birthdate',
	ADDRESS VARCHAR(255) COMMENT 'Address',
	DISPLAY_LANGUAGE_ID BIGINT NOT NULL COMMENT 'Display language ID',
	COUNTRY_ID BIGINT NOT NULL COMMENT 'Country ID',
	LOCATION VARCHAR(127) COMMENT 'Location',
	URL VARCHAR(255) COMMENT 'URL',
	PORTRAIT BLOB COMMENT 'Portrait',
	HEADER_IMAGE BLOB COMMENT 'Header image',
	BIO VARCHAR(1023) COMMENT 'biography',
	PRIMARY KEY (USER_PROF_ID)
) ENGINE = InnoDB COMMENT = 'User Profile';



/* Create Indexes */

CREATE INDEX UQ_COUNTRY_COUNTRY_ID USING BTREE ON COUNTRY (COUNTRY_ID ASC);
CREATE INDEX UQ_DISPLAY_LANGUAGE_DISPLAY_LANGUAGE_ID USING BTREE ON DISPLAY_LANGUAGE (DISPLAY_LANGUAGE_ID ASC);
CREATE INDEX UQ_USER_UID USING BTREE ON USER (UID ASC);
CREATE INDEX UQ_USER_EMAIL USING BTREE ON USER (EMAIL DESC);
CREATE INDEX UQ_USER_PROF_USER_PROF_ID USING BTREE ON USER_PROF (USER_PROF_ID ASC);



/* Create Foreign Keys */

ALTER TABLE USER_PROF
	ADD CONSTRAINT FK_USER_PROF_COUNTRY FOREIGN KEY (COUNTRY_ID)
	REFERENCES COUNTRY (COUNTRY_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_PROF
	ADD CONSTRAINT FK_USER_PROF_DISPLAY_LANGUAGE FOREIGN KEY (DISPLAY_LANGUAGE_ID)
	REFERENCES DISPLAY_LANGUAGE (DISPLAY_LANGUAGE_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_PROF
	ADD CONSTRAINT FK_USER_PROF_USER FOREIGN KEY (USER_PROF_ID)
	REFERENCES USER (UID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



