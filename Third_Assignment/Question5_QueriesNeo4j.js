//Query1
Match (l)<-[APPLIED]-(c { bi:12147897})
Return l.nome;
//Query2

Match (a)-[MATRICULATED]->(yi)
where yi.ano>1991
Match (a)-[FREQUENTS]->(l)
Return l.nome, yi.ano, count(a) as total ORDER BY yi.ano;

//Query3

Match (a)-[:FREQUENTS]->(l) <-[:APPLIED]-(c)
Where (a.media > c.media)
Return a.bi, a.numero;

//Query4
Match (a:Alunos)-[MATRICULATED]-(yi:Anos)
Match (a:Alunos)-[FINISHED]-(yf:Anos)
Where (a.estado = 'C' and yi.ano - yf.ano >= 5)
RETURN (yi.ano - yf.ano) as diff, avg(a.media) as media
ORDER BY diff ASC

//Query5
// Find the average grade of the top 10% of students (who finished their course on time) by course
:params {years:5}
Match (a:Alunos)-[MATRICULATED]-(yi:Anos)
Match (a:Alunos)-[FINISHED]-(yf:Anos)
MATCH (a:Alunos)-[FREQUENTS]-(c:Lics)
Where (a.estado = 'C' and yi.ano - yf.ano <= $years)
RETURN c.sigla as sigla, percentileCont(a.media,0.9) as media


//outra 5
//Query 5
Match (l {sigla:'EIC'})<-[FREQUENTS]-(a)-[MATRICULATED]->(yi {ano:2000})
Return count(a);
