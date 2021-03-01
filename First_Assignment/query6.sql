SELECT curso FROM
(SELECT curso,tipo FROM x_xtiposaula JOIN x_xucs ON x_xucs.codigo = x_xtiposaula.codigo
GROUP BY curso, tipo)
GROUP BY curso
HAVING COUNT (tipo) = (SELECT COUNT(DISTINCT tipo) FROM x_xtiposaula);
