SELECT tipo,max_hours,y_xdocentes.nr,y_xdocentes.nome
FROM
    (
        SELECT MAX(nr) as nr, tipo, MAX(sum_hours) as max_hours
        FROM
            (
                SELECT nr, tipo, SUM(horas * fator) as sum_hours
                FROM Y_XTIPOSAULA
                JOIN y_xdsd ON y_xdsd.id = y_xtiposaula.id
                WHERE ano_letivo = '2003/2004'
                GROUP BY tipo, nr
            ) 
        GROUP BY tipo
    ) HOURS_VIEW
LEFT JOIN y_xdocentes on y_xdocentes.nr = HOURS_VIEW.nr