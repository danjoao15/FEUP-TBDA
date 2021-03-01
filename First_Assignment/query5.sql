--CREATE INDEX tipo_ano ON x_xtiposaula (tipo, ano_letivo);
--DROP INDEX tipo_ano;

--CREATE BITMAP INDEX bitmap_tipo_ano ON x_xtiposaula (tipo, ano_letivo);
--DROP INDEX bitmap_tipo_ano;

SELECT codigo, ano_letivo, periodo, turnos * horas_turno AS num_horas
FROM x_xtiposaula
WHERE tipo = 'OT' AND (ano_letivo = '2002/2003' OR ano_letivo = '2003/2004');
