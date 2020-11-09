--------------------------------------------------------
--  ÆÄÀÏÀÌ »ý¼ºµÊ - ¿ù¿äÀÏ-5¿ù-18-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ARTICLE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."ARTICLE" 
   (	"ARTICLE_ID" NUMBER, 
	"GROUP_ID" NUMBER, 
	"SEQUENCE_NO" CHAR(16 BYTE), 
	"POSTING_DATE" DATE, 
	"READ_COUNT" NUMBER, 
	"WRITER_NAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.ARTICLE
SET DEFINE OFF;
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (20,19,'0000000019999999',to_date('20/05/15','RR/MM/DD'),1,'22','22','22','22');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (22,21,'0000000021999999',to_date('20/05/15','RR/MM/DD'),2,'sdfsdf','sdfsdfsdf','sdfsdfsdf','sdfsdfsdf');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (27,23,'0000000023999999',to_date('20/05/15','RR/MM/DD'),6,'¿ì¾Ó','dz','¿ì¾Æ¾Æ¾Æ¾Ó','¿¨?');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (16,15,'0000000015999999',to_date('20/05/15','RR/MM/DD'),8,'ÀÛ¼ºÀÚ33','4444','Á¦¸ñ333','³»¿ë333');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (30,26,'0000000026999999',to_date('20/05/15','RR/MM/DD'),3,'hihi','1','hihi','hihi');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (33,26,'0000000026989899',to_date('20/05/15','RR/MM/DD'),1,'°ø°ÝÀÌ´Ù~','1','°¡ÀÚ~','¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»¤»');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (34,23,'0000000023989999',to_date('20/05/15','RR/MM/DD'),1,'¿ÀÀ×?','1','¿¨?','ŸÓ?');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (37,22,'0000000022989899',to_date('20/05/15','RR/MM/DD'),1,'ÈñÈþ><','1','ÈñÈñÈö','ÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñÈñ');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (41,31,'0000000031989999',to_date('20/05/15','RR/MM/DD'),3,'1ÀÏ 1±ø³² ¼­¿µÃ¶','1155','Á¦°¡ ¿Ó´Ù°«¾î¿ä','¿©±â°¡ ±× ÇÖÇÑ ±øÀÎ°¡¿ä?');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (42,31,'0000000031989899',to_date('20/05/15','RR/MM/DD'),5,'±ø±ø¼ö¿ù·¡','0099','±øÀÌ´Ù','ÈåÈåÈå ');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (46,32,'0000000032999999',to_date('20/05/15','RR/MM/DD'),6,'¿ë¼Ò´Ï ',null,'¿ë¼Ò´ÏÀÇ ÇÏ·ç','³ª·çÅä¸¦ º¸¾Ò´Ù Àç¹Õ¾ú´Ù ÇÏÇÏÇÏÁK
³»ÀÏ¶ÇºÁ¾ßÂ¡');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (47,32,'0000000032989999',to_date('20/05/15','RR/MM/DD'),2,'¤¹¤¹',null,'¤¹¤¹¤¹¤¸','¤¹¤¹¤¹¤¹¤¹¤¹');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (48,32,'0000000032979999',to_date('20/05/15','RR/MM/DD'),1,'sdf','sdf','sdf','sdf');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (49,32,'0000000032989899',to_date('20/05/15','RR/MM/DD'),2,'ww','ww','ww','ww');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (50,32,'0000000032989898',to_date('20/05/15','RR/MM/DD'),1,'www','www','www','www');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (53,34,'0000000034999999',to_date('20/05/15','RR/MM/DD'),1,'ÀÛ¼ºÀÚ1111','ÀÛ¼ºÀÚ1111','ÀÛ¼ºÀÚ1111','ÀÛ¼ºÀÚ1111');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (18,17,'0000000017999999',to_date('20/05/15','RR/MM/DD'),16,'7¹ø','7','7¹ø ±Û','7¹ø ±Û');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (19,18,'0000000018999999',to_date('20/05/15','RR/MM/DD'),54,'20¹ø','20','11','10');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (17,16,'0000000016999999',to_date('20/05/15','RR/MM/DD'),23,'ÀÛ¼ºÀÚ133',null,'Á¦¸ñ1333','³»¿ë4444');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (21,20,'0000000020999999',to_date('20/05/15','RR/MM/DD'),1,'sdf','sdf','sdf','sdf');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (23,22,'0000000022999999',to_date('20/05/15','RR/MM/DD'),5,'55','55','55','55');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (24,17,'0000000017989999',to_date('20/05/15','RR/MM/DD'),0,'7¹ø´äº¯','1','7¹ø´äº¯','7¹ø´äº¯');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (25,22,'0000000022989999',to_date('20/05/15','RR/MM/DD'),3,'ÇÏÇ×><','1','ÇÏÇ×><','ÇÏÇ×><');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (26,22,'0000000022979999',to_date('20/05/15','RR/MM/DD'),1,'55´äº¯ÀÛ¼ºÀÚ','123','55´äº¯Á¦¸ñ','55´äº¯³»¿ë');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (31,26,'0000000026989999',to_date('20/05/15','RR/MM/DD'),2,'hihi2','2','hihi2','hihi2');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (32,27,'0000000027999999',to_date('20/05/15','RR/MM/DD'),8,'È£¿¡¿¡¿¡?','asd','È£¿¡¿¡¤Ä¿¨¿¡¿¡??','È£ÀÕ!');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (40,31,'0000000031999999',to_date('20/05/15','RR/MM/DD'),17,'³ª·çÅä','asdf','ÇÑ¹ø¸¸ º¸¼¼¿ä','¹Ì¾ÈÇÏ´Ù ÀÌ°Å º¸¿©ÁÖ·Á°í ¾î±×·Î²ø¾ú´Ù.. ³ª·çÅä »ç½ºÄÉ ½Î¿ò¼öÁØ ¤©¤·½ÇÈ­³Ä? ÁøÂ¥ ¼¼°è°üÃÖ°­ÀÚµéÀÇ ½Î¿òÀÌ´Ù.. ±×Âðµû°°´ø ³ª·çÅä°¡ ¸Â³ª? ÁøÂ¥ ³ª·çÅä´Â Àü¼³ÀÌ´Ù..ÁøÂ¥¿¾³¯¿¡ ¸Ç³¯³ª·çÅä”U´Âµ¥ ¿Õ°°ÀºÁ¸ÀçÀÎ È£Ä«°Ô µÇ¼­ ¼¼°èÃÖ°­ Àü¼³ÀûÀÎ ¿µ¿õÀÌµÈ³ª·çÅäº¸¸é ÁøÂ¥³»°¡´Ù °¨°Ý½º·´°í ³ª·çÅä ³ë·¡ºÎÅÍ ¸íÀå¸é±îÁö °¡½¿¿ï¸®´ÂÀå¸éµéÀÌ ³ú¸®¿¡ ½ºÄ¡¸é¼­ °¡½¿ÀÌ ¿õÀåÇØÁø´Ù.. ±×¸®°í ±ØÀåÆÇ ¿¡ Ä«Ä«½Ã¾Õ¿¡ ¿î¼®³¯¶ó¿À´Â °Å´ëÇÑ °É »ç½ºÄÉ°¡ °©ÀÚ±â ¼ø½Ä°£¿¡ ³ªÅ¸³ª¼­ ºÎ½¤¹ö¸®°ï °³°£Áö³ª°Ô ³ª·çÅä°¡ ¾ø´Ù¸é ¸¶À»À» ÁöÅ³ ÀÚ´Â ³ª¹Û¿¡ ¾ø´Ù ¶ó¸ç ¹Ù¶÷Ã³·³ »ç¶óÁøÀå¸éÀº ÁøÂ¥ ³ª·çÅäÃ³À½ºÎÅÍ º»»ç¶÷ÀÌ¸é ¾È¿ï¼ö°¡¾ø´õ¶ó ÁøÂ¥ ³Ê¹« °¨°Ý½º·´°í º¸·çÅä¸¦ ÃÖ±Ù¿¡ ¾Ë¾Ò´Âµ¥ ¹Ì¾ÈÇÏ´Ù.. Áö±Ý20È­º¸´Âµ¥ ÁøÂ¥ ³ª·çÅä¼¼´ë³ª¿Í¼­ ³Ê¹« °¨¿©¿îµ¥ ³ª·çÅä¸¦º¸´Â°Í°°´Ù ¼º°Ýµµ ´à¾Ò¾î ±×¸®°í¹ö·çÅä¿¡ ³ª·çÅä»ç½ºÄÉ µÑÀÌ½Î¿öµµ ÀÌ±â´Â ½Å°°ÀºÁ¸Àç ³ª¿Â´Ù´Â°Ô »ç½ÇÀÓ?? ±×¸®°íÀÎÅÍ´Ö¿¡ ÃÄ”f´Âµð ÀÌ°Å ¤©¤·¤©¤· ÁøÂ¥ÆÑÆ®³Ä?? ÀúÀûÀÌ º¸·çÅä¿¡ ³ª¿À´Â ½Å±Þ±«¹°ÀÓ?¤Ñ ³ª·çÅä»ç½ºÄÉ ÇÕÃ¼ÇÑ°ÅºÁ¶ó Áø');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (43,31,'0000000031979999',to_date('20/05/15','RR/MM/DD'),2,'¾î¸Ó','1','¾î¸Ó','¾î¸Ó');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (44,31,'0000000031969999',to_date('20/05/15','RR/MM/DD'),2,'4040','4040','4040','4040');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (45,17,'0000000017979999',to_date('20/05/15','RR/MM/DD'),0,'7´ä','77','7´ä','7´ä');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (51,31,'0000000031989898',to_date('20/05/15','RR/MM/DD'),0,'³ª´Â ¾Ë°íÀÖ´Ù','asd','´©°¡±øÀÎÁö ³ª´Â ¾Ë°íÀÖ´Ù.','ÀÌ ±ÛÀ» ¾´ »ç¶÷ ³»°¡ ¾È´Ù.');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (36,22,'0000000022969999',to_date('20/05/15','RR/MM/DD'),1,'sdf','sdf','sdf','sdf');
Insert into SCOTT.ARTICLE (ARTICLE_ID,GROUP_ID,SEQUENCE_NO,POSTING_DATE,READ_COUNT,WRITER_NAME,PASSWORD,TITLE,CONTENT) values (35,28,'0000000028999999',to_date('20/05/15','RR/MM/DD'),8,'È«±æµ¿','asd','¿©±â°¡ ¿äÁòÇÖÇÑ ±×°÷ÀÎ°¡?','>0<');
--------------------------------------------------------
--  DDL for Index ARTICLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."ARTICLE_PK" ON "SCOTT"."ARTICLE" ("ARTICLE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ARTICLE
--------------------------------------------------------

  ALTER TABLE "SCOTT"."ARTICLE" ADD CONSTRAINT "ARTICLE_PK" PRIMARY KEY ("ARTICLE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
