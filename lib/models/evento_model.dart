import 'package:flutter/material.dart';
class EventoModel extends ChangeNotifier {
  String? id;
  String? nomeEvento;
  String? descricaoEvento;
  String? localEvento;
  DateTime? dataEvento;

  EventoModel({
    this.id,
    this.dataEvento,
    this.descricaoEvento,
    this.localEvento,
    this.nomeEvento,
  }){
    dataEvento = DateTime.now();
  }

  void setId(String ? id){
    this.id = id;
    notifyListeners();
  }

  void setNome(String ? nomeEvento) {
    this.nomeEvento = nomeEvento;
    notifyListeners();
  }

  void setDescricao(String ? descricaoEvento) {
    this.descricaoEvento = descricaoEvento;
    notifyListeners();
  }

  void setLocal(String ? localEvento) {
    this.localEvento = localEvento;
    notifyListeners();
  }

  void setData(DateTime? dataEvento) {
    if (dataEvento != null) {
      this.dataEvento = dataEvento;
    } else {
      this.dataEvento = DateTime.now();
    }
    notifyListeners();
  }

  void reset() {
    id = '';
    nomeEvento = '';
    descricaoEvento = '';
    localEvento = '';
    dataEvento = DateTime.now();
  }

  factory EventoModel.fromJson(Map<String, dynamic> json) {
    return EventoModel(
      id: json['id'].toString(),
      nomeEvento: json['nome'],
      descricaoEvento: json['descricao'],
      localEvento: json['local'],
      dataEvento: DateTime.parse(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nomeEvento,
      'descricao': descricaoEvento,
      'local': localEvento,
      'data': dataEvento!.toIso8601String(),
    };
  }

  String? formatarData() {
    if (dataEvento == null) return null;
    int dia = dataEvento!.day;
    int mes = dataEvento!.month;
    int ano = dataEvento!.year;

    return '${_doisDigitos(dia)}/${_doisDigitos(mes)}/$ano';
  }

  String _doisDigitos(int numero) {
    return numero < 10 ? '0$numero' : '$numero';
  }
}
