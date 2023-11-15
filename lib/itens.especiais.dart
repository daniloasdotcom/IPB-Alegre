class RecadoEspecialModel {
  String descricao;
  String titulo;
  String subtitulo;
  String recado;

  RecadoEspecialModel(
      {required this.recado, required this.titulo, required this.subtitulo, required this.descricao});

  factory RecadoEspecialModel.fromJson(dynamic json) {
    return RecadoEspecialModel(
      recado: "${json['recado']}",
      titulo: "${json['titulo']}",
      subtitulo: "${json['subtitulo']}",
      descricao: "${json['descricao']}",
    );
  }

  Map toJson() => {
        "descricao": descricao,
        "subtitulo": subtitulo,
        "titulo": titulo,
        "recado": recado
      };
}