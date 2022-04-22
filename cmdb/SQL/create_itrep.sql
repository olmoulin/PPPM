DROP TABLE USERS;
DROP TABLE SITE;
DROP TABLE LOGS;
DROP TABLE SOFTWARE;
DROP TABLE SOFTWARE_VERSION;
DROP TABLE SOFTWARE_DOCUMENTS;
DROP TABLE INDX;
DROP TABLE SERVER;
DROP TABLE SERVER_MEMORY;
DROP TABLE SERVER_DISK;
DROP TABLE SERVER_PROC;
DROP TABLE SERVER_NETWORK;
DROP TABLE SERVER_ACTIVITY;
DROP TABLE BACKUP_CHECK;
DROP TABLE RACK;
DROP TABLE ROOM;
DROP TABLE VENDOR_CONTRACT;
DROP TABLE OS;
DROP TABLE SP;
DROP TABLE SERVICE;
DROP TABLE SERVER_SERVICE;


CREATE TABLE USERS(LOGIN char(20),PWD char(20),NAME char(50),FORNAME char(30),ROLE char(20),LDAPLOGIN char(40),ADM char(20),DISABLED char(20));
CREATE TABLE SITE(ID char(20),NAME char(200),DESCRIPTION TEXT);
CREATE TABLE SOFTWARE(ID char(20),NAME char(200),DESCRIPTION TEXT,SITEID char(20),VENDORID char(20));
CREATE TABLE SOFTWARE_VERSION(ID char(20),SOFTWAREID char(20),VERSION char(20),DESCRIPTION TEXT,CCFORM char(20),GOLIVE char(20),SERVERID char(200),ACTIVE char(1),CONTRACTID char(20));
CREATE TABLE SOFTWARE_INSTANCE(VERSIONID char(20),SERVERID char(20));
CREATE TABLE SOFTWARE_DOCUMENTS(SOFTWAREID char(20),FORMIT044 char(1), FORMIT044_PATH char(255),FORMIT016 char(1), FORMIT16_PATH char(255));
CREATE TABLE SOFTWARE_INCIDENT(ID char(20),VERSIONID char(20),TITLE char(255),DESCRIPTION TEXT,ACTION TEXT,RESULT TEXT,CHECKED char(20));
CREATE TABLE SERVER(ID char(200),DESCRIPTION text,RACKID char(20),U char(20),USIZE char(20),VIRTUAL char(1),VIRTUALHOST char(200),CONTRACTID char(20),SITEID char(20),OSID char(20),SPID char(20),VENDORID char(20));
CREATE TABLE SWITCH(ID char(200),DESCRIPTION text,RACKID char(20),U char(20),USIZE char(20),NBPLUG char(20),CONTRACTID char(20),SITEID char(20),VENDORID char(20));
CREATE TABLE SWITCH_POWER(SWITCHID char(200),POWERTYPE char(200),POWERCAPACITY char(20),POWERID char(20));
CREATE TABLE BACKUP(ID char(200),DESCRIPTION text,RACKID char(20),U char(20),USIZE char(20),CONTRACTID char(20),SITEID char(20),VENDORID char(20));
CREATE TABLE BACKUP_POWER(BACKUPID char(200),POWERTYPE char(200),POWERCAPACITY char(20),POWERID char(20));
CREATE TABLE BACKUP_NETWORK(BACKUPID char(20),NETWORKTYPE char(200),NETWORKSPEED char(20),NETWORKADDRESS char(40),NETWORKMASK char(40),NETWORKGATEWAY char(40),NETWORKID char(20));
CREATE TABLE OTHER(ID char(200),DESCRIPTION text,RACKID char(20),U char(20),USIZE char(20),CONTRACTID char(20),SITEID char(20),VENDORID char(20));
CREATE TABLE OTHER_POWER(OTHERID char(200),POWERTYPE char(200),POWERCAPACITY char(20),POWERID char(20));
CREATE TABLE OTHER_NETWORK(OTHERID char(20),NETWORKTYPE char(200),NETWORKSPEED char(20),NETWORKADDRESS char(40),NETWORKMASK char(40),NETWORKGATEWAY char(40),NETWORKID char(20));
CREATE TABLE SAN(ID char(200),DESCRIPTION text,RACKID char(20),U char(20),USIZE char(20),CONTRACTID char(20),SITEID char(20),VENDORID char(20),NBPLUG char(20));
CREATE TABLE SAN_NETWORK(SANID char(20),NETWORKTYPE char(200),NETWORKSPEED char(20),NETWORKADDRESS char(40),NETWORKMASK char(40),NETWORKGATEWAY char(40),NETWORKID char(20));
CREATE TABLE SAN_POWER(SANID char(200),POWERTYPE char(200),POWERCAPACITY char(20),POWERID char(20));
CREATE TABLE SAN_DISK(SANID char(20),DISKTYPE char(200),DISKSIZE char(20),DISKID char(20));
CREATE TABLE SAN_VOLUME(SANID char(20),VOLUMENAME char(200),VOLUMESIZE char(20),VOLUMEID char(20));
CREATE TABLE NETCABLE(ELEMENTID char(200),ELEMENTTYPE char(20),SWITCHID char(200),PLUG char(20));
CREATE TABLE POWERCABLE(ELEMENTID char(200),ELEMENTTYPE char(20),PDUID char(200),PLUG char(20));
CREATE TABLE PDU(ID char(200),DESCRIPTION text,PLUGID char(20),NBPLUG char(20),CAPACITY char(20),RACKID char(20));
CREATE TABLE PLUG(ID char(200),DESCRIPTION text,ROOMID char(20),CAPACITY char(20));
CREATE TABLE RACK(ID char(200),DESCRIPTION text,ROOMID char(20),NBU char(20),VENDORID char(20));
CREATE TABLE ROOM(ID char(200),DESCRIPTION text,SITEID char(20));
CREATE TABLE SERVER_MEMORY(SERVERID char(20),MEMORYTYPE char(200),MEMORYSIZE char(20),MEMORYID char(20));
CREATE TABLE SERVER_DISK(SERVERID char(20),DISKTYPE char(200),DISKSIZE char(20),DISKID char(20));
CREATE TABLE SERVER_POWER(SERVERID char(20),POWERTYPE char(200),POWERCAPACITY char(20),POWERID char(20));
CREATE TABLE SERVER_SAN(SERVERID char(20),SANID char(20),VOLUMEID char(200),SERVERSANID char(20));
CREATE TABLE FIBERCABLE(ELEMENTID char(200),ELEMENTTYPE char(20),SANID char(200),PLUG char(20));
CREATE TABLE SERVER_PROC(SERVERID char(20),PROCTYPE char(200),PROCCORE char(20),PROCID char(20));
CREATE TABLE SERVER_NETWORK(SERVERID char(20),NETWORKTYPE char(200),NETWORKSPEED char(20),NETWORKADDRESS char(40),NETWORKMASK char(40),NETWORKGATEWAY char(40),NETWORKID char(20));
CREATE TABLE SERVER_FIBER(SERVERID char(20),FIBERTYPE char(200),FIBERID char(20));
CREATE TABLE SERVER_ACTIVITY (SERVERID char(20),ID char(20),DESCRIPTION text,CCFORM char(20),DATEIMPL char(20));
CREATE TABLE BACKUP_CHECK(BCKDATE char(20),SOFTWAREID char(20),DATAGEN char(1),DATATAPE char(1),REASON text,APPROVEDBY char(20));
CREATE TABLE VENDOR(ID char(20),NAME char(50),DESCRIPTION text,CONTACT text);
CREATE INDEX VENDOR_ID_INDX on VENDOR (ID);
CREATE TABLE VENDOR_CONTRACT(ID char(20),VENDORID char(20),REFERENCE char(50),DESCRIPTION text,DDAY int,DMONTH int,DYEAR int,EDAY int,EMONTH int,EYEAR int,PRICE int);
CREATE INDEX CONTRACT_ID_INDX on VENDOR_CONTRACT(ID);
CREATE TABLE OS(ID char(20),NAME char(200),VENDORID char(20),ESDAY int,ESMONTH int,ESYEAR int,VERSION char(20));
CREATE TABLE SP(ID char(20),OSID char(20),NAME char(200),RDAY int,RMONTH int,RYEAR int,ALLOWED char(20));
CREATE TABLE SERVICE(ID char(20),NAME char(200),DESCRIPTION text,VENDORID char(20));
CREATE TABLE SERVER_SERVICE(SERVERID char(20),SERVICEID char(20),PORT char(20));

CREATE INDEX LOGIN_INDX on USERS (LOGIN);
CREATE INDEX SFT_ID_INDX on SOFTWARE (ID);
CREATE INDEX SFT_VER_ID_INDX on SOFTWARE_VERSION (SOFTWAREID);
CREATE INDEX SFT_DOC_ID_INDX on SOFTWARE_DOCUMENTS (SOFTWAREID);

CREATE TABLE INDX(ID char(20),SEQ int);

INSERT INTO USERS VALUES('omoulin','omoulin','Moulin','Olivier','ITMGR','omoulin','YES','NO');
INSERT INTO USERS VALUES('pm','pm','Project','Manager','IT','LOCAL','NO','NO');
INSERT INTO USERS VALUES('requester','requester','Requester','for Testing','USER','LOCAL','NO','NO');


CREATE TABLE LOGS(LOGIN char(20),NAME char(50),FORNAME char(50),TIME char(50),STATE char(200));


commit;
