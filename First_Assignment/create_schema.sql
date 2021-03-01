create table x_xdocentes as select * from GTD10.xdocentes;
create table x_xdsd as select * from GTD10.xdsd;
create table x_xtiposaula as select * from GTD10.xtiposaula;
create table x_xocorrencias as select * from GTD10.xocorrencias;
create table x_xucs as select * from GTD10.xucs;

create table y_xdocentes as select * from GTD10.xdocentes;
create table y_xdsd as select * from GTD10.xdsd;
create table y_xtiposaula as select * from GTD10.xtiposaula;
create table y_xocorrencias as select * from GTD10.xocorrencias;
create table y_xucs as select * from GTD10.xucs;

alter table y_xdocentes add constraint xdocentes_pk primary key (nr);
alter table y_xdsd add constraint xdsd_pk primary key (nr,id);
alter table y_xtiposaula add constraint xtiposaula_pk primary key (id);
alter table y_xocorrencias add constraint xocorrencias_pk primary key (codigo,ano_letivo,periodo);
alter table y_xucs add constraint xucs_pk primary key (codigo);

alter table Y_XDSD add constraint XDOCENTES_fk foreign key (nr) references Y_XDOCENTES(nr);
alter table Y_XDSD add constraint XTIPOSAULA_fk foreign key (id) references Y_XTIPOSAULA(id);
alter table Y_XTIPOSAULA add constraint XOCORRENCIAS_fk foreign key (CODIGO,ANO_LETIVO,PERIODO) references Y_XOCORRENCIAS(CODIGO,ANO_LETIVO,PERIODO);
alter table Y_XOCORRENCIAS add constraint XUCS_fk foreign key (CODIGO) references Y_XUCS(CODIGO);

create table z_xdocentes as select * from GTD10.xdocentes;
create table z_xdsd as select * from GTD10.xdsd;
create table z_xtiposaula as select * from GTD10.xtiposaula;
create table z_xocorrencias as select * from GTD10.xocorrencias;
create table z_xucs as select * from GTD10.xucs;


alter table z_xdocentes add constraint xdocentes_pk primary key (nr);
alter table z_xdsd add constraint xdsd_pk primary key (nr,id);
alter table z_xtiposaula add constraint xtiposaula_pk primary key (id);
alter table z_xocorrencias add constraint xocorrencias_pk primary key (codigo,ano_letivo,periodo);
alter table z_xucs add constraint xucs_pk primary key (codigo);

alter table z_XDSD add constraint XDOCENTES_fk foreign key (nr) references z_XDOCENTES(nr);
alter table z_XDSD add constraint XTIPOSAULA_fk foreign key (id) references z_XTIPOSAULA(id);
alter table z_XTIPOSAULA add constraint XOCORRENCIAS_fk foreign key (CODIGO,ANO_LETIVO,PERIODO) references z_XOCORRENCIAS(CODIGO,ANO_LETIVO,PERIODO);
alter table z_XOCORRENCIAS add constraint XUCS_fk foreign key (CODIGO) references z_XUCS(CODIGO);

--Question 1
create index index_xtiposaula_anoletivo_cod  on z_xtiposaula(ano_letivo, codigo);
create  unique index index_xucs_curso_designacao_codigo  on z_xucs(curso, designacao, codigo);

--Quetsio 2
create index index_xtiposaula_anoletivo  on z_xtiposaula(ano_letivo);
