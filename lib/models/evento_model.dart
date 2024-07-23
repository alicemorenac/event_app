import 'package:event_app/api/Api.dart';
import 'package:flutter/material.dart';
class EventoModel extends ChangeNotifier {
  String? id;
  String? nomeEvento;
  String? descricaoEvento;
  String? latitude;
  String? longitude;
  String? foto;
  DateTime? dataEvento;

  EventoModel({
    this.id,
    this.dataEvento,
    this.descricaoEvento,
    this.nomeEvento,
    this.latitude,
    this.longitude,
    this.foto,
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


  void setLatitude(String ? latitude) {
    this.latitude = latitude;
    notifyListeners();
  }

  void setLongitude(String ? longitude) {
    this.longitude = longitude;
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
    dataEvento = DateTime.now();
    latitude = '';
    longitude = '';
    foto = '';
  }

  factory EventoModel.fromJson(Map<String, dynamic> json) {
    return EventoModel(
      id: json['id'].toString(),
      nomeEvento: json['nome'],
      descricaoEvento: json['descricao'],
      dataEvento: DateTime.parse(json['data']),
      latitude: json['latitude'],
      longitude: json['longitude'],
      foto: ApiClient().baseURI + '/static/uploaders/' + json['foto']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nomeEvento,
      'descricao': descricaoEvento,
      'data': dataEvento!.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'foto': ApiClient().baseURI + '/api/public/uploaders/' + foto
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
