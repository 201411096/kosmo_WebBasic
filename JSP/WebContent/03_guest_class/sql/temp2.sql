--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-18-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TEMP2
--------------------------------------------------------

  CREATE TABLE "SCOTT"."TEMP2" 
   (	"ID" VARCHAR2(10 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"TEL" VARCHAR2(50 BYTE), 
	"ADDR" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.TEMP2
SET DEFINE OFF;
Insert into SCOTT.TEMP2 (ID,PASSWORD,NAME,TEL,ADDR) values ('sdf1','sdf','e°？e？？e？¤','11-22-333','sdf5');
Insert into SCOTT.TEMP2 (ID,PASSWORD,NAME,TEL,ADDR) values ('sdf12','sdf','가나다','11-22-333','sdf5');
Insert into SCOTT.TEMP2 (ID,PASSWORD,NAME,TEL,ADDR) values ('sdf1111','sdf','가나다','dsf','sdf');
Insert into SCOTT.TEMP2 (ID,PASSWORD,NAME,TEL,ADDR) values ('sdf125',null,'가나다','sdf4','sdfsdf');
Insert into SCOTT.TEMP2 (ID,PASSWORD,NAME,TEL,ADDR) values ('sdf3333','sdf3333',null,null,null);
Insert into SCOTT.TEMP2 (ID,PASSWORD,NAME,TEL,ADDR) values ('sdf444','sdf444','가나다라','033333333','sdfsdfㄴㅇㄹㄴㅇㄹㄴㅇㄹ');
--------------------------------------------------------
--  DDL for Index TEMP2_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."TEMP2_PK" ON "SCOTT"."TEMP2" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TEMP2
--------------------------------------------------------

  ALTER TABLE "SCOTT"."TEMP2" ADD CONSTRAINT "TEMP2_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
