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
( username varchar(100),
password varchar(100),
masterUserID varchar(100),
masterPassword varchar(100),
childrenPriv int,
childrenIDP boolean,
childrenBehHist boolean,
childrenDesc boolean,
familySchedPriv int,
behaviorPriv int,
conRewPriv int,
primary key(username,password)
);

INSERT INTO users (username,password,masterUserID,childrenPriv,childrenIDP,childrenBehHist,childrenDesc,familySchedPriv,behaviorPriv,conRewPriv) 
values("95cf5007322b0c2a87ebb3d3089c4569","95cf5007322b0c2a87ebb3d3089c4569","95cf5007322b0c2a87ebb3d3089c4569","95cf5007322b0c2a87ebb3d3089c4569",2,TRUE,TRUE,TRUE,2,2,2);
INSERT INTO users (username,password,masterUserID,childrenPriv,childrenIDP,childrenBehHist,childrenDesc,familySchedPriv,behaviorPriv,conRewPriv) 
values("cc25eacef7db3c45a4944fb6e3957452","cc25eacef7db3c45a4944fb6e3957452","95cf5007322b0c2a87ebb3d3089c4569","95cf5007322b0c2a87ebb3d3089c4569",1,TRUE,TRUE,FALSE,2,1,1);
#test values for testMaster and testSub, representing a master account and a subaccount of the master account.


CREATE TABLE child
( childID int primary key,
username varchar(100),
password varchar(100),
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
CONSTRAINT fk_childID1 FOREIGN KEY (username,password) references users(username,password)
);

CREATE TABLE behaviors
( childID int,
desiredBehavior varchar(255),
problemBehavior varchar(255),
PRIMARY KEY(desiredBehavior,problemBehavior),
CONSTRAINT fk_childID2 FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE consequences
( childID int,
PBehavior varchar(255),
name varchar(255) primary key,
description text NOT NULL,
CONSTRAINT fk_childID3 FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE rewards
( childID int,
name varchar(255) primary key,
description text NOT NULL,
CONSTRAINT fk_childID4 FOREIGN KEY (childID) references child(childID)
);


CREATE TABLE Event
( eventID int primary key,
childID int,
desiredbehaviorE varchar(255),
reward varchar(255),
problembehaviorE varchar(255),
consequence varchar(255), 
eventDeadlineDate date NOT NULL,
eventDeadlineTime time NOT NULL,
eventFinishDate date NOT NULL,
eventFinishTime time NOT NULL,
eventDescription text NOT NULL,
CONSTRAINT fk_child FOREIGN KEY (childID) REFERENCES child(childID),
CONSTRAINT fk_behaviors FOREIGN KEY (desiredbehaviorE, problembehaviorE) REFERENCES behaviors(desiredBehavior, problemBehavior),
CONSTRAINT fk_consequence FOREIGN KEY (consequence) REFERENCES consequences(name), 
CONSTRAINT fk_reward FOREIGN KEY (reward) REFERENCES rewards(name)
);