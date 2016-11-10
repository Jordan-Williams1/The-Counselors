CREATE DATABASE IF NOT EXISTS IDP;
USE IDP;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS child;
DROP TABLE IF EXISTS behaviors;
DROP TABLE IF EXISTS consequences;
DROP TABLE IF EXISTS rewards;
DROP TABLE IF EXISTS problemEvent;
DROP TABLE IF EXISTS desiredEvent;

CREATE TABLE user
( userID int NOT NULL,
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
( childID varchar(10) NOT NULL,
userID int NOT NULL,
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
PRIMARY KEY (userID,childID),
CONSTRAINT FOREIGN KEY (userID) references user(userID)
);

CREATE TABLE behaviors
( desiredBehavior varchar(255) NOT NULL,
problemBehavior varchar(255) NOT NULL,	
childID varchar(10) NOT NULL,
PRIMARY KEY (desiredBehavior, problemBehavior, childID),
CONSTRAINT FOREIGN KEY (childID) references child (childID)
);

CREATE TABLE consequences
( name varchar(255) NOT NULL,
description text NOT NULL,
childID varchar(10) NOT NULL,
PRIMARY KEY (name, childID),
CONSTRAINT FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE rewards
( name varchar(255) NOT NULL,
description text NOT NULL,
childID varchar(10) NOT NULL,
PRIMARY KEY (name, childID),
CONSTRAINT FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE problemEvent
( eventID varchar(10) NOT NULL,
childID varchar(10) NOT NULL,
problemBehavior varchar(255) NOT NULL,
consequence varchar(255) NOT NULL,
eventDeadlineDate date NOT NULL,
eventDeadlineTime time NOT NULL,
eventFinishDate date NOT NULL,
eventFinishTime time NOT NULL,
eventDescription text NOT NULL,
PRIMARY KEY (eventID,childID,problemBehavior,consequence),
CONSTRAINT FOREIGN KEY (childID) references child(childID),
CONSTRAINT FOREIGN KEY (problemBehavior) references behaviors(problemBehavior),
CONSTRAINT FOREIGN KEY (consequence) references consequences(name)
);

CREATE TABLE desiredEvent
( eventID varchar(10) NOT NULL,
childID varchar(10) NOT NULL,
desiredBehavior varchar(255) NOT NULL,
reward varchar(255) NOT NULL,
eventDeadlineDate date NOT NULL,
eventDeadlineTime time NOT NULL,
eventFinishDate date NOT NULL,
eventFinishTime time NOT NULL,
eventDescription text NOT NULL,
PRIMARY KEY (eventID,childID,desiredBehavior, reward),
CONSTRAINT FOREIGN KEY (childID) references child(childID),
CONSTRAINT FOREIGN KEY (desiredBehavior) references behaviors(desiredBehavior),
CONSTRAINT FOREIGN KEY (reward) references rewards(name)
);

SET foreign_key_checks = 1;
