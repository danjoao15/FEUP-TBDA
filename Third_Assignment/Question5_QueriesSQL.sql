//SQL
create table x.alus as select * from GTD.alus;
create table x_anos as select * from GTD.anos;
create table x_cands as select * from GTD.cands;
create table x_lics as select * from GTD.lics;

//Query 1
select x_lics.nome from x_lics
inner join x_cands on x_cands.curso = x_lics.codigo
where x_cands.bi='12147897';

//Query 2
select x_alus.A_LECT_MATRICULA year, x_lics.nome, count(*) as numAlus
from x_alus, x_lics
where x_alus.curso = x_lics.codigo
and x_alus.A_LECT_MATRICULA > 1991
group by x_lics.nome, x_alus.a_lect_matricula
order by year;


//Query 3
select x_alus.bi, x_alus.numero
from x_alus,x_cands
where x_alus.bi =x_cands.bi
and x_alus.med_final > x_cands.media;

//Query 4
select (a_lect_conclusao - a_lect_matricula) as diff, avg(med_final)
from x_alus
where (a_lect_conclusao - a_lect_matricula) > 4
group by (a_lect_conclusao - a_lect_matricula)
order by (a_lect_conclusao - a_lect_matricula);

//Query 5
select count(*) as numAlus
from x_alus, x_lics
where x_alus.curso= x_lics.codigo
and x_lics.sigla ='EIC'
and x_alus.A_LECT_MATRICULA = 2000;
