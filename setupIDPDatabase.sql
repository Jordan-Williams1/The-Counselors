CREATE DATABASE IF NOT EXISTS IDP;
USE IDP;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS child;
DROP TABLE IF EXISTS behaviors;
DROP TABLE IF EXISTS consequences;
DROP TABLE IF EXISTS rewards;
DROP TABLE IF EXISTS Event;
SET foreign_key_checks = 1;

CREATE TABLE users
( userID varchar(10) primary key,
username varchar(100),
password varchar(100),
masterUserID int,
childrenPriv int,
childrenIDP boolean,
childrenBehHist boolean,
childrenDesc boolean,
familySchedPriv int,
behaviorPriv int,
conRewPriv int
);

CREATE TABLE child
( childID varchar(10) primary key,
userID varchar(10),
name varchar(100),
dateAdded date,
age int,
grade varchar(20),
ExtrovertIntrovert int, 
OutgoingShy int,
LeaderFollower int,
ActiveCalm int, 
PlannerImpulsive int,
CaringUncaring int,
PersonalityNotes text,
Strengths text,
Weaknesses text,
MaturityLevel text,
Interests text,
DisciplineWorked text,
DisciplineNotWorked text,
CONSTRAINT fk_childID1 FOREIGN KEY (userID) references users(userID)
);

CREATE TABLE behaviors
( childIDe varchar(10),
desiredBehavior varchar(255),
problemBehavior varchar(255),
PRIMARY KEY(desiredBehavior,problemBehavior),
CONSTRAINT fk_childID2 FOREIGN KEY (childIDe) references child(childID)
);

CREATE TABLE consequences
( childID varchar(10),
PBehavior varchar(255),
name varchar(255) primary key,
description text NOT NULL,
CONSTRAINT fk_childID3 FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE rewards
( userID varchar(10),
childID varchar(10),
name varchar(255) primary key,
description text NOT NULL,
CONSTRAINT fk_childID4 FOREIGN KEY (childID) references child(childID)
);


CREATE TABLE Event
( userID varchar(10),
eventID varchar(10) primary key,
childIDE varchar(10),
desiredbehaviorE varchar(255),
reward varchar(255),
problembehaviorE varchar(255),
consequence varchar(255), 
eventDeadlineDate date NOT NULL,
eventDeadlineTime time NOT NULL,
eventFinishDate date NOT NULL,
eventFinishTime time NOT NULL,
eventDescription text NOT NULL,
CONSTRAINT fk_child FOREIGN KEY (childIDE) REFERENCES child(childID),
CONSTRAINT fk_behaviors FOREIGN KEY (desiredbehaviorE, problembehaviorE) REFERENCES behaviors(desiredBehavior, problemBehavior),
CONSTRAINT fk_consequence FOREIGN KEY (consequence) REFERENCES consequences(name), 
CONSTRAINT fk_reward FOREIGN KEY (reward) REFERENCES rewards(name)
);