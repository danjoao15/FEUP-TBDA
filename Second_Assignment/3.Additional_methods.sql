------------Additional Methods

--- Nested Migration

update Facilities f
set f.Activities =
cast(multiset(select a.ref, a.activity from gtd8.Activities a join gtd8.Uses u on a.ref = u.ref where u.id = f.id) as Activities_tab_t);

update Municipalities m
set m.Facilities =
cast(multiset(select ref(f) from Facilities f where m.cod = f.municipality.cod) as Facilities_tab_t);

--- Functions

alter type Municipality_t
add member function Get_Capacity return integer cascade;

alter type Municipality_t
add member function Get_Facility_Num return integer cascade;


create or replace type body Municipality_t as

    member function Get_Capacity return integer is

    total integer;

    begin

    select sum(f.capacity) into total
    from facilities f
    where f.municipality.cod = self.cod;

    return total;

    end Get_Capacity;

    member function Get_Facility_Num return integer is

       facility_Num integer;

       begin

       select count(*) into facility_Num
       from municipalities m, table(m.facilities) f
       where m.cod = self.cod;

       return facility_Num;

       end Get_Facility_Num;
end;
