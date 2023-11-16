class NotificacaoModel {
  String notificacao;
  int hora;
  String recado;

  NotificacaoModel(
      {required this.recado, required this.hora, required this.notificacao});

  factory NotificacaoModel.fromJson(dynamic json) {
    return NotificacaoModel(
      recado: "${json['recado']}",
      hora: json['hora'] as int,
      notificacao: "${json['notificacao']}",
    );
  }

  Map toJson() => {
        "notificacao": notificacao,
        "hora": hora,
        "recado": recado
      };
}