--------------------------------------------------------
--  文件已创建 - 星期五-十一月-05-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BASE_ADMIN_PERMISSION
--------------------------------------------------------

  CREATE TABLE "MANAGER"."BASE_ADMIN_PERMISSION" 
   (	"ID" NUMBER(10,0), 
	"NAME" VARCHAR2(30 CHAR), 
	"PID" NUMBER(10,0), 
	"DESCPT" VARCHAR2(50 CHAR), 
	"URL" VARCHAR2(100 CHAR), 
	"CREATE_TIME" VARCHAR2(64 CHAR), 
	"UPDATE_TIME" VARCHAR2(64 CHAR), 
	"DEL_FLAG" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BASE_ADMIN_ROLE
--------------------------------------------------------

  CREATE TABLE "MANAGER"."BASE_ADMIN_ROLE" 
   (	"ID" NUMBER(10,0), 
	"ROLE_NAME" VARCHAR2(30 CHAR), 
	"ROLE_DESC" VARCHAR2(100 CHAR), 
	"PERMISSIONS" VARCHAR2(20 CHAR), 
	"CREATE_TIME" VARCHAR2(64 CHAR), 
	"UPDATE_TIME" VARCHAR2(64 CHAR), 
	"ROLE_STATUS" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BASE_ADMIN_USER
--------------------------------------------------------

  CREATE TABLE "MANAGER"."BASE_ADMIN_USER" 
   (	"ID" NUMBER(10,0), 
	"SYS_USER_NAME" VARCHAR2(50 CHAR), 
	"SYS_USER_PWD" VARCHAR2(250 CHAR), 
	"ROLE_ID" NUMBER(10,0), 
	"USER_PHONE" VARCHAR2(11 CHAR), 
	"REG_TIME" VARCHAR2(32 CHAR), 
	"USER_STATUS" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "MANAGER"."PRODUCT" 
   (	"ID" NUMBER(10,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER(10,2), 
	"CREATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TB_USER
--------------------------------------------------------

  CREATE TABLE "MANAGER"."TB_USER" 
   (	"ID" NUMBER(10,0), 
	"NAME" VARCHAR2(255 CHAR), 
	"PHONE" VARCHAR2(255 CHAR), 
	"ADDRESS" VARCHAR2(255 CHAR), 
	"ENROL_DATE" TIMESTAMP (6), 
	"DES" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into MANAGER.BASE_ADMIN_PERMISSION
SET DEFINE OFF;
Insert into MANAGER.BASE_ADMIN_PERMISSION (ID,NAME,PID,DESCPT,URL,CREATE_TIME,UPDATE_TIME,DEL_FLAG) values (1,'systemManage',0,'系统管理','http://www.baidu.com','2018-11-30 10:27:34','2021-10-29 11:30:47',1);
Insert into MANAGER.BASE_ADMIN_PERMISSION (ID,NAME,PID,DESCPT,URL,CREATE_TIME,UPDATE_TIME,DEL_FLAG) values (2,'accountManage',1,'账号管理','/user/userManage','2018-11-30 11:44:41','2018-11-30 11:56:34',1);
Insert into MANAGER.BASE_ADMIN_PERMISSION (ID,NAME,PID,DESCPT,URL,CREATE_TIME,UPDATE_TIME,DEL_FLAG) values (3,'roleManage',1,'角色管理','/role/roleManage','2018-11-30 11:45:27','2018-11-30 11:45:27',1);
Insert into MANAGER.BASE_ADMIN_PERMISSION (ID,NAME,PID,DESCPT,URL,CREATE_TIME,UPDATE_TIME,DEL_FLAG) values (7,'permissionManage',1,'权限管理','/permission/permissionManage','2018-11-30 11:48:35','2018-11-30 15:13:38',1);
Insert into MANAGER.BASE_ADMIN_PERMISSION (ID,NAME,PID,DESCPT,URL,CREATE_TIME,UPDATE_TIME,DEL_FLAG) values (9,'baseManage',0,'基本设置',' ','2018-11-30 12:10:32','2018-11-30 12:10:32',1);
Insert into MANAGER.BASE_ADMIN_PERMISSION (ID,NAME,PID,DESCPT,URL,CREATE_TIME,UPDATE_TIME,DEL_FLAG) values (10,'productManage',9,'服务类目管理','/product/productManage','2018-12-04 11:47:07','2021-10-29 15:24:53',1);
REM INSERTING into MANAGER.BASE_ADMIN_ROLE
SET DEFINE OFF;
Insert into MANAGER.BASE_ADMIN_ROLE (ID,ROLE_NAME,ROLE_DESC,PERMISSIONS,CREATE_TIME,UPDATE_TIME,ROLE_STATUS) values (1,'system manager','系统管理员','1,9','2018-11-21 15:54:07','2018-11-21 15:54:07',1);
Insert into MANAGER.BASE_ADMIN_ROLE (ID,ROLE_NAME,ROLE_DESC,PERMISSIONS,CREATE_TIME,UPDATE_TIME,ROLE_STATUS) values (2,'base manager','普通管理员','9','2018-11-21 15:11:44','2018-12-03 19:09:57',1);
REM INSERTING into MANAGER.BASE_ADMIN_USER
SET DEFINE OFF;
Insert into MANAGER.BASE_ADMIN_USER (ID,SYS_USER_NAME,SYS_USER_PWD,ROLE_ID,USER_PHONE,REG_TIME,USER_STATUS) values (15,'leo','be156dc6f3339e6110a8d9e54c6201b0',2,'13631788525','2021-10-29 13:07:54',1);
Insert into MANAGER.BASE_ADMIN_USER (ID,SYS_USER_NAME,SYS_USER_PWD,ROLE_ID,USER_PHONE,REG_TIME,USER_STATUS) values (1,'admin','3ef7164d1f6167cb9f2658c07d3c2f0a',1,'13411182215','2018-11-22 10:57:33',1);
Insert into MANAGER.BASE_ADMIN_USER (ID,SYS_USER_NAME,SYS_USER_PWD,ROLE_ID,USER_PHONE,REG_TIME,USER_STATUS) values (2,'jackson','6f055494278cc66b5f46a684fc1276c7',2,'19563648695','2018-11-22 10:57:33',1);
Insert into MANAGER.BASE_ADMIN_USER (ID,SYS_USER_NAME,SYS_USER_PWD,ROLE_ID,USER_PHONE,REG_TIME,USER_STATUS) values (4,'alice','5e1030d25f5ca46aac4c0369b908d762',2,'11111111111','2018-11-22 11:01:58',1);
REM INSERTING into MANAGER.PRODUCT
SET DEFINE OFF;
Insert into MANAGER.PRODUCT (ID,NAME,PRICE,CREATE_DATE) values (1,'cake',6,to_date('29-10月-21','DD-MON-RR'));
Insert into MANAGER.PRODUCT (ID,NAME,PRICE,CREATE_DATE) values (2,'chessse',10,to_date('03-11月-21','DD-MON-RR'));
REM INSERTING into MANAGER.TB_USER
SET DEFINE OFF;
Insert into MANAGER.TB_USER (ID,NAME,PHONE,ADDRESS,ENROL_DATE,DES) values (30,'小李','111133','北京',to_timestamp('25-12月-18 12.00.00.000000000 上午','DD-MON-RR HH.MI.SSXFF AM'),'老大');
Insert into MANAGER.TB_USER (ID,NAME,PHONE,ADDRESS,ENROL_DATE,DES) values (31,'小吴','546546','天津',to_timestamp('03-2月 -18 12.00.00.000000000 上午','DD-MON-RR HH.MI.SSXFF AM'),'老二');
--------------------------------------------------------
--  DDL for Index BASE_ADMIN_PERMISSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MANAGER"."BASE_ADMIN_PERMISSION_PK" ON "MANAGER"."BASE_ADMIN_PERMISSION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BASE_ADMIN_ROLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MANAGER"."BASE_ADMIN_ROLE_PK" ON "MANAGER"."BASE_ADMIN_ROLE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BASE_ADMIN_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MANAGER"."BASE_ADMIN_USER_PK" ON "MANAGER"."BASE_ADMIN_USER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MANAGER"."PRODUCT_PK" ON "MANAGER"."PRODUCT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TB_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MANAGER"."TB_USER_PK" ON "MANAGER"."TB_USER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger BASE_ADMIN_PERMISSION_ID_TRIG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MANAGER"."BASE_ADMIN_PERMISSION_ID_TRIG" BEFORE INSERT OR UPDATE ON base_admin_permission
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  base_admin_permission_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM base_admin_permission;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT base_admin_permission_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/
ALTER TRIGGER "MANAGER"."BASE_ADMIN_PERMISSION_ID_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BASE_ADMIN_ROLE_ID_TRIG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MANAGER"."BASE_ADMIN_ROLE_ID_TRIG" BEFORE INSERT OR UPDATE ON base_admin_role
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  base_admin_role_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM base_admin_role;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT base_admin_role_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/
ALTER TRIGGER "MANAGER"."BASE_ADMIN_ROLE_ID_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BASE_ADMIN_USER_ID_TRIG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MANAGER"."BASE_ADMIN_USER_ID_TRIG" BEFORE INSERT OR UPDATE ON base_admin_user
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  base_admin_user_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM base_admin_user;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT base_admin_user_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/
ALTER TRIGGER "MANAGER"."BASE_ADMIN_USER_ID_TRIG" ENABLE;
--------------------------------------------------------
--  Constraints for Table BASE_ADMIN_PERMISSION
--------------------------------------------------------

  ALTER TABLE "MANAGER"."BASE_ADMIN_PERMISSION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_PERMISSION" ADD CONSTRAINT "BASE_ADMIN_PERMISSION_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BASE_ADMIN_ROLE
--------------------------------------------------------

  ALTER TABLE "MANAGER"."BASE_ADMIN_ROLE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_ROLE" MODIFY ("ROLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_ROLE" MODIFY ("ROLE_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_ROLE" ADD CONSTRAINT "BASE_ADMIN_ROLE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BASE_ADMIN_USER
--------------------------------------------------------

  ALTER TABLE "MANAGER"."BASE_ADMIN_USER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_USER" MODIFY ("SYS_USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_USER" MODIFY ("USER_PHONE" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_USER" MODIFY ("REG_TIME" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_USER" MODIFY ("USER_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."BASE_ADMIN_USER" ADD CONSTRAINT "BASE_ADMIN_USER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "MANAGER"."PRODUCT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."PRODUCT" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."PRODUCT" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."PRODUCT" ADD CONSTRAINT "PRODUCT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TB_USER
--------------------------------------------------------

  ALTER TABLE "MANAGER"."TB_USER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MANAGER"."TB_USER" ADD CONSTRAINT "TB_USER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
