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
SET foreign_key_checks = 1;

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
( childID int NOT NULL,
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
FOREIGN KEY (userID) references user(userID)
);

CREATE TABLE behaviors
( desiredBehavior varchar(255) NOT NULL,
problemBehavior varchar(255) NOT NULL,	
childID int NOT NULL,
PRIMARY KEY (desiredBehavior, problemBehavior, childID),
FOREIGN KEY (childID) references child(childID)
);
 
CREATE TABLE consequences
( name varchar(255) NOT NULL,
description text NOT NULL,
childID int NOT NULL,
PRIMARY KEY (name, childID),
FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE rewards
( name varchar(255) NOT NULL,
description text NOT NULL,
childID int NOT NULL,
PRIMARY KEY (name, childID),
FOREIGN KEY (childID) references child(childID)
);

CREATE TABLE problemEvent
( childID int NOT NULL,
problemBehavior varchar(255) NOT NULL,
eventDeadline timestamp NOT NULL,
eventFinishTime timestamp,
consequence varchar(255) NOT NULL,
eventDescription text NOT NULL,
PRIMARY KEY (),
FOREIGN KEY (childID) references child(childID),
FOREIGN KEY (problemBehavior) references behaviors(problemBehavior),
FOREIGN KEY (consequence) references consequences(name)
);

CREATE TABLE desiredEvent
( eventID int NOT NULL,
childID int NOT NULL,
problemBehavior varchar(255) NOT NULL,
eventDeadline timestamp NOT NULL,
eventFinishTime timestamp,
reward varchar(255) NOT NULL,
eventDescription text NOT NULL,
PRIMARY KEY (eventID,childID,problemBehavior,reward),
FOREIGN KEY (childID) references child(childID),
FOREIGN KEY (problemBehavior) references behaviors(problemBehavior),
FOREIGN KEY (reward) references rewards(name)
);