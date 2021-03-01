------ Inserts

insert into Regions (COD, DESIGNATION, NUT1)
select r.COD, r.DESIGNATION, r.NUT1
from gtd8.Regions r;

insert into Districts (COD, DESIGNATION, REGION)
select d.COD, d.DESIGNATION, (select ref(r) from Regions r where r.COD = d.REGION)
from gtd8.Districts d;

insert into Municipalities (COD, DESIGNATION, DISTRICT, REGION)
select m.COD, m.DESIGNATION, (select ref(d) from Districts d where d.COD = m.DISTRICT), (select ref(r) from Regions r where r.COD = m.REGION)
from gtd8.Municipalities m;

insert into RoomTypes (ROOMTYPE, DESCRIPTION)
select rt.ROOMTYPE, rt.DESCRIPTION
from gtd8.RoomTypes rt;

insert into Facilities (ID, NAME, CAPACITY, ROOMTYPE, ADDRESS, MUNICIPALITY)
select f.ID, f.NAME, f.CAPACITY, (select ref(rt) from RoomTypes rt where rt.ROOMTYPE = f.ROOMTYPE), f.ADDRESS, (select ref(m) from Municipalities m where m.COD = f.MUNICIPALITY)
from gtd8.Facilities f;
