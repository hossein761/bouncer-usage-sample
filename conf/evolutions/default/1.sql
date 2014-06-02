# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table registration (
  id                        varchar(255) not null,
  base_user_id              varchar(255),
  constraint pk_registration primary key (id))
;

create table user (
  id                        varchar(255) not null,
  name                      varchar(255),
  last_name                 varchar(255),
  full_name                 varchar(255),
  email                     varchar(255),
  user_name                 varchar(255),
  password_hash             varchar(255),
  salt                      varchar(255),
  iterations                integer,
  last_login_time           timestamp,
  status                    integer,
  address                   varchar(255),
  created_time              timestamp not null,
  updated_time              timestamp not null,
  constraint ck_user_status check (status in (0,1,2)),
  constraint uq_user_email unique (email),
  constraint uq_user_user_name unique (user_name),
  constraint pk_user primary key (id))
;

create table base_user (
  id                        varchar(255) not null,
  name                      varchar(255),
  last_name                 varchar(255),
  full_name                 varchar(255),
  email                     varchar(255),
  user_name                 varchar(255),
  password_hash             varchar(255),
  salt                      varchar(255),
  iterations                integer,
  last_login_time           timestamp,
  status                    integer,
  created_time              timestamp not null,
  updated_time              timestamp not null,
  constraint ck_base_user_status check (status in (0,1,2)),
  constraint uq_base_user_email unique (email),
  constraint uq_base_user_user_name unique (user_name),
  constraint pk_base_user primary key (id))
;

create sequence registration_seq;

create sequence user_seq;

create sequence base_user_seq;

alter table registration add constraint fk_registration_baseUser_1 foreign key (base_user_id) references base_user (id) on delete restrict on update restrict;
create index ix_registration_baseUser_1 on registration (base_user_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists registration;

drop table if exists user;

drop table if exists base_user;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists registration_seq;

drop sequence if exists user_seq;

drop sequence if exists base_user_seq;

