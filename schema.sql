create DATABASE myreadme 
DEFAULT CHARACTER SET UTF8
DEFAULT COLLATE UTF8_GENERAL_CI;

USE myreadme;

CREATE TABLE users
(
 id                  INT AUTO_INCREMENT NOT NULL ,
 registration_date TIMESTAMP  DEFAULT NOW()  NOT NULL ,
 email               CHAR(50)  UNIQUE NOT NULL  ,
 login              CHAR(20) NOT NULL UNIQUE ,
 pass            CHAR(20) NOT NULL ,
 avatar              CHAR(200)  NULL ,

PRIMARY KEY (id)
);

CREATE INDEX id_index ON users(id);
CREATE INDEX regdate_index ON users(registration_date);
CREATE INDEX login_index ON users(login);

CREATE TABLE content_type
(
 id         INT AUTO_INCREMENT NOT NULL ,
 content_name       CHAR(20) NOT NULL ,
 icon_class CHAR(20) NOT NULL ,

PRIMARY KEY (id)
);
CREATE INDEX id_index ON content_type(id);
CREATE INDEX name_index ON content_type(content_name);
CREATE INDEX class_index ON content_type(icon_class);

CREATE TABLE hashtag
(
id   INT AUTO_INCREMENT NOT NULL ,
 hashtag_name char (20) NOT NULL UNIQUE ,
 

PRIMARY KEY (id)
);
CREATE INDEX id_index ON hashtag(id);

CREATE TABLE post
(
 id              INT AUTO_INCREMENT NOT NULL ,
 create_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ,
 header          char(30) NOT NULL ,
 post_text       VARCHAR(500) NOT NULL ,
 autor_cit       char(30) NULL ,
 image           VARCHAR(200) NULL ,
 video           VARCHAR(200) NULL ,
 view_count      int NULL ,
 id_autor        int NOT NULL ,
 id_hashtag      int NOT NULL ,
 id_content_type int NOT NULL ,

PRIMARY KEY (id),
KEY fkIdx_7 (id_autor),
CONSTRAINT FK_7 FOREIGN KEY fkIdx_7 (id_autor) REFERENCES users (id),
KEY fkIdx_8 (id_hashtag),
CONSTRAINT FK_8 FOREIGN KEY fkIdx_8 (id_hashtag) REFERENCES hashtag (id),
KEY fkIdx_9 (id_content_type),
CONSTRAINT FK_9 FOREIGN KEY fkIdx_9 (id_content_type) REFERENCES content_type (id)
);
CREATE INDEX id_index ON post(id);
CREATE INDEX date_index ON post(create_date);
CREATE INDEX header_index ON post(header);



CREATE TABLE comments
(
 id INT AUTO_INCREMENT  NOT NULL ,
 comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
 comment_text VARCHAR(500) NOT NULL ,
 id_autor     INT   NOT NULL ,
 id_post      INT   NOT NULL ,

PRIMARY KEY (id),
KEY fkIdx_1 (id_autor),
CONSTRAINT FK_1 FOREIGN KEY fkIdx_1 (id_autor) REFERENCES users (id),
KEY fkIdx_2 (id_post),
CONSTRAINT FK_2 FOREIGN KEY fkIdx_2 (id_post) REFERENCES post (id)
);
CREATE INDEX id_index ON comments(id);
CREATE INDEX date_index ON comments(comment_date);
CREATE INDEX text_index ON comments(comment_text);

CREATE TABLE likes
(
 id INT AUTO_INCREMENT  NOT NULL ,
 id_user int NOT NULL ,
 id_post int NOT NULL ,

PRIMARY KEY (id),
KEY fkIdx_3 (id_user),
CONSTRAINT FK_3 FOREIGN KEY fkIdx_3 (id_user) REFERENCES users (id),
KEY fkIdx_4 (id_post),
CONSTRAINT FK_4 FOREIGN KEY fkIdx_4 (id_post) REFERENCES post (id)
);
CREATE INDEX id_index ON likes(id);

CREATE TABLE message
(
 id           INT AUTO_INCREMENT NOT NULL ,
 message_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ,
 messages_text VARCHAR(500) NOT NULL ,
 id_sender    int NOT NULL ,
 id_recipient int NOT NULL ,

PRIMARY KEY (id),
KEY fkIdx_5 (id_sender),
CONSTRAINT FK_5 FOREIGN KEY fkIdx_5 (id_sender) REFERENCES users (id),
KEY fkIdx_6 (id_recipient),
CONSTRAINT FK_6 FOREIGN KEY fkIdx_6 (id_recipient) REFERENCES users (id)
);
CREATE INDEX id_index ON message(id);
CREATE INDEX date_index ON message(message_date);
CREATE INDEX text_index ON message(messages_text);

CREATE TABLE subscribe
(
 id           INT AUTO_INCREMENT NOT NULL ,
 id_subscriber int NOT NULL ,
 id_donor      int NOT NULL ,

PRIMARY KEY (id),
KEY fkIdx_10 (id_subscriber),
CONSTRAINT FK_10 FOREIGN KEY fkIdx_10 (id_subscriber) REFERENCES users (id),
KEY fkIdx_12 (id_donor),
CONSTRAINT `FK_12` FOREIGN KEY `fkIdx_12` (`id_donor`) REFERENCES users (`id`)
);
CREATE INDEX id_index ON subscribe(id);