

//Query1
db.lics.find({"cands.bi":"12147897"})


//Query2
db.alus.aggregate([
{ $match : { a_lect_matricula : {$gt: 1991}}},
{ $group : {_id : {curso: "$curso", ano: "$a_lect_matricula"}, num : {$sum : 1}}},
{ $sort: { "_id.ano": 1 } }
])

//Query 3
db.alus.aggregate( [
  { $project: {
      bi: 1,
      numero: 1,
      med_final: 1,
      "cand_media":"$cands.media",
      eq: { $cond: [ { $and : [
                          {$ne : [ "$cands.media" , null ]},
                          {$ne : [ "$med_final" , null ]},
                          {$gt : [ "$med_final", "$cands.media" ]}
                      ]}, 1, 0 ] }
  } },
  { $match: { eq: 1 } }
] )

//Query 4
db.alus.aggregate([
  { $match: { a_lect_conclusao: { $ne: 'null' } }},
  { $project: {
      "time": { $subtract: [ "$a_lect_conclusao", "$a_lect_matricula" ] },
      "med_final" : "$med_final"
  }},
  { $match: { "time": { $gt: 4 } }},
  { $group : {_id : {diff : "$time"}, avg : { $avg : "$med_final"} }},
  { $sort :{ "_id.diff": 1 } }
])

//Query 5
db.alus.aggregate([
{ $match : { a_lect_matricula : {$eq: 2000}}},
{ $match : { "lics.sigla": {$eq: 'EIC'}}},

])
