DROP TABLE USERS;
DROP TABLE PROJECT;
DROP TABLE LOGS;
DROP TABLE PROJECT_STRUCTURE;
DROP TABLE PROJECT_TYPE;
DROP TABLE PROJECT_PLANNING_FEEDBACK;
DROP TABLE PROJECT_EXECUTION_FEEDBACK;
DROP TABLE PROJECT_MANAGEMENT_FEEDBACK;
DROP TABLE PROJECT_DEPL_FEEDBACK;
DROP TABLE PROJECT_TRAIN_FEEDBACK;
DROP TABLE PROJECT_RISK_RATIO;
DROP TABLE PROJECT_PLANNING_RATIO;
DROP TABLE PROJECT_EXECUTION_RATIO;
DROP TABLE PROJECT_MANAGEMENT_RATIO;
DROP TABLE PROJECT_DEPL_RATIO;
DROP TABLE PROJECT_CLOSE_RATIO;
DROP TABLE PROJECT_TECHNOLOGY_TASK;
DROP TABLE TECHNOLOGY;
DROP TABLE TECHNOLOGY_TASK_RATIO;
DROP TABLE PROJECT_REQUIREMENTS;


CREATE TABLE USERS(LOGIN char(20),NAME char(50),FORNAME char(30),LDAPLOGIN char(40),DISABLED char(20),MAIL char(200),PWD char(50));
CREATE INDEX LOGIN_INDX on USERS (LOGIN);

CREATE TABLE PROJECT(ID char(20),NAME char(254),DESCRIPTION text,PROJECTTYPEID char(20),PROJECTSTRUCTUREID char(20),PM char(20));
CREATE INDEX PROJECT_INDX on PROJECT (ID);

CREATE TABLE PROJECT_STRUCTURE(ID char(20),NAME char(254),DESCRIPTION text);
INSERT INTO PROJECT_STRUCTURE VALUES('VCY','V-CYLE TYPE PROJECT','Project using the V-Cycle methodology for its execution');
INSERT INTO PROJECT_STRUCTURE VALUES('AGI','AGILE TYPE PROJECT','Project using the Agile methodology for its execution');

CREATE TABLE PROJECT_TYPE(ID char(20), NAME char(254),DESCRIPTION text);
INSERT INTO PROJECT_TYPE VALUES('ENT','ENTERPRISE PROJECT','Project covering a lot of technology');
INSERT INTO PROJECT_TYPE VALUES('ERP','ERP PROJECT','Project mostly focussed on ERP');
INSERT INTO PROJECT_TYPE VALUES('PLM','PLM PROJECT','Project mostly focussed on PLM');
INSERT INTO PROJECT_TYPE VALUES('WEB','WEBAPPS PROJECT','Project mostly focussed on WEBAPPS');
INSERT INTO PROJECT_TYPE VALUES('MOB','MOBILE PROJECT','Project mostly focussed on MOBILE');
INSERT INTO PROJECT_TYPE VALUES('CRM','CRM PROJECT','Project mostly focussed on CRM');
INSERT INTO PROJECT_TYPE VALUES('INF','INFRA PROJECT','Project mostly focussed on INFRASTRUCTURE');

CREATE TABLE PROJECT_PLANNING_FEEDBACK(PROJECTID char(20),EASY_HOURS int,STANDARD_HOURS int,COMPLEX_HOURS int);

CREATE TABLE PROJECT_EXECUTION_FEEDBACK(PROJECTID char(20),DEV_HOURS int,TESTING_HOURS int);

CREATE TABLE PROJECT_MANAGEMENT_FEEDBACK(PROJECTID char(20),IDRATIO char(20),HOURS int);

CREATE TABLE PROJECT_DEPL_FEEDBACK(PROJECTID char(20),HOURS int);

CREATE TABLE PROJECT_TRAIN_FEEDBACK(PROJECTID char(20),HOURS int);

CREATE TABLE PROJECT_RISK_RATIO(PROJECTTYPEID char(20),EASY_RATIO int,STANDARD_RATIO int,COMPLEX_RATIO int);
INSERT INTO PROJECT_RISK_RATIO VALUES('ENT',90,100,120);
INSERT INTO PROJECT_RISK_RATIO VALUES('ERP',90,100,120);
INSERT INTO PROJECT_RISK_RATIO VALUES('PLM',90,100,120);
INSERT INTO PROJECT_RISK_RATIO VALUES('WEB',90,100,120);
INSERT INTO PROJECT_RISK_RATIO VALUES('MOB',90,100,120);
INSERT INTO PROJECT_RISK_RATIO VALUES('CRM',90,100,120);
INSERT INTO PROJECT_RISK_RATIO VALUES('INF',90,100,120);

CREATE TABLE PROJECT_PLANNING_RATIO(PROJECTTYPEID char(20),EASY_HOURS int,STANDARD_HOURS int,COMPLEX_HOURS int);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('ENT',4,8,16);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('ERP',4,8,16);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('PLM',4,8,16);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('WEB',4,8,16);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('MOB',4,8,16);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('CRM',4,8,16);
INSERT INTO PROJECT_PLANNING_RATIO VALUES('INF',4,8,16);

CREATE TABLE PROJECT_EXECUTION_RATIO(PROJECTTYPEID char(20),DEV_RATIO int,TESTING_RATIO int);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('ENT',100,100);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('ERP',100,100);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('PLM',100,100);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('WEB',100,100);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('MOB',100,100);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('CRM',100,100);
INSERT INTO PROJECT_EXECUTION_RATIO VALUES('INF',100,100);

CREATE TABLE PROJECT_MANAGEMENT_RATIO(PROJECTTYPEID char(20),IDRATIO char(20),RATIO int);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ENT','CL-QA',100);

INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('ERP','CL-QA',100);

INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('PLM','CL-QA',100);

INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('WEB','CL-QA',100);

INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('MOB','CL-QA',100);

INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('CRM','CL-QA',100);

INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','PL-PM',20);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','PL-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','EX-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','EX-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','DP-PM',15);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','DP-QA',10);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','CL-PM',100);
INSERT INTO PROJECT_MANAGEMENT_RATIO VALUES('INF','CL-QA',100);


CREATE TABLE PROJECT_DEPL_RATIO(PROJECTTYPEID char(20),EASY_RATIO int,STANDARD_RATIO int,COMPLEX_RATIO int);
INSERT INTO PROJECT_DEPL_RATIO VALUES('ENT',15,20,30);
INSERT INTO PROJECT_DEPL_RATIO VALUES('ERP',15,20,30);
INSERT INTO PROJECT_DEPL_RATIO VALUES('PLM',15,20,30);
INSERT INTO PROJECT_DEPL_RATIO VALUES('WEB',15,20,30);
INSERT INTO PROJECT_DEPL_RATIO VALUES('MOB',15,20,30);
INSERT INTO PROJECT_DEPL_RATIO VALUES('CRM',15,20,30);
INSERT INTO PROJECT_DEPL_RATIO VALUES('INF',15,20,30);

CREATE TABLE PROJECT_TRAIN_RATIO(PROJECTTYPEID char(20),EASY_RATIO int,STANDARD_RATIO int,COMPLEX_RATIO int);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('ENT',15,20,30);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('ERP',15,20,30);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('PLM',15,20,30);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('WEB',15,20,30);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('MOB',15,20,30);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('CRM',15,20,30);
INSERT INTO PROJECT_TRAIN_RATIO VALUES('INF',15,20,30);

CREATE TABLE PROJECT_CLOSE_RATIO(PROJECTTYPEID char(20), RATIO int);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('ENT',2);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('ERP',2);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('PLM',2);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('WEB',2);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('MOB',2);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('CRM',2);
INSERT INTO PROJECT_CLOSE_RATIO VALUES('INF',2);

CREATE TABLE PROJECT_TECHNOLOGY_TASK(PROJECTID char(20),TECHNOLOGYID char(20),TASKID char(20),NBEASY int,NBSTANDARD int, NBCOMPLEX int);

CREATE TABLE PROJECT_TECHNOLOGY(PROJECTID char(20),TECHNOLOGYID char(20));

CREATE TABLE TECHNOLOGY(ID char(20),NAME char(254),DESCRIPTION text);
INSERT INTO TECHNOLOGY VALUES('CPP','C++','');
INSERT INTO TECHNOLOGY VALUES('JAV','JAVA','');
INSERT INTO TECHNOLOGY VALUES('PHP','PHP','');
INSERT INTO TECHNOLOGY VALUES('DBA','Database','');
INSERT INTO TECHNOLOGY VALUES('ORA','ORACLE Application','');
INSERT INTO TECHNOLOGY VALUES('JDE','JD Edwards','');
INSERT INTO TECHNOLOGY VALUES('MFG','MFG-PRO','');
INSERT INTO TECHNOLOGY VALUES('SAP','SAP','');
INSERT INTO TECHNOLOGY VALUES('WCH','Windchill','');
INSERT INTO TECHNOLOGY VALUES('GEN','Generic','');
INSERT INTO TECHNOLOGY VALUES('BIM','Microsoft BI','');
INSERT INTO TECHNOLOGY VALUES('BIC','Cognos BI','');
INSERT INTO TECHNOLOGY VALUES('MOB','Mobile','');
INSERT INTO TECHNOLOGY VALUES('SRV','Server infrastructure','');
INSERT INTO TECHNOLOGY VALUES('SAN','SAN infrastructure','');
INSERT INTO TECHNOLOGY VALUES('NET','Network infrastructure','');
INSERT INTO TECHNOLOGY VALUES('SEC','Security','');
INSERT INTO TECHNOLOGY VALUES('AS4','AS/400 infrastructure','');


CREATE TABLE TECHNOLOGY_TASK_RATIO(TECHNOLOGYID char(20),TASKID char(20),NAME char(254),DESCRIPTION text,EASY_DEV_HOURS int,STANDARD_DEV_HOURS int,COMPLEX_DEV_HOURS int,EASY_TEST_HOURS int,STANDARD_TEST_HOURS int,COMPLEX_TEST_HOURS int);
INSERT INTO TECHNOLOGY_TASK_RATIO VALUES('JAV','001','Create web-page','',4,8,16,2,4,8);
INSERT INTO TECHNOLOGY_TASK_RATIO VALUES('JAV','002','Create data connectors','',4,8,16,2,4,8);
INSERT INTO TECHNOLOGY_TASK_RATIO VALUES('JAV','003','Configure web-site','',8,12,20,4,5,8);
INSERT INTO TECHNOLOGY_TASK_RATIO VALUES('JAV','004','Deploy web-site','',1,2,3,1,2,3);


CREATE TABLE PROJECT_REQUIREMENTS(PROJECTID char(20),NBEASY int,NBSTANDARD int,NBCOMPLEX int);

CREATE TABLE PROJECT_DEPLOYMENT(PROJECTID char(20),COMPLEXITY char(20));

CREATE TABLE PROJECT_TRAINING(PROJECTID char(20),COMPLEXITY char(20));

CREATE TABLE LOGS(LOGIN char(20),NAME char(50),FORNAME char(50),TIME char(50),STATE char(200));

commit;
