var Lics = new mongoose.Schema({
    codigo: {type: Number, required: true, unique: true},
    sigla: {type: String, required: true, maxlength: 5},
    nome: {type: String, required: true, maxlength: 80}
});


var Cands= new mongoose.Schema({
    bi: {type: String, required: true, maxlength: 12},
    curso: {type: Number, required: true}, //reference lics
    ano_lectivo: {type: Number, required: true},
    resultado: {type: String, required: true, maxlength: 1}, // C – accepted; E – excluded; S – waiting list
    media: {type: Number, required: true}
});


var Alus = new mongoose.Schema({
	numero: {type: String, required: true, maxlength: 9, unique: true},
    bi: {type: String, required: true, maxlength: 12},
    curso: {type: Number}, //references lics
    a_lect_matricula: {type: Number, required: true},
    estado: {type: String, maxlength: 2}, //F – following; C – concluded
    a_lect_conclusao: {type: Number},
    med_final: {type: Number}
});

var Anos = new mongoose.Schema({
	ano: {type: Number}
});
