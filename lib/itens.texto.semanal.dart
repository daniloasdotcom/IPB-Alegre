class TextoSemanalModel {
  String textosemanal;
  String titulo;
  String subtitulo;
  String paragrafo01;
  String paragrafo02;
  String paragrafo03;
  String paragrafo04;
  String paragrafo05;
  String paragrafo06;
  String paragrafo07;
  String paragrafo08;
  String paragrafo09;
  String paragrafo10;

  TextoSemanalModel(
      {required this.textosemanal,
      required this.titulo,
      required this.subtitulo,
      required this.paragrafo01,
      required this.paragrafo02,
      required this.paragrafo03,
      required this.paragrafo04,
      required this.paragrafo05,
      required this.paragrafo06,
      required this.paragrafo07,
      required this.paragrafo08,
      required this.paragrafo09,
      required this.paragrafo10});

  factory TextoSemanalModel.fromJson(dynamic json) {
    return TextoSemanalModel(
      textosemanal: "${json['textosemanal']}",
      titulo: "${json['titulo']}",
      subtitulo: "${json['subtitulo']}",
      paragrafo01: "${json['paragrafo01']}",
      paragrafo02: "${json['paragrafo02']}",
      paragrafo03: "${json['paragrafo03']}",
      paragrafo04: "${json['paragrafo04']}",
      paragrafo05: "${json['paragrafo05']}",
      paragrafo06: "${json['paragrafo06']}",
      paragrafo07: "${json['paragrafo07']}",
      paragrafo08: "${json['paragrafo08']}",
      paragrafo09: "${json['paragrafo09']}",
      paragrafo10: "${json['paragrafo10']}",
    );
  }

  Map toJson() => {
        "textosemanal": textosemanal,       
        "titulo": titulo,
        "subtitulo": subtitulo,
        "paragrafo01": paragrafo01,
        "paragrafo02": paragrafo02,
        "paragrafo03": paragrafo03,
        "paragrafo04": paragrafo04,
        "paragrafo05": paragrafo05,
        "paragrafo06": paragrafo06,
        "paragrafo07": paragrafo07,
        "paragrafo08": paragrafo08,
        "paragrafo09": paragrafo09,
        "paragrafo10": paragrafo10,        
      };
}
