LOAD CSV WITH HEADERS FROM 'file:///anos.csv' AS line
CREATE (:Anos { ano: toInteger(line.ANO)});

LOAD CSV WITH HEADERS FROM 'file:///lics.csv' AS line
CREATE (:Lics { codigo: toInteger(line.CODIGO), sigla: line.SIGLA, nome: line.NOME});

//Alunos Table
:auto USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'file:///alus.csv' AS line
CREATE (a:Alunos {	  numero: toInteger(line.NUMERO), 
					  bi: toInteger(line.BI), 
					  codigo: toInteger(line.CURSO), 
					  ano: toInteger(line.A_LECT_MATRICULA), 
					  estado: line.ESTADO,
				      media: toInteger(line.MED_FINAL)})

//Alter Alunos
LOAD CSV WITH HEADERS FROM 'file:///alus.csv' AS line
MATCH   (a:Alunos { numero: toInteger(line.NUMERO)}),
		(codigo:Lics{ codigo: toInteger(line.CURSO) }),
		(ano:Anos{ ano: toInteger(line.A_LECT_MATRICULA) })
CREATE (a) –[:FREQUENTS]->(codigo)
CREATE (a) –[:MATRICULATED]->(ano)
return (codigo)<-[:FREQUENTS]-(a)-[:MATRICULATED]->(ano);

//Cands Table
:auto USING PERIODIC COMMIT
LOAD CSV WITH HEADERS 
FROM 'file:///cands.csv' AS line
CREATE (a:Alunos {	  bi: toInteger(line.BI), 
					  codigo: toInteger(line.CURSO), 
					  a: toInteger(line.ANO_LECTIVO), 
					  resultado: line.RESULTADO,
				      media: toInteger(line.MEDIA)})

//Alter Cands
LOAD CSV WITH HEADERS FROM 'file:///cands.csv' AS line
MATCH (l:Lics { codigo: toInteger(line.CURSO) })
MATCH (a:Anos { ano: toInteger(line.ANO_LECTIVO) })
CREATE (c:Cands { bi: toInteger(line.BI), resultado: line.RESULTADO, media: toInteger(line.MEDIA)})
CREATE (c) –[:APPLIED]->(l)
CREATE (c) –[:ONYEAR]->(a);


Queries example: 
MATCH(n) return n /* return all nodes and relationships, memory-intensive */
MATCH (n) DETACH DELETE n; /*  delete all relationships and nodes from database */

