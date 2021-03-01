---- Types Creation

create or replace type Region_t as object
(
    COD	NUMBER(4),
    DESIGNATION	VARCHAR2(50),
    NUT1 VARCHAR2(50)
);

create or replace type District_t as object
(
    COD	NUMBER(4),
    DESIGNATION	VARCHAR2(50),
    REGION ref Region_t
);

create or replace type Municipality_t as object
(
    COD	NUMBER(4),
    DESIGNATION	VARCHAR2(50),
    DISTRICT ref District_t,
    REGION ref Region_t
);

create or replace type RoomType_t as object
(
    ROOMTYPE NUMBER(4),
    DESCRIPTION VARCHAR2(50)
);

create or replace type Facility_t as object
(
    ID number(4),
    NAME varchar2(80),
    CAPACITY number(8),
    ROOMTYPE ref RoomType_t,
    ADDRESS varchar2(80),
    MUNICIPALITY ref Municipality_t
);

create or replace type Facilities_tab_t as table of ref Facility_t;

create or replace type Activity_t as object
(
    REF varchar2(20),
    ACTIVITY varchar2(20)
);

create or replace type Activities_tab_t as table of Activity_t;

alter type Municipality_t
add attribute (FACILITIES Facilities_tab_t) CASCADE;

alter type Facility_t
add attribute (ACTIVITIES Activities_tab_t) CASCADE;


------ Table Creation

create table Regions of Region_t

create table Districts of District_t

create table Municipalities of Municipality_t
    nested table Facilities store as Municipality_Facilities;

create table RoomTypes of RoomType_t;

create table Facilities of Facility_t
    nested table Activities store as Facility_Activities;
