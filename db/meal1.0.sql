/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/*==============================================================*/

/*==============================================================*/
/* Table: sys_dept                                              */
/*==============================================================*/
create table sys_dept
(
   id                   bigint not null auto_increment comment '����ID',
   name                 varchar(32) comment '������',
   role                 bigint comment '����Ȩ��',
   primary key (id)
);

alter table sys_dept comment 'ϵͳ���ű�';

/*==============================================================*/
/* Table: sys_role                                              */
/*==============================================================*/
create table sys_role
(
   id                   bigint not null auto_increment comment '��ɫID',
   name                 varchar(32) comment '��ɫ��',
   remark               text comment '��ע',
   primary key (id)
);

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   id                   bigint not null auto_increment comment '�û�ID',
   name                 varchar(32) comment '�˺�',
   password             varchar(64) comment '���루���ģ�',
   salt                 varchar(32) comment '������ֵ',
   status               smallint comment '�û�״̬',
   primary key (id)
);

alter table sys_user comment 'ϵͳ�û���';

/*==============================================================*/
/* Index: user_name_status                                      */
/*==============================================================*/
create unique index user_name_status on sys_user
(
   name,
   status
);

/*==============================================================*/
/* Table: sys_user_dept                                         */
/*==============================================================*/
create table sys_user_dept
(
   uid                  bigint not null comment '�û�ID',
   did                  bigint not null comment '����ID'
);

alter table sys_user_dept comment 'ϵͳ�û����ű�';

/*==============================================================*/
/* Index: user_dept                                             */
/*==============================================================*/
create unique index user_dept on sys_user_dept
(
   uid,
   did
);

/*==============================================================*/
/* Table: sys_user_role                                         */
/*==============================================================*/
create table sys_user_role
(
   uid                  bigint not null comment '�û�ID',
   rid                  bigint not null comment '��ɫID'
);

alter table sys_user_role comment 'ϵͳ�û���ɫ��';

/*==============================================================*/
/* Index: user_role                                             */
/*==============================================================*/
create unique index user_role on sys_user_role
(
   uid,
   rid
);

