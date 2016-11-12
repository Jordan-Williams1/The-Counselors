CREATE DATABASE IF NOT EXISTS IDP;
USE IDP;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS child;
DROP TABLE IF EXISTS behaviors;
DROP TABLE IF EXISTS consequences;
DROP TABLE IF EXISTS rewards;
DROP TABLE IF EXISTS Event;

CREATE TABLE users
( userID varchar(10),
username varchar(100) NOT NULL,
password varchar(100) NOT NULL,
masterUserID int NOT NULL,
childrenPriv int NOT NULL,
childrenIDP boolean NOT NULL,
childrenBehHist boolean NOT NULL,
childrenDesc boolean NOT NULL,
familySchedPriv int NOT NULL,
behaviorPriv int NOT NULL,
conRewPriv int NOT NULL,
PRIMARY KEY (userID)
);

CREATE TABLE child
( childID varchar(10),
userID varchar(10),
name varchar(100) NOT NULL,
dateAdded date NOT NULL,
age int NOT NULL,
grade varchar(20) NOT NULL,
ExtrovertIntrovert int NOT NULL, 
OutgoingShy int NOT NULL,
LeaderFollower int NOT NULL,
ActiveCalm int NOT NULL, 
PlannerImpulsive int NOT NULL,
CaringUncaring int NOT NULL,
PersonalityNotes text NOT NULL,
Strengths text NOT NULL,
Weaknesses text NOT NULL,
MaturityLevel text NOT NULL,
Interests text NOT NULL,
DisciplineWorked text NOT NULL,
DisciplineNotWorked text NOT NULL,
PRIMARY KEY (childID),
CONSTRAINT fk_userID FOREIGN KEY (userID) references users(userID)
);

CREATE TABLE behaviors
( userID varchar(10),
childID varchar(10),
desiredBehavior varchar(255),
problemBehavior varchar(255),	
PRIMARY KEY (desiredBehavior, problemBehavior),
CONSTRAINT fk_childID1 FOREIGN KEY (childID) references child (childID)
);

CREATE TABLE consequences
( userID varchar(10),
childID varchar(10),
PBehavior varchar(255),
name varchar(255),
description text NOT NULL,
PRIMARY KEY (name),
CONSTRAINT fk_childID3 FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE rewards
( userID varchar(10),
childID varchar(10),
name varchar(255),
description text NOT NULL,
PRIMARY KEY (name),
CONSTRAINT fk_childID4 FOREIGN KEY (childID) references child(childID)
);


CREATE TABLE Event
( userID varchar(10),
eventID varchar(10),
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
PRIMARY KEY (eventID),
CONSTRAINT fk_child5 FOREIGN KEY (childIDE) REFERENCES child(childID),
CONSTRAINT fk_behaviors FOREIGN KEY (desiredbehaviorE, problembehaviorE) REFERENCES behaviors(desiredBehavior, problemBehavior),
CONSTRAINT fk_consequence FOREIGN KEY (consequence) REFERENCES consequences(name), 
CONSTRAINT fk_reward FOREIGN KEY (reward) REFERENCES rewards(name)
);

SET foreign_key_checks = 1;
