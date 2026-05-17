--------------------------------------------------------
--  File created - poniedzia�ek-czerwca-03-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_ARTYKULY
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_ARTYKULY"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CZASOPISMA
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_CZASOPISMA"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_CZYTELNICY
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_CZYTELNICY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 80 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_KARA
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_KARA"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 38 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_KSIAZKA
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_KSIAZKA"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PRACOWNICY
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_PRACOWNICY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 31 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_WYPOZYCZENIA
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_WYPOZYCZENIA"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ZAMOWIENIA
--------------------------------------------------------

   CREATE SEQUENCE  "BIBLIOTEKA"."SEQ_ZAMOWIENIA"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 116 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ARTYKULY
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."ARTYKULY" 
   (	"ID" NUMBER, 
	"TYTU�" VARCHAR2(200 BYTE), 
	"AUTOR" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ARTYKULYCZASOPISMA
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."ARTYKULYCZASOPISMA" 
   (	"ARTYKU�" NUMBER, 
	"CZASOPISMO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CZASOPISMA
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."CZASOPISMA" 
   (	"ID" NUMBER, 
	"NAZWA" VARCHAR2(100 BYTE), 
	"WYDAWCA" VARCHAR2(100 BYTE), 
	"CZYTELNIAID" NUMBER, 
	"STATUS" VARCHAR2(20 BYTE), 
	"NUMERWYDANIA" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CZYTELNIA
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."CZYTELNIA" 
   (	"ID" NUMBER, 
	"NAZWA" VARCHAR2(100 BYTE), 
	"ADRES" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CZYTELNICY
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."CZYTELNICY" 
   (	"ID" NUMBER, 
	"IMIE" VARCHAR2(50 BYTE), 
	"NAZWISKO" VARCHAR2(50 BYTE), 
	"ADRESZAMIESZKANIA" VARCHAR2(100 BYTE), 
	"DATAURODZENIA" DATE, 
	"DATAZAPISANIA" DATE, 
	"RANGA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KARY
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."KARY" 
   (	"ID" NUMBER, 
	"OPIS" VARCHAR2(100 BYTE), 
	"KWOTA" NUMBER(10,2), 
	"CZYTELNIKID" NUMBER, 
	"PRACOWNIKID" NUMBER, 
	"DATAWYSTAWIENIA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KSIAZKI
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."KSIAZKI" 
   (	"ID" NUMBER, 
	"NAZWA" VARCHAR2(100 BYTE), 
	"AUTOR" VARCHAR2(100 BYTE), 
	"GATUNEK" VARCHAR2(100 BYTE), 
	"WYDAWNICTWO" VARCHAR2(100 BYTE), 
	"ROKWYDANIA" NUMBER, 
	"CZYTELNIAID" NUMBER, 
	"STATUS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRACOWNICY
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."PRACOWNICY" 
   (	"ID" NUMBER, 
	"IMI�" VARCHAR2(50 BYTE), 
	"NAZWISKO" VARCHAR2(50 BYTE), 
	"STANOWISKO" VARCHAR2(50 BYTE), 
	"CZYTELNIAID" NUMBER, 
	"PENSJA" NUMBER, 
	"DATAZATRUDNIENIA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RANGI
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."RANGI" 
   (	"ID" NUMBER, 
	"NAZWA" VARCHAR2(50 BYTE), 
	"WYMAGANYSTA�" NUMBER, 
	"MAXWYPOZYCZENIE" NUMBER, 
	"MAXCZASWYPOZYCZENIA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WYPOZYCZENIA
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."WYPOZYCZENIA" 
   (	"ID" NUMBER, 
	"ZAM�WIENIEID" NUMBER, 
	"PRACOWNIKID" NUMBER, 
	"DATAWYPO�YCZENIA" DATE, 
	"DATAZWROTU" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZAMOWIENIA
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."ZAMOWIENIA" 
   (	"ID" NUMBER, 
	"CZYTELNIKID" NUMBER, 
	"DATAZAMOWIENIA" DATE, 
	"STATUS" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZAMOWIENIACZASOPISMA
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."ZAMOWIENIACZASOPISMA" 
   (	"ZAM�WIENIE" NUMBER, 
	"CZASOPISMO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZAMOWIENIAKSIAZKI
--------------------------------------------------------

  CREATE TABLE "BIBLIOTEKA"."ZAMOWIENIAKSIAZKI" 
   (	"ZAM�WIENIE" NUMBER, 
	"KSI��KA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into BIBLIOTEKA.ARTYKULY
SET DEFINE OFF;
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('41','Ksiazka','Autor');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('1','The Rise of Artificial Intelligence in Healthcare','John Smithaa');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('2','Climate Change: The Urgent Need for Action','Emma Johnson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('3','The Impact of Social Media on Mental Health','Michael Brown');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('4','Blockchain Technology: Revolutionizing Supply Chains','Emily Wilson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('5','The Future of Work: Automation and Job Displacement','David Martinez');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('6','The Power of Mindfulness in Everyday Life','Sophia Adams');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('7','Space Exploration: The Next Frontier','Daniel Clark');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('8','The Evolution of Cybersecurity Threats','Olivia Taylor');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('9','Advancements in Renewable Energy Technologies','Matthew White');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('10','Understanding Quantum Computing','Sophie Johnson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('11','The Role of Big Data in Business Innovation','Lucas Lee');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('12','Challenges and Opportunities in Global Healthcare','Emma Davis');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('13','The Impact of Artificial Intelligence on Education','Michael Brown');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('14','Climate Change and Its Effects on Biodiversity','Emily Wilson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('15','The Psychology of Decision Making','David Martinez');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('16','Exploring the Potential of Virtual Reality in Healthcare','Sophia Adams');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('17','A Look into the Future of Transportation','Daniel Clark');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('18','The Rise of Cybersecurity Threats in the Digital Age','Olivia Taylor');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('19','Innovations in Sustainable Agriculture','Matthew White');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('20','The Impact of Social Media on Politics','Sophie Johnson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('21','The Future of Artificial Intelligence in Customer Service','Lucas Lee');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('22','Addressing Mental Health Stigma in Society','Emma Davis');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('23','The Importance of Data Privacy in the Digital Age','Michael Brown');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('24','Exploring Renewable Energy Solutions for Urban Areas','Emily Wilson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('25','The Role of Artificial Intelligence in Financial Services','David Martinez');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('26','Advancements in Space Exploration Technologies','Sophia Adams');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('27','The Future of Work: Remote Collaboration Tools','Daniel Clark');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('28','The Evolution of Malware and Cyber Attacks','Olivia Taylor');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('29','Innovations in Clean Energy Technologies','Matthew White');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('30','The Impact of Social Media on Mental Health','Sophie Johnson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('31','The Rise of Artificial Intelligence in Education','Lucas Lee');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('32','Addressing Climate Change through Sustainable Practices','Emma Davis');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('33','The Ethical Implications of Artificial Intelligence','Michael Brown');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('34','Urban Planning for Climate Resilience','Emily Wilson');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('35','The Future of Healthcare: Telemedicine and Remote Care','David Martinez');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('36','The Psychology of Social Media Addiction','Sophia Adams');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('37','The Exploration of Deep Space: Challenges and Discoveries','Daniel Clark');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('38','The Rise of Cybersecurity Threats in Healthcare','Olivia Taylor');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('39','Advancements in Water Purification Technologies','Matthew White');
Insert into BIBLIOTEKA.ARTYKULY (ID,"TYTU�",AUTOR) values ('40','The Impact of Artificial Intelligence on Job Market Trends','Sophie Johnson');
REM INSERTING into BIBLIOTEKA.ARTYKULYCZASOPISMA
SET DEFINE OFF;
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('1','1');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('1','2');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('1','10');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('1','20');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('2','2');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('2','3');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('3','3');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('3','4');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('4','4');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('4','5');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('5','5');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('5','6');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('6','6');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('6','7');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('7','7');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('7','8');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('8','8');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('8','9');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('9','9');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('9','10');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('10','1');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('10','10');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('11','11');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('11','12');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('12','12');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('12','13');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('13','13');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('13','14');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('14','14');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('14','15');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('15','15');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('15','16');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('16','16');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('16','17');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('17','17');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('17','18');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('18','18');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('18','19');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('19','19');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('19','20');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('20','1');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('20','20');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('21','1');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('21','2');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('21','20');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('22','2');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('22','3');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('23','3');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('23','4');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('24','4');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('24','5');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('25','5');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('25','6');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('26','6');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('26','7');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('27','7');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('27','8');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('28','8');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('28','9');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('29','9');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('29','10');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('30','10');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('30','11');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('31','11');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('31','12');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('32','12');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('32','13');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('33','13');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('33','14');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('34','14');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('34','15');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('35','15');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('35','16');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('36','16');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('36','17');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('37','17');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('37','18');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('38','18');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('38','19');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('39','19');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('39','20');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('40','1');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('40','20');
Insert into BIBLIOTEKA.ARTYKULYCZASOPISMA ("ARTYKU�",CZASOPISMO) values ('41','3');
REM INSERTING into BIBLIOTEKA.CZASOPISMA
SET DEFINE OFF;
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('1','National Geographic','National Geographic Society','2','Dostepneeee','23/2018');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('2','Time','Time USA, LLC','2','Dost�pne','56/2017');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('3','Wired','Cond� Nast','1','Wypo�yczone','89/2019');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('4','Nature','Springer Nature','2','Dost�pne','101/2016');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('5','The Economist','The Economist Group','3','Dost�pne','12/2021');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('6','Forbes','Forbes Media','1','Wypo�yczone','32/2018');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('7','Scientific American','Springer Nature','2','Dost�pne','45/2015');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('8','New Scientist','New Scientist Ltd.','3','Dost�pne','78/2017');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('9','The Atlantic','Emerson Collective','1','Dost�pne','88/2020');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('10','Harvard Business Review','Harvard Business Publishing','2','Wypo�yczone','99/2016');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('11','Smithsonian','Smithsonian Institution','3','Dost�pne','2/2024');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('12','Popular Science','Bonnier Corporation','1','Dost�pne','10/2015');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('13','The New Yorker','Cond� Nast','2','Wypo�yczone','15/2023');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('14','Vanity Fair','Cond� Nast','3','Dost�pne','20/2016');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('15','The Guardian Weekly','Guardian Media Group','1','Dost�pne','30/2019');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('16','Fortune','Fortune Media Group Holdings','2','Dost�pne','35/2018');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('17','New York Magazine','New York Media, LLC','3','Wypo�yczone','40/2017');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('18','Discover','Walt Disney Television','1','Dost�pne','50/2015');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('19','Bloomberg Businessweek','Bloomberg L.P.','2','Dost�pne','60/2022');
Insert into BIBLIOTEKA.CZASOPISMA (ID,NAZWA,WYDAWCA,CZYTELNIAID,STATUS,NUMERWYDANIA) values ('20','Reader''s Digest','Trusted Media Brands, Inc.','3','Wypo�yczone','70/2019');
REM INSERTING into BIBLIOTEKA.CZYTELNIA
SET DEFINE OFF;
Insert into BIBLIOTEKA.CZYTELNIA (ID,NAZWA,ADRES) values ('1','Biblioteka Miejska','ul. Mickiewicza 3, Rzesz�w');
Insert into BIBLIOTEKA.CZYTELNIA (ID,NAZWA,ADRES) values ('2','Biblioteka Uniwersytecka','ul. Rejtana 16, Rzesz�w');
Insert into BIBLIOTEKA.CZYTELNIA (ID,NAZWA,ADRES) values ('3','Biblioteka Pedagogiczna','ul. Kopernika 9, Rzesz�w');
REM INSERTING into BIBLIOTEKA.CZYTELNICY
SET DEFINE OFF;
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('6','Micha�','W�jcik','ul. Hetma�ska 34, Rzesz�w',to_date('02/07/22','RR/MM/DD'),to_date('24/04/28','RR/MM/DD'),'1');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('8','Bartosz','Kami�ski','ul. Przemys�owa 1, Rzesz�w',to_date('00/09/08','RR/MM/DD'),to_date('22/06/02','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('9','Karolina','Zaj�c','ul. Warszawska 23, Krosno',to_date('03/03/25','RR/MM/DD'),to_date('23/10/17','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('12','Tomasz','Jankowski','ul. Zawiszy 6, Rzesz�w',to_date('03/07/18','RR/MM/DD'),to_date('16/05/05','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('13','Karol','Wr�bel','ul. Langiewicza 18, Rzesz�w',to_date('02/12/30','RR/MM/DD'),to_date('17/08/19','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('14','Monika','Baran','ul. Potokowa 3, Rzesz�w',to_date('01/04/11','RR/MM/DD'),to_date('24/04/25','RR/MM/DD'),'1');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('15','Alicja','Mazur','ul. Dunikowskiego 8, Rzesz�w',to_date('04/09/28','RR/MM/DD'),to_date('19/12/07','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('16','�ukasz','Duda','ul. Chmielna 22, Rzesz�w',to_date('03/01/15','RR/MM/DD'),to_date('23/10/02','RR/MM/DD'),'2');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('17','Kinga','Kaczmarek','ul. Przechodnia 15, Rzesz�w',to_date('01/05/09','RR/MM/DD'),to_date('21/06/18','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('18','Szymon','Grabowski','ul. Krucza 7, Rzesz�w',to_date('05/08/22','RR/MM/DD'),to_date('14/11/23','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('19','Patrycja','Piotrowska','ul. Kalinowa 16, Rzesz�w',to_date('02/03/12','RR/MM/DD'),to_date('15/09/14','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('20','Dominik','Marciniak','ul. Ciep�a 11, Rzesz�w',to_date('03/12/05','RR/MM/DD'),to_date('23/07/09','RR/MM/DD'),'2');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('21','Ewa','Mazur','ul. Rynek 1, Tyczyn',to_date('01/01/15','RR/MM/DD'),to_date('11/02/25','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('22','Jakub','Sikorski','ul. Parkowa 12, Tyczyn',to_date('02/03/20','RR/MM/DD'),to_date('14/07/13','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('23','Zofia','Kaczmarek','ul. Mickiewicza 8, Tyczyn',to_date('03/06/30','RR/MM/DD'),to_date('15/09/02','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('24','Pawe�','Le�niak','ul. S�oneczna 14, Tyczyn',to_date('00/08/12','RR/MM/DD'),to_date('17/11/19','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('25','Marta','Borkowska','ul. Polna 22, Tyczyn',to_date('04/10/05','RR/MM/DD'),to_date('19/01/03','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('26','Adrian','Ko�odziej','ul. Spokojna 3, Tyczyn',to_date('05/12/15','RR/MM/DD'),to_date('20/06/15','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('27','Magdalena','Sobczak','ul. Ogrodowa 17, Tyczyn',to_date('02/04/18','RR/MM/DD'),to_date('18/03/21','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('28','�ukasz','Jaworski','ul. Zielona 9, Tyczyn',to_date('03/09/25','RR/MM/DD'),to_date('15/12/11','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('29','Aleksandra','Chmielewska','ul. Brzozowa 4, Tyczyn',to_date('00/07/07','RR/MM/DD'),to_date('23/08/20','RR/MM/DD'),'2');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('30','Mateusz','Czarnecki','ul. W�ska 16, Tyczyn',to_date('04/11/30','RR/MM/DD'),to_date('24/04/14','RR/MM/DD'),'1');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('31','Katarzyna','Wojciechowska','ul. Szkolna 1, Rudna Ma�a',to_date('01/02/14','RR/MM/DD'),to_date('12/05/22','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('33','Anna','Kowal','ul. Le�na 9, Rudna Ma�a',to_date('03/06/20','RR/MM/DD'),to_date('14/10/30','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('34','Dawid','Bielecki','ul. Spacerowa 11, Rudna Ma�a',to_date('00/08/23','RR/MM/DD'),to_date('11/12/12','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('35','Monika','Marciniak','ul. Kwiatowa 7, Rudna Ma�a',to_date('04/10/26','RR/MM/DD'),to_date('23/04/15','RR/MM/DD'),'1');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('36','Tomasz','Szyma�ski','ul. Polna 3, Rudna Ma�a',to_date('05/12/29','RR/MM/DD'),to_date('23/05/10','RR/MM/DD'),'2');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('37','Natalia','Krawczyk','ul. Zielona 15, Rudna Ma�a',to_date('02/05/02','RR/MM/DD'),to_date('17/02/08','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('38','Micha�','G�rski','ul. Jasna 19, Rudna Ma�a',to_date('03/07/05','RR/MM/DD'),to_date('18/07/17','RR/MM/DD'),'3');
Insert into BIBLIOTEKA.CZYTELNICY (ID,IMIE,NAZWISKO,ADRESZAMIESZKANIA,DATAURODZENIA,DATAZAPISANIA,RANGA) values ('39','Patrycja','Michalska','ul. Ko�cielna 21, Rudna Ma�a',to_date('00/09/08','RR/MM/DD'),to_date('19/06/01','RR/MM/DD'),'3');
REM INSERTING into BIBLIOTEKA.KARY
SET DEFINE OFF;
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('2','Uszkodzenie ksi��ki','50','12','2',to_date('22/08/23','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('4','Op�nienie zwrotu','20','20','8',to_date('23/03/25','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('5','Uszkodzenie ksi��ki','60','15',null,to_date('22/11/05','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('6','Op�nienie zwrotu','15','25','5',to_date('22/07/30','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('7','Zagubienie ksi��ki','90','30','6',to_date('23/04/12','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('8','Op�nienie zwrotu','25','33','7',to_date('22/12/01','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('9','Uszkodzenie ksi��ki','55','37','9',to_date('23/02/28','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('11','Zagubienie ksi��ki','85','6','2',to_date('22/09/19','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('12','Op�nienie zwrotu','35','17','7',to_date('23/03/07','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('14','Op�nienie zwrotu','28','22','2',to_date('23/01/30','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('15','Zagubienie ksi��ki','75','27','4',to_date('22/07/11','RR/MM/DD'));
Insert into BIBLIOTEKA.KARY (ID,OPIS,KWOTA,CZYTELNIKID,PRACOWNIKID,DATAWYSTAWIENIA) values ('17','Uszkodzenie ksi��ki','65','35','4',to_date('22/11/15','RR/MM/DD'));
REM INSERTING into BIBLIOTEKA.KSIAZKI
SET DEFINE OFF;
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('1','Harry Potter i Kamien Filozoficzny','J.K. Rowling','Fantastyka','Wydawnictwo B','1996','1','Dostepnaaa');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('2','Zbrodnia i Kara','Fiodor Dostojewski','Krymina�','Wydawnictwo B','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('3','W�adca Pier�cieni: Dru�yna Pier�cienia','J.R.R. Tolkien','Fantastyka','Wydawnictwo C','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('4','To','Stephen King','Horror','Wydawnictwo D','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('5','W pustyni i w puszczy','Henryk Sienkiewicz','Przygodowa','Wydawnictwo E','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('6','Metro 2033','Dmitrij G�uchowski','Postapokaliptyczna','Wydawnictwo F','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('7','Ferdydurke','Witold Gombrowicz','Surrealistyczna','Wydawnictwo G','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('8','Duma i uprzedzenie','Jane Austen','Romantyczna','Wydawnictwo H','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('9','Martwe dusze','Niko�aj Gogol','Satyra','Wydawnictwo I','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('10','Mistrz i Ma�gorzata','Michai� Bu�hakow','Absurdalna','Wydawnictwo J','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('11','Opowie�ci z Narnii: Lew, Czarownica i Stara Szafa','C.S. Lewis','Fantasy','Wydawnictwo K','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('12','1984','George Orwell','Dystopian','Wydawnictwo L','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('13','Przemin�o z wiatrem','Margaret Mitchell','Historyczna','Wydawnictwo M','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('14','D�uma','Albert Camus','Filozoficzna','Wydawnictwo N','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('15','L�nienie','Stephen King','Horror','Wydawnictwo O','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('16','Zbrodnia i kara','Agatha Christie','Krymina�','Wydawnictwo P','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('17','Harry Potter i Komnata Tajemnic','J.K. Rowling','Fantastyka','Wydawnictwo Q','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('18','Sklepik z marzeniami','Stephen King','Horror','Wydawnictwo R','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('19','Ma�y ksi���','Antoine de Saint-Exup�ry','Ba�niowa','Wydawnictwo S','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('20','Wojna i pok�j','Lew To�stoj','Historyczna','Wydawnictwo T','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('21','Niezno�na lekko�� bytu','Milan Kundera','Filozoficzna','Wydawnictwo U','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('22','W�adca Pier�cieni: Dwie wie�e','J.R.R. Tolkien','Fantastyka','Wydawnictwo V','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('23','Mistrz i Ma�gorzata','Michai� Bu�hakow','Absurdalna','Wydawnictwo W','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('24','Harry Potter i wi�zie� Azkabanu','J.K. Rowling','Fantastyka','Wydawnictwo X','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('25','Rok 1984','George Orwell','Dystopian','Wydawnictwo Y','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('26','W pustyni i w puszczy','Henryk Sienkiewicz','Przygodowa','Wydawnictwo Z','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('27','Harry Potter i Ksi��� P�krwi','J.K. Rowling','Fantastyka','Wydawnictwo AA','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('28','Z�odziejka ksi��ek','Markus Zusak','Historyczna','Wydawnictwo AB','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('29','W�adca Pier�cieni: Powr�t kr�la','J.R.R. Tolkien','Fantastyka','Wydawnictwo AC','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('30','Pan Tadeusz','Adam Mickiewicz','Epos','Wydawnictwo AD','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('31','Opowie�ci z Narnii: Ksi��� Kaspian','C.S. Lewis','Fantasy','Wydawnictwo AE','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('32','Hobbit, czyli tam i z powrotem','J.R.R. Tolkien','Fantastyka','Wydawnictwo AF','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('33','Wampir','Bram Stoker','Horror','Wydawnictwo AG','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('34','Z�o w zarodku','Gustaw Herling-Grudzi�ski','Reporta�','Wydawnictwo AH','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('35','Martwe dusze','Niko�aj Gogol','Satyra','Wydawnictwo AI','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('36','Cienka czerwona linia','James Jones','Wojenna','Wydawnictwo AJ','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('37','Pami�tnik Anny Frank','Anne Frank','Pami�tnik','Wydawnictwo AK','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('38','Alchemik','Paulo Coelho','Motywacyjna','Wydawnictwo AL','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('39','Sklep z marzeniami','Stephen King','Horror','Wydawnictwo AM','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('40','Diuna','Frank Herbert','Science Fiction','Wydawnictwo AN','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('41','Wielki Gatsby','F. Scott Fitzgerald','Dramat','Wydawnictwo AO','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('42','Romeo i Julia','William Szekspir','Tragedia','Wydawnictwo AP','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('43','Zbrodnia i kara','Fiodor Dostojewski','Psychologiczna','Wydawnictwo AQ','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('44','Folwark zwierz�cy','George Orwell','Satyra','Wydawnictwo AR','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('45','Ma�y ksi���','Antoine de Saint-Exup�ry','Ba��','Wydawnictwo AS','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('46','Atlas chmur','David Mitchell','Science Fiction','Wydawnictwo AT','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('47','P�omie� i krzy�','Jack London','Przygodowa','Wydawnictwo AU','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('48','Hunger Games','Suzanne Collins','Dystopian','Wydawnictwo AV','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('49','Sklep z marzeniami','Stephen King','Horror','Wydawnictwo AM','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('50','Diuna','Frank Herbert','Science Fiction','Wydawnictwo AN','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('51','Wielki Gatsby','F. Scott Fitzgerald','Dramat','Wydawnictwo AO','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('52','Romeo i Julia','William Szekspir','Tragedia','Wydawnictwo AP','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('53','Zbrodnia i kara','Fiodor Dostojewski','Psychologiczna','Wydawnictwo AQ','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('54','Folwark zwierz�cy','George Orwell','Satyra','Wydawnictwo AR','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('55','Ma�y ksi���','Antoine de Saint-Exup�ry','Ba��','Wydawnictwo AS','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('56','Atlas chmur','David Mitchell','Science Fiction','Wydawnictwo AT','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('57','P�omie� i krzy�','Jack London','Przygodowa','Wydawnictwo AU','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('58','Z�odziejka ksi��ek','Markus Zusak','Historyczna','Wydawnictwo AB','1996','1','Dost�pna');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('59','Wladca Pierscieni: Powrot krola','J.R.R. Tolkien','Fantastyka','Wydawnictwo AC','1996','1','Dostepnaaa');
Insert into BIBLIOTEKA.KSIAZKI (ID,NAZWA,AUTOR,GATUNEK,WYDAWNICTWO,ROKWYDANIA,CZYTELNIAID,STATUS) values ('60','Pan Tadeusz','Adam Mickiewicz','Epos','Wydawnictwo AD','1996','1','Dost�pna');
REM INSERTING into BIBLIOTEKA.PRACOWNICY
SET DEFINE OFF;
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('2','Anna','Nowak','Asystent Bibliotekarza','1','3000',to_date('24/04/10','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('3','Marek','Wi�niewski','Magazynier','1','2500',to_date('19/04/15','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('4','Karolina','Duda','Bibliotekarz','2','4200',to_date('20/04/05','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('5','Piotr','Kami�ski','Bibliotekarz','3','3800',to_date('21/04/20','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('6','Monika','Lewandowska','Asystent Bibliotekarza','2','3200',to_date('24/04/03','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('7','Micha�','Kaczmarek','Bibliotekarz','1','4100',to_date('18/04/08','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('8','Magdalena','Zaj�c','Asystent Bibliotekarza','3','3300',to_date('23/04/12','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('9','Kamil','Adamczyk','Magazynier','2','2600',to_date('19/04/25','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('10','Natalia','Pawlak','Bibliotekarz','1','3900',to_date('22/04/18','RR/MM/DD'));
Insert into BIBLIOTEKA.PRACOWNICY (ID,"IMI�",NAZWISKO,STANOWISKO,CZYTELNIAID,PENSJA,DATAZATRUDNIENIA) values ('13','KatarzynaW','Kowalski','Manager','1','123',to_date('24/05/29','RR/MM/DD'));
REM INSERTING into BIBLIOTEKA.RANGI
SET DEFINE OFF;
Insert into BIBLIOTEKA.RANGI (ID,NAZWA,"WYMAGANYSTA�",MAXWYPOZYCZENIE,MAXCZASWYPOZYCZENIA) values ('1','Czytelnik','0','3','30');
Insert into BIBLIOTEKA.RANGI (ID,NAZWA,"WYMAGANYSTA�",MAXWYPOZYCZENIE,MAXCZASWYPOZYCZENIA) values ('2','Z�oty Czytelnik','6','5','60');
Insert into BIBLIOTEKA.RANGI (ID,NAZWA,"WYMAGANYSTA�",MAXWYPOZYCZENIE,MAXCZASWYPOZYCZENIA) values ('3','Diamentowy Czytelnik','18','10','90');
REM INSERTING into BIBLIOTEKA.WYPOZYCZENIA
SET DEFINE OFF;
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('5','7','6',to_date('24/05/13','RR/MM/DD'),to_date('24/05/20','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('6','8','7',to_date('24/05/15','RR/MM/DD'),to_date('24/05/22','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('7','9','8',to_date('24/05/17','RR/MM/DD'),to_date('24/05/24','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('8','11',null,to_date('24/05/04','RR/MM/DD'),to_date('24/05/26','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('10','14','2',to_date('24/05/12','RR/MM/DD'),to_date('24/06/03','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('11','15','4',to_date('24/05/16','RR/MM/DD'),to_date('24/06/05','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('12','17','5',to_date('24/05/15','RR/MM/DD'),to_date('24/06/07','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('15','20','8',to_date('22/06/10','RR/MM/DD'),null);
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('17','22',null,to_date('22/06/20','RR/MM/DD'),to_date('24/06/27','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('18','23','2',to_date('23/06/22','RR/MM/DD'),to_date('24/06/29','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('19','24','4',to_date('23/06/24','RR/MM/DD'),to_date('24/07/01','RR/MM/DD'));
Insert into BIBLIOTEKA.WYPOZYCZENIA (ID,"ZAM�WIENIEID",PRACOWNIKID,"DATAWYPO�YCZENIA",DATAZWROTU) values ('20','25','5',to_date('23/06/30','RR/MM/DD'),to_date('24/07/07','RR/MM/DD'));
REM INSERTING into BIBLIOTEKA.ZAMOWIENIA
SET DEFINE OFF;
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('107','9',to_date('24/06/06','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('106','9',to_date('24/06/09','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('4','23',to_date('24/05/15','RR/MM/DD'),'Anulowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('6','8',to_date('21/02/02','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('7','30',to_date('24/05/13','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('8','33',to_date('24/05/15','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('9','37',to_date('24/05/17','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('101','6',to_date('24/06/04','RR/MM/DD'),'Odebrane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('11','6',to_date('24/05/21','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('12','17',to_date('24/05/23','RR/MM/DD'),'Zrealizowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('102','6',to_date('24/06/04','RR/MM/DD'),'Odebrane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('14','22',to_date('24/05/27','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('15','27',to_date('24/05/29','RR/MM/DD'),'Anulowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('17','35',to_date('24/06/02','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('20','12',to_date('24/05/03','RR/MM/DD'),'Zrealizowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('22','20',to_date('24/05/07','RR/MM/DD'),'Anulowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('23','15',to_date('24/05/09','RR/MM/DD'),'Zrealizowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('24','25',to_date('24/05/11','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('25','30',to_date('24/05/13','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('26','33',to_date('24/05/15','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('27','37',to_date('24/05/17','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('56','6',to_date('24/05/21','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('29','17',to_date('24/05/23','RR/MM/DD'),'Zrealizowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('31','22',to_date('24/05/27','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('32','27',to_date('24/05/29','RR/MM/DD'),'Anulowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('34','35',to_date('24/06/02','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('36','12',to_date('24/06/08','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('39','15',to_date('24/06/14','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('40','20',to_date('24/06/16','RR/MM/DD'),'Anulowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('41','27',to_date('24/06/18','RR/MM/DD'),'Zrealizowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('42','30',to_date('24/06/20','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('43','35',to_date('24/06/22','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('46','12',to_date('24/06/28','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('48','15',to_date('24/07/04','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('49','20',to_date('24/07/06','RR/MM/DD'),'Anulowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('50','27',to_date('24/07/08','RR/MM/DD'),'Zrealizowane');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('51','30',to_date('24/07/10','RR/MM/DD'),'W trakcie realizacji');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('52','35',to_date('24/07/12','RR/MM/DD'),'Oczekuje na odbi�r');
Insert into BIBLIOTEKA.ZAMOWIENIA (ID,CZYTELNIKID,DATAZAMOWIENIA,STATUS) values ('55','12',to_date('24/07/18','RR/MM/DD'),'Oczekuje na odbi�r');
REM INSERTING into BIBLIOTEKA.ZAMOWIENIACZASOPISMA
SET DEFINE OFF;
Insert into BIBLIOTEKA.ZAMOWIENIACZASOPISMA ("ZAM�WIENIE",CZASOPISMO) values ('4','2');
Insert into BIBLIOTEKA.ZAMOWIENIACZASOPISMA ("ZAM�WIENIE",CZASOPISMO) values ('4','8');
Insert into BIBLIOTEKA.ZAMOWIENIACZASOPISMA ("ZAM�WIENIE",CZASOPISMO) values ('101','3');
Insert into BIBLIOTEKA.ZAMOWIENIACZASOPISMA ("ZAM�WIENIE",CZASOPISMO) values ('102','3');
Insert into BIBLIOTEKA.ZAMOWIENIACZASOPISMA ("ZAM�WIENIE",CZASOPISMO) values ('107','2');
REM INSERTING into BIBLIOTEKA.ZAMOWIENIAKSIAZKI
SET DEFINE OFF;
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('7','2');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('7','3');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('8','2');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('9','3');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('9','4');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('11','5');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('12','6');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('14','7');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('15','16');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('17','12');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('20','17');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('101','1');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('101','3');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('102','1');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('102','3');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('106','2');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('107','2');
Insert into BIBLIOTEKA.ZAMOWIENIAKSIAZKI ("ZAM�WIENIE","KSI��KA") values ('107','3');
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_ARTYKULY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_ARTYKULY" 
BEFORE INSERT ON artykuly
FOR EACH ROW
BEGIN
    SELECT seq_artykuly.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_ARTYKULY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_CZASOPISMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_CZASOPISMA" 
BEFORE INSERT ON czasopisma
FOR EACH ROW
BEGIN
    SELECT seq_czasopisma.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_CZASOPISMA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_CZYTELNICY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_CZYTELNICY" 
BEFORE INSERT ON Czytelnicy
FOR EACH ROW
BEGIN
    SELECT seq_czytelnicy.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_CZYTELNICY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_KARY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_KARY" 
BEFORE INSERT ON kary
FOR EACH ROW
BEGIN
    SELECT seq_kara.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_KARY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_KSIAZKI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_KSIAZKI" 
BEFORE INSERT ON KSIAZKI
FOR EACH ROW
BEGIN
    SELECT seq_ksiazka.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_KSIAZKI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_PRACOWNICY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_PRACOWNICY" 
BEFORE INSERT ON Pracownicy
FOR EACH ROW
BEGIN
    SELECT seq_pracownicy.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_PRACOWNICY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_WYPOZYCZENIA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_WYPOZYCZENIA" 
BEFORE INSERT ON WYPOZYCZENIA
FOR EACH ROW
BEGIN
    SELECT seq_wypozyczenia.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_WYPOZYCZENIA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger AUTONUMEROWANIE_ZAMOWIENIA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_ZAMOWIENIA" 
BEFORE INSERT ON ZAMOWIENIA
FOR EACH ROW
BEGIN
    SELECT seq_zamowienia.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/
ALTER TRIGGER "BIBLIOTEKA"."AUTONUMEROWANIE_ZAMOWIENIA" ENABLE;
--------------------------------------------------------
--  DDL for Package ARTYKUL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."ARTYKUL_PKG" IS
    PROCEDURE INSERT_ARTYKUL(
        tytul_a VARCHAR2,
        autor_a VARCHAR2,
        czasopismo_a number
    );

    PROCEDURE DELETE_ARTYKUL(
        id_a NUMBER
    );

    PROCEDURE UPDATE_ARTYKUL(
        id_a NUMBER,
        tytul_a VARCHAR2,
        autor_a VARCHAR2
    );
END artykul_pkg;

/
--------------------------------------------------------
--  DDL for Package CZASOPISMO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."CZASOPISMO_PKG" IS
    PROCEDURE INSERT_CZASOPISMO(
        nazwa_c VARCHAR2,
        wydawca_c VARCHAR2,
        czytelniaID_c NUMBER,
        status_c VARCHAR2,
        numerWydania_c VARCHAR2
    );

    PROCEDURE DELETE_CZASOPISMO(id_c NUMBER);

    PROCEDURE UPDATE_CZASOPISMO(
        id_c NUMBER,
        nazwa_c VARCHAR2,
        wydawca_c VARCHAR2,
        czytelniaID_c NUMBER,
        status_c VARCHAR2,
        numerWydania_c VARCHAR2
    );
END czasopismo_pkg;

/
--------------------------------------------------------
--  DDL for Package CZYTELNIK_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."CZYTELNIK_PKG" IS
    PROCEDURE INSERT_CZYTELNICY(imie_c varchar, nazwisko_c VARCHAR, 
    adres varchar, dataurodzenia_c date, datazapisania_c date, ranga_C number);

    PROCEDURE DELETE_CZYTELNIK(id_c NUMBER);
    PROCEDURE UPDATE_CZYTELNIK(
    id_c NUMBER,
    imie_c VARCHAR,
    nazwisko_c VARCHAR,
    adres VARCHAR,
    dataurodzenia_c DATE,
    datazapisania_c DATE,
    ranga_c NUMBER
);
    FUNCTION liczba_wypozyczonych_pozycji(czytelnik_id_c IN NUMBER) RETURN NUMBER;

END czytelnik_pkg;

/
--------------------------------------------------------
--  DDL for Package KARA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."KARA_PKG" AS

    PROCEDURE INSERT_KARA(
        opis_c VARCHAR2,
        kwota_c NUMBER,
        czytelnik_id_c NUMBER,
        pracownik_id_c NUMBER,
        data_wystawienia_c DATE
    );

    PROCEDURE DELETE_KARA(id_c NUMBER);

    PROCEDURE UPDATE_KARA(
        id_c NUMBER,
        opis_c VARCHAR2,
        kwota_c NUMBER,
        czytelnik_id_c NUMBER,
        pracownik_id_c NUMBER,
        data_wystawienia_c DATE
    );
      FUNCTION ZLICZKARY RETURN SYS_REFCURSOR;

END kara_pkg;

/
--------------------------------------------------------
--  DDL for Package KSIAZKA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."KSIAZKA_PKG" IS
    PROCEDURE INSERT_KSIAZKA(
        nazwa VARCHAR2,
        autor VARCHAR2,
        gatunek VARCHAR2,
        wydawnictwo VARCHAR2,
        rok_wydania NUMBER,
        czytelnia_id NUMBER,
        status VARCHAR2
    );

    PROCEDURE DELETE_KSIAZKA(id_c NUMBER);

    PROCEDURE UPDATE_KSIAZKA(
        id_c NUMBER,
        nazwa_c VARCHAR2,
        autor_c VARCHAR2,
        gatunek_c VARCHAR2,
        wydawnictwo_c VARCHAR2,
        rok_wydania_c NUMBER,
        czytelnia_id NUMBER,
        status_c VARCHAR2
    );
    FUNCTION ZLICZ_GATUNKI RETURN SYS_REFCURSOR;

END ksiazka_pkg;

/
--------------------------------------------------------
--  DDL for Package PRACOWNIK_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."PRACOWNIK_PKG" IS
    PROCEDURE INSERT_PRACOWNIK(imie_c varchar, nazwisko_c VARCHAR, 
    stanowisko varchar, czytelniaid number, pensja number, datazatrudnienia date);

    PROCEDURE DELETE_Pracownik(id_c NUMBER);

     PROCEDURE UPDATE_PRACOWNIK(
        id_c NUMBER,
        imie_c VARCHAR,
        nazwisko_c VARCHAR,
        stanowisko_c VARCHAR,
        czytelniaid_c NUMBER,
        pensja_c NUMBER,
        datazatrudnienia_c DATE
    );

END pracownik_pkg;

/
--------------------------------------------------------
--  DDL for Package WYPOZYCZENIE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."WYPOZYCZENIE_PKG" IS
    PROCEDURE INSERT_WYPOZYCZENIA(
        zamowienie_id NUMBER,
        pracownik_id NUMBER,
        data_wypozyczenia DATE,
        data_zwrotu DATE
    );

    PROCEDURE DELETE_WYPOZYCZENIE(id_c NUMBER);

    PROCEDURE UPDATE_WYPOZYCZENIE(
        id_c NUMBER,
        zamowienie_id NUMBER,
        pracownik_id NUMBER,
        data_wypozyczenia DATE,
        data_zwrotu DATE
    );

END wypozyczenie_pkg;

/
--------------------------------------------------------
--  DDL for Package ZAMOWIENIA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BIBLIOTEKA"."ZAMOWIENIA_PKG" IS
    PROCEDURE INSERT_ZAMOWIENIE(
        czytelnik_id NUMBER,
        data_zamowienia DATE,
        status VARCHAR,
        zamowienie_id OUT NUMBER
    );
    PROCEDURE INSERT_KSIAZKA (
    zamowienie_id NUMBER,
    ksiazka_id NUMBER
);
PROCEDURE INSERT_CZASOPISMO(
    zamowienie_id NUMBER,
    czasopismo_id NUMBER
);

    PROCEDURE DELETE_zamowienie(id_c NUMBER);

    PROCEDURE UPDATE_ZAMOWIENIE(
    id_c NUMBER,
    czytelnik_id NUMBER,
    data_zamowienia DATE,
    status VARCHAR
);
 FUNCTION GET_ZAMOWIENIE_SZCZEGOLY(
        p_id IN NUMBER
    ) RETURN SYS_REFCURSOR;

END zamowienia_pkg;

/
--------------------------------------------------------
--  DDL for Package Body ARTYKUL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."ARTYKUL_PKG" IS

    PROCEDURE INSERT_ARTYKUL(
        tytul_a VARCHAR2,
        autor_a VARCHAR2,
        czasopismo_a number
    ) IS
        artykul_id NUMBER;
    BEGIN
        INSERT INTO ARTYKULY (TYTU�, AUTOR)
        VALUES (tytul_a, autor_a)
        RETURNING ID INTO artykul_id; 

        INSERT INTO ARTYKULYCZASOPISMA (ARTYKU�, CZASOPISMO)
        VALUES (artykul_id, czasopismo_a);
    END INSERT_ARTYKUL;

    PROCEDURE DELETE_ARTYKUL(
        id_a NUMBER
    ) IS
    BEGIN
        DELETE FROM ARTYKULY
        WHERE ID = id_a;
        COMMIT;
    END DELETE_ARTYKUL;

    PROCEDURE UPDATE_ARTYKUL(
        id_a NUMBER,
        tytul_a VARCHAR2,
        autor_a VARCHAR2
    ) IS
    BEGIN
        UPDATE ARTYKULY
        SET TYTU� = tytul_a,
            AUTOR = autor_a
        WHERE ID = id_a;
        COMMIT;
    END UPDATE_ARTYKUL;

END artykul_pkg;

/
--------------------------------------------------------
--  DDL for Package Body CZASOPISMO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."CZASOPISMO_PKG" IS

    PROCEDURE INSERT_CZASOPISMO(
        nazwa_c VARCHAR2,
        wydawca_c VARCHAR2,
        czytelniaID_c NUMBER,
        status_c VARCHAR2,
        numerWydania_c VARCHAR2
    ) AS
    BEGIN
        INSERT INTO czasopisma (
            nazwa,
            wydawca,
            czytelniaID,
            status,
            numerWydania
        ) VALUES (
            nazwa_c,
            wydawca_c,
            czytelniaID_c,
            status_c,
            numerWydania_c
        );
    END;

    PROCEDURE DELETE_CZASOPISMO(id_c NUMBER) AS
    BEGIN
        DELETE FROM czasopisma WHERE id = id_c;
    END;
    PROCEDURE UPDATE_CZASOPISMO(
        id_c NUMBER,
        nazwa_c VARCHAR2,
        wydawca_c VARCHAR2,
        czytelniaID_c NUMBER,
        status_c VARCHAR2,
        numerWydania_c VARCHAR2
    ) AS
    BEGIN
        UPDATE czasopisma
        SET
            nazwa = nazwa_c,
            wydawca = wydawca_c,
            czytelniaID = czytelniaID_c,
            status = status_c,
            numerWydania = numerWydania_c
        WHERE id = id_c;
    END;

END czasopismo_pkg;

/
--------------------------------------------------------
--  DDL for Package Body CZYTELNIK_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."CZYTELNIK_PKG" IS

    PROCEDURE INSERT_CZYTELNICY(imie_c varchar, nazwisko_c VARCHAR, 
    adres varchar, dataurodzenia_c date, datazapisania_c date, ranga_C number)
    AS
    BEGIN

    INSERT INTO czytelnicy( IMIE, nazwisko, adreszamieszkania,dataurodzenia, datazapisania, ranga)
    values( imie_c, nazwisko_c, adres, dataurodzenia_c,datazapisania_c ,ranga_c );
    END;

    PROCEDURE DELETE_CZYTELNIK(id_c number)
    as
    begin
    delete from CZYTELNICY where id = id_c;
    end;

    PROCEDURE UPDATE_CZYTELNIK(
    id_c NUMBER,
    imie_c VARCHAR,
    nazwisko_c VARCHAR,
    adres VARCHAR,
    dataurodzenia_c DATE,
    datazapisania_c DATE,
    ranga_c NUMBER
)
AS
BEGIN
    UPDATE czytelnicy
    SET
        imie = imie_c,
        nazwisko = nazwisko_c,
        adreszamieszkania = adres,
        dataurodzenia = dataurodzenia_c,
        datazapisania = datazapisania_c,
        ranga = ranga_c
    WHERE id = id_c;
END;
FUNCTION liczba_wypozyczonych_pozycji(czytelnik_id_c IN NUMBER) RETURN NUMBER IS
    v_ilosc NUMBER;
    v_ilosc2 NUMBER;
    v_ilosc3 NUMBER;
BEGIN
    SELECT COUNT(*)
        INTO v_ilosc
        FROM wypozyczenia w
        INNER JOIN zamowienia z ON w.zam�wienieid = z.id
        WHERE z.czytelnikid = czytelnik_id_c AND w.datazwrotu IS NULL;

   SELECT COUNT(*)
    INTO v_ilosc2
    FROM zamowieniaksiazki z
    INNER JOIN zamowienia zam ON z.zam�wienie = zam.id
    WHERE zam.czytelnikid = czytelnik_id_c;

    SELECT COUNT(*)
    INTO v_ilosc3
    FROM zamowieniaczasopisma z
    INNER JOIN zamowienia zam ON z.zam�wienie = zam.id
    WHERE zam.czytelnikid = czytelnik_id_c AND zam.status not like 'Zrealizowane' and zam.status not like 'Anulowane';

        RETURN v_ilosc+ v_ilosc2+v_ilosc3;
END;

END czytelnik_pkg;

/
--------------------------------------------------------
--  DDL for Package Body KARA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."KARA_PKG" IS

    PROCEDURE INSERT_KARA(
        opis_c VARCHAR2,
        kwota_c NUMBER,
        czytelnik_id_c NUMBER,
        pracownik_id_c NUMBER,
        data_wystawienia_c DATE
    ) AS
    BEGIN
        INSERT INTO kary (OPIS, KWOTA, CZYTELNIKID, PRACOWNIKID, DATAWYSTAWIENIA)
        VALUES (opis_c, kwota_c, czytelnik_id_c, pracownik_id_c, data_wystawienia_c);
    END;

    PROCEDURE DELETE_KARA(id_c NUMBER) AS
    BEGIN
        DELETE FROM kary WHERE id = id_c;
    END;

    PROCEDURE UPDATE_KARA(
        id_c NUMBER,
        opis_c VARCHAR2,
        kwota_c NUMBER,
        czytelnik_id_c NUMBER,
        pracownik_id_c NUMBER,
        data_wystawienia_c DATE
    ) AS
    BEGIN
        UPDATE kary
        SET
            OPIS = opis_c,
            KWOTA = kwota_c,
            CZYTELNIKID = czytelnik_id_c,
            PRACOWNIKID = pracownik_id_c,
            DATAWYSTAWIENIA = data_wystawienia_c
        WHERE ID = id_c;
    END;
    FUNCTION ZLICZKARY RETURN SYS_REFCURSOR IS
    pracownicy_cur SYS_REFCURSOR;
  BEGIN
    OPEN pracownicy_cur FOR
      SELECT P.ID AS PRACOWNIK_ID, P.IMI�, P.NAZWISKO, COUNT(K.ID) AS LICZBA_KAR, SUM(K.KWOTA) AS LACZNA_KWOTA
      FROM PRACOWNICY P
      LEFT JOIN KARY K ON P.ID = K.PRACOWNIKID
      GROUP BY P.ID, P.IMI�, P.NAZWISKO
      ORDER BY COUNT(K.ID) DESC;
    RETURN pracownicy_cur;
  END ZLICZKARY;
END kara_pkg;


/
--------------------------------------------------------
--  DDL for Package Body KSIAZKA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."KSIAZKA_PKG" IS

    PROCEDURE INSERT_KSIAZKA(
        nazwa VARCHAR2,
        autor VARCHAR2,
        gatunek VARCHAR2,
        wydawnictwo VARCHAR2,
        rok_wydania NUMBER,
        czytelnia_id NUMBER,
        status VARCHAR2
    ) AS
    BEGIN
        INSERT INTO ksiazki (NAZWA, AUTOR, GATUNEK, WYDAWNICTWO, ROKWYDANIA, CZYTELNIAID, STATUS)
        VALUES (nazwa, autor, gatunek, wydawnictwo, rok_wydania, czytelnia_id, status);
    END INSERT_KSIAZKA;

    PROCEDURE DELETE_KSIAZKA(id_c NUMBER) AS
    BEGIN
        DELETE FROM ksiazki WHERE ID = id_c;
    END DELETE_KSIAZKA;

    PROCEDURE UPDATE_KSIAZKA(
        id_c NUMBER,
        nazwa_c VARCHAR2,
        autor_c VARCHAR2,
        gatunek_c VARCHAR2,
        wydawnictwo_c VARCHAR2,
        rok_wydania_c NUMBER,
        czytelnia_id NUMBER,
        status_c VARCHAR2
    ) AS
    BEGIN
        UPDATE ksiazki
        SET
            NAZWA = nazwa_c,
            AUTOR = autor_c,
            GATUNEK = gatunek_c,
            WYDAWNICTWO = wydawnictwo_c,
            ROKWYDANIA = rok_wydania_c,
            CZYTELNIAID = czytelnia_id,
            STATUS = status_c
        WHERE ID = id_c;
    END UPDATE_KSIAZKA;

    FUNCTION ZLICZ_GATUNKI RETURN SYS_REFCURSOR IS
    l_cursor SYS_REFCURSOR;
BEGIN
    OPEN l_cursor FOR
        SELECT GATUNEK, COUNT(*) AS LICZBA_KSIAZEK
        FROM KSIAZKI
        GROUP BY GATUNEK
        ORDER BY LICZBA_KSIAZEK DESC;

    RETURN l_cursor;
END ZLICZ_GATUNKI;

END ksiazka_pkg;

/
--------------------------------------------------------
--  DDL for Package Body PRACOWNIK_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."PRACOWNIK_PKG" IS
     PROCEDURE INSERT_PRACOWNIK(imie_c VARCHAR, nazwisko_c VARCHAR, stanowisko VARCHAR, czytelniaid NUMBER, pensja NUMBER, datazatrudnienia DATE)
    AS
    BEGIN
        INSERT INTO pracownicy (IMI�, NAZWISKO, STANOWISKO, CZYTELNIAID, PENSJA, DATAZATRUDNIENIA)
        VALUES (imie_c, nazwisko_c, stanowisko, czytelniaid, pensja, datazatrudnienia);
    END;

    PROCEDURE DELETE_PRACOWNIK(id_c NUMBER)
    AS
    BEGIN
        DELETE FROM pracownicy WHERE id = id_c;
    END;


    PROCEDURE UPDATE_PRACOWNIK(
        id_c NUMBER,
        imie_c VARCHAR,
        nazwisko_c VARCHAR,
        stanowisko_c VARCHAR,
        czytelniaid_c NUMBER,
        pensja_c NUMBER,
        datazatrudnienia_c DATE
    )
    AS
    BEGIN
        UPDATE pracownicy
        SET
            imi� = imie_c,
            nazwisko = nazwisko_c,
            stanowisko = stanowisko_c,
            czytelniaid = czytelniaid_c,
            pensja = pensja_c,
            datazatrudnienia = datazatrudnienia_c
        WHERE id = id_c;
    END;
END pracownik_pkg;

/
--------------------------------------------------------
--  DDL for Package Body WYPOZYCZENIE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."WYPOZYCZENIE_PKG" IS

    PROCEDURE INSERT_WYPOZYCZENIA(
        zamowienie_id NUMBER,
        pracownik_id NUMBER,
        data_wypozyczenia DATE,
        data_zwrotu DATE
    )
    AS
    BEGIN
        INSERT INTO wypozyczenia (ZAM�WIENIEID, PRACOWNIKID, DATAWYPO�YCZENIA, DATAZWROTU)
        VALUES (zamowienie_id, pracownik_id, data_wypozyczenia, data_zwrotu);
    END;

    PROCEDURE DELETE_WYPOZYCZENIE(id_c NUMBER)
    AS
    BEGIN
        DELETE FROM wypozyczenia WHERE ID = id_c;
    END;

    PROCEDURE UPDATE_WYPOZYCZENIE(
        id_c NUMBER,
        zamowienie_id NUMBER,
        pracownik_id NUMBER,
        data_wypozyczenia DATE,
        data_zwrotu DATE
    )
    AS
    BEGIN
        UPDATE wypozyczenia
        SET
            ZAM�WIENIEID = zamowienie_id,
            PRACOWNIKID = pracownik_id,
            DATAWYPO�YCZENIA = data_wypozyczenia,
            DATAZWROTU = data_zwrotu
        WHERE ID = id_c;
    END;

END wypozyczenie_pkg;

/
--------------------------------------------------------
--  DDL for Package Body ZAMOWIENIA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "BIBLIOTEKA"."ZAMOWIENIA_PKG" IS
      PROCEDURE INSERT_ZAMOWIENIE(
        czytelnik_id NUMBER,
        data_zamowienia DATE,
        status VARCHAR,
        zamowienie_id OUT NUMBER
    )
    AS
    BEGIN
        INSERT INTO zamowienia (CZYTELNIKID, DATAZAMOWIENIA, STATUS)
        VALUES (czytelnik_id, data_zamowienia, status)
        RETURNING ID INTO zamowienie_id;
    END;
    PROCEDURE INSERT_KSIAZKA (
    zamowienie_id NUMBER,
    ksiazka_id NUMBER
)
AS
BEGIN
    INSERT INTO zamowieniaksiazki (ZAM�WIENIE, KSI��KA)
    VALUES (zamowienie_id, ksiazka_id);

END INSERT_KSIAZKA;
PROCEDURE INSERT_CZASOPISMO (
    zamowienie_id NUMBER,
    czasopismo_id NUMBER
)
AS
BEGIN
    INSERT INTO zamowieniaczasopisma (ZAM�WIENIE, CZASOPISMO)
    VALUES (zamowienie_id, czasopismo_id);

END INSERT_CZASOPISMO;


    PROCEDURE DELETE_zamowienie(id_c NUMBER)
    AS
    BEGIN
        DELETE FROM zamowienia WHERE id = id_c;
    END;

    PROCEDURE UPDATE_ZAMOWIENIE(
    id_c NUMBER,
    czytelnik_id NUMBER,
    data_zamowienia DATE,
    status VARCHAR
)
AS
BEGIN
    UPDATE zamowienia
    SET
        CZYTELNIKID = czytelnik_id,
        DATAZAMOWIENIA = data_zamowienia,
        STATUS = status
    WHERE ID = id_c;
END;
 FUNCTION GET_ZAMOWIENIE_SZCZEGOLY(
        p_id IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        l_cursor SYS_REFCURSOR;
    BEGIN
        OPEN l_cursor FOR
            SELECT 
                z.ID AS zamowienie_id, 
                z.CZYTELNIKID, 
                z.DATAZAMOWIENIA, 
                z.STATUS, 
                'KSIAZKA' AS typ, 
                k.ID AS item_id, 
                k.NAZWA AS item_tytul
            FROM zamowienia z
            LEFT JOIN zamowieniaksiazki zk ON z.ID = zk.ZAM�WIENIE
            LEFT JOIN ksiazki k ON zk.KSI��KA = k.ID
            WHERE z.ID = p_id
            UNION ALL
            SELECT 
                z.ID AS zamowienie_id, 
                z.CZYTELNIKID, 
                z.DATAZAMOWIENIA, 
                z.STATUS, 
                'CZASOPISMO' AS typ, 
                c.ID AS item_id, 
                c.NAZWA AS item_tytul
            FROM zamowienia z
            LEFT JOIN zamowieniaczasopisma zc ON z.ID = zc.ZAM�WIENIE
            LEFT JOIN czasopisma c ON zc.CZASOPISMO = c.ID
            WHERE z.ID = p_id;
        RETURN l_cursor;
    END GET_ZAMOWIENIE_SZCZEGOLY;

END zamowienia_pkg;

/
--------------------------------------------------------
--  DDL for Function SELECT_DATA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BIBLIOTEKA"."SELECT_DATA" (table_name IN VARCHAR2) RETURN SYS_REFCURSOR IS
    data_cursor SYS_REFCURSOR;
BEGIN
    OPEN data_cursor FOR 'SELECT * FROM ' || table_name;
    RETURN data_cursor;
END;

/
--------------------------------------------------------
--  Constraints for Table ARTYKULY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ARTYKULY" MODIFY ("TYTU�" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ARTYKULY" MODIFY ("AUTOR" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ARTYKULY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZAMOWIENIAKSIAZKI
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIAKSIAZKI" MODIFY ("ZAM�WIENIE" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIAKSIAZKI" MODIFY ("KSI��KA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIAKSIAZKI" ADD PRIMARY KEY ("ZAM�WIENIE", "KSI��KA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CZYTELNICY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" MODIFY ("IMIE" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" MODIFY ("DATAURODZENIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" MODIFY ("DATAZAPISANIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" MODIFY ("RANGA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ARTYKULYCZASOPISMA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ARTYKULYCZASOPISMA" MODIFY ("ARTYKU�" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ARTYKULYCZASOPISMA" MODIFY ("CZASOPISMO" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ARTYKULYCZASOPISMA" ADD PRIMARY KEY ("ARTYKU�", "CZASOPISMO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CZYTELNIA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."CZYTELNIA" MODIFY ("ADRES" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZYTELNIA" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WYPOZYCZENIA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."WYPOZYCZENIA" MODIFY ("ZAM�WIENIEID" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."WYPOZYCZENIA" MODIFY ("DATAWYPO�YCZENIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."WYPOZYCZENIA" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CZASOPISMA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."CZASOPISMA" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZASOPISMA" MODIFY ("WYDAWCA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZASOPISMA" MODIFY ("CZYTELNIAID" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZASOPISMA" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."CZASOPISMA" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KSIAZKI
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" MODIFY ("AUTOR" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" MODIFY ("WYDAWNICTWO" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" MODIFY ("ROKWYDANIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" MODIFY ("CZYTELNIAID" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KARY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."KARY" MODIFY ("KWOTA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KARY" MODIFY ("DATAWYSTAWIENIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."KARY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZAMOWIENIA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIA" MODIFY ("CZYTELNIKID" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIA" MODIFY ("DATAZAMOWIENIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIA" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIA" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZAMOWIENIACZASOPISMA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIACZASOPISMA" ADD PRIMARY KEY ("ZAM�WIENIE", "CZASOPISMO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RANGI
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."RANGI" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."RANGI" MODIFY ("WYMAGANYSTA�" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."RANGI" MODIFY ("MAXWYPOZYCZENIE" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."RANGI" MODIFY ("MAXCZASWYPOZYCZENIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."RANGI" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRACOWNICY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" MODIFY ("IMI�" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" MODIFY ("NAZWISKO" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" MODIFY ("STANOWISKO" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" MODIFY ("CZYTELNIAID" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" MODIFY ("PENSJA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" MODIFY ("DATAZATRUDNIENIA" NOT NULL ENABLE);
  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ARTYKULYCZASOPISMA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ARTYKULYCZASOPISMA" ADD FOREIGN KEY ("ARTYKU�")
	  REFERENCES "BIBLIOTEKA"."ARTYKULY" ("ID") ENABLE;
  ALTER TABLE "BIBLIOTEKA"."ARTYKULYCZASOPISMA" ADD FOREIGN KEY ("CZASOPISMO")
	  REFERENCES "BIBLIOTEKA"."CZASOPISMA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CZASOPISMA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."CZASOPISMA" ADD FOREIGN KEY ("CZYTELNIAID")
	  REFERENCES "BIBLIOTEKA"."CZYTELNIA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CZYTELNICY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."CZYTELNICY" ADD FOREIGN KEY ("RANGA")
	  REFERENCES "BIBLIOTEKA"."RANGI" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KARY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."KARY" ADD CONSTRAINT "KARY_CZYTELNIKID" FOREIGN KEY ("CZYTELNIKID")
	  REFERENCES "BIBLIOTEKA"."CZYTELNICY" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BIBLIOTEKA"."KARY" ADD CONSTRAINT "FK_KARY_PRACOWNIK" FOREIGN KEY ("PRACOWNIKID")
	  REFERENCES "BIBLIOTEKA"."PRACOWNICY" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KSIAZKI
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."KSIAZKI" ADD FOREIGN KEY ("CZYTELNIAID")
	  REFERENCES "BIBLIOTEKA"."CZYTELNIA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRACOWNICY
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."PRACOWNICY" ADD FOREIGN KEY ("CZYTELNIAID")
	  REFERENCES "BIBLIOTEKA"."CZYTELNIA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WYPOZYCZENIA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."WYPOZYCZENIA" ADD CONSTRAINT "WYPO�YCZENIA_ZAM�WIENIA" FOREIGN KEY ("ZAM�WIENIEID")
	  REFERENCES "BIBLIOTEKA"."ZAMOWIENIA" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BIBLIOTEKA"."WYPOZYCZENIA" ADD CONSTRAINT "FK_WYPOZYCZENIA_PRACOWNIK" FOREIGN KEY ("PRACOWNIKID")
	  REFERENCES "BIBLIOTEKA"."PRACOWNICY" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAMOWIENIA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIA" ADD CONSTRAINT "CZYTELNIKID" FOREIGN KEY ("CZYTELNIKID")
	  REFERENCES "BIBLIOTEKA"."CZYTELNICY" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAMOWIENIACZASOPISMA
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIACZASOPISMA" ADD CONSTRAINT "FK_CZASOPISMO" FOREIGN KEY ("CZASOPISMO")
	  REFERENCES "BIBLIOTEKA"."CZASOPISMA" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIACZASOPISMA" ADD CONSTRAINT "FK_ZAMOWIENIE_CZASOPISMO" FOREIGN KEY ("ZAM�WIENIE")
	  REFERENCES "BIBLIOTEKA"."ZAMOWIENIA" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAMOWIENIAKSIAZKI
--------------------------------------------------------

  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIAKSIAZKI" ADD CONSTRAINT "FK_ZAMOWIENIE" FOREIGN KEY ("ZAM�WIENIE")
	  REFERENCES "BIBLIOTEKA"."ZAMOWIENIA" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BIBLIOTEKA"."ZAMOWIENIAKSIAZKI" ADD CONSTRAINT "FK_KSI��KA" FOREIGN KEY ("KSI��KA")
	  REFERENCES "BIBLIOTEKA"."KSIAZKI" ("ID") ON DELETE CASCADE ENABLE;
