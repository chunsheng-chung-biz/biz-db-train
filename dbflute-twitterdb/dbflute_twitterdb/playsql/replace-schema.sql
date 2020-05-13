

/* Create Tables */

-- User information
CREATE TABLE USER
(
	NICKNAME VARCHAR(20) NOT NULL COMMENT 'Nickname : Displayed nickname for the account',
	EMAIL VARCHAR(127) NOT NULL COMMENT 'Email address : Email address of the user. Also used as login information.',
	USERNAME VARCHAR(20) NOT NULL COMMENT 'Username : Unique user id for @ mention etc.',
	PASSWORD_HASH CHAR(32) NOT NULL COMMENT 'Hashed password',
	PASSWORD_SALT CHAR(32) NOT NULL COMMENT 'Password salt : Random password salt for each user',
	PHONE_NUMBER VARCHAR(20) COMMENT 'Phone number',
	ADDRESS VARCHAR(255) COMMENT 'Address',
	DATE_OF_BIRTH_AT DATE COMMENT 'Birthdate',
	DISPLAY_LANGUAGE_ID INT NOT NULL COMMENT 'Display language ID',
	COUNTRY_ID INT NOT NULL COMMENT 'Country ID',
	JOIN_DATE_AT DATETIME NOT NULL COMMENT 'Join date',
	PORTRAIT BLOB COMMENT 'Portrait',
	BIO VARCHAR(1023) COMMENT 'biography',
	LOCATION VARCHAR(127) COMMENT 'Location',
	URL VARCHAR(255) COMMENT 'URL',
	HEADER_IMAGE BLOB COMMENT 'Header image',
	LAST_LOGIN_AT DATETIME COMMENT 'Last login',
	UID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'User ID : Unique UID in database as primary key.',
	CREATED_AT DATETIME NOT NULL COMMENT 'Table creation date',
	UPDATED_AT DATETIME NOT NULL COMMENT 'Table update date',
	PRIMARY KEY (UID)
) ENGINE = InnoDB COMMENT = 'User : User information';



