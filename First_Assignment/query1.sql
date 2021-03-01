/*Selection and join.
Show the codigo, designacao, ano_letivo, inscritos, tipo, and turnos for the course
‘Bases de Dados’ of the program 275.*/

select  xocorrencias.codigo, xucs.designacao, xtiposaula.ano_letivo, xocorrencias.inscritos, xtiposaula.tipo, xtiposaula.turnos from xucs
inner join xocorrencias on xocorrencias.codigo = xucs.codigo
left outer join xtiposaula on xtiposaula.codigo=xocorrencias.codigo and xtiposaula.ano_letivo_xocorrencias.ano_letivo
where xucs.designacao='Bases de Dados'AND xucs.curso='275';

select x_xocorrencias.codigo, x_xucs.designacao, x_xtiposaula.ano_letivo, x_xocorrencias.inscritos, x_xtiposaula.tipo, x_xtiposaula.turnos from x_xucs
inner join x_xocorrencias on x_xocorrencias.codigo = x_xucs.codigo
left outer join x_xtiposaula on x_xtiposaula.codigo=x_xocorrencias.codigo and x_xtiposaula.ano_letivo=x_xocorrencias.ano_letivo
where x_xucs.designacao='Bases de Dados'AND x_xucs.curso='275';

select  y_xocorrencias.codigo, y_xucs.designacao, y_xtiposaula.ano_letivo, y_xocorrencias.inscritos, y_xtiposaula.tipo, y_xtiposaula.turnos from y_xucs
inner join y_xocorrencias on y_xocorrencias.codigo = y_xucs.codigo
left outer join y_xtiposaula on y_xtiposaula.codigo=y_xocorrencias.codigo and y_xtiposaula.ano_letivo=y_xocorrencias.ano_letivo
where Y_xucs.designacao='Bases de Dados'AND y_xucs.curso='275';

select  z_xocorrencias.codigo, z_xucs.designacao, z_xtiposaula.ano_letivo, z_xocorrencias.inscritos, z_xtiposaula.tipo, z_xtiposaula.turnos from z_xucs
inner join z_xocorrencias on z_xocorrencias.codigo = z_xucs.codigo
left outer join z_xtiposaula on z_xtiposaula.codigo=z_xocorrencias.codigo and z_xtiposaula.ano_letivo=z_xocorrencias.ano_letivo
where z_xucs.designacao='Bases de Dados'AND z_xucs.curso='275';
