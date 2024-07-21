import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:event_app/api/Api.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'controller_eventos.g.dart';


class ControllerEventos = ControllerEventosBase with _$ControllerEventos;

abstract class ControllerEventosBase with Store {
  @observable
  ObservableList<EventoModel> _eventos = ObservableList.of([]);
  ObservableList<EventoModel> _favoritos = ObservableList.of([]);
  ObservableList<EventoModel> _meus_eventos = ObservableList.of([]);


  ObservableList<EventoModel> get eventos => _eventos;
  ObservableList<EventoModel> get favoritos => _favoritos;
  ObservableList<EventoModel> get meus_eventos => _meus_eventos;


  @action
  Future<void> trazer_eventos() async {
    final _preff =  await SharedPreferences.getInstance();
    String ? id = _preff.getString('id');

    final response = await ApiClient().GET("/eventos");

    if (response.statusCode != 200) throw Error();

    List<dynamic> jsonList = jsonDecode(response.body);

    _meus_eventos = ObservableList.of(
        jsonList
          .where((json) => json['id_usuario'].toString() == id)
          .map((e) => EventoModel.fromJson(e)).toList(),
      );

    _eventos = ObservableList.of(
      jsonList.map((json) => EventoModel.fromJson(json)).toList(),
    );
  }

  @action
  Future<void> trazer_favoritos() async {
    _favoritos = ObservableList.of([]);
    final _preff =  await SharedPreferences.getInstance();
    String ? id = _preff.getString('id');

    final response = await ApiClient().GET('/usuarios/$id/eventos_favoritos');
    if (response.statusCode != 200) {
      return;
    }

    List<dynamic> jsonList = jsonDecode(response.body);

    for (int i = 0; i < jsonList.length; i++){
      final id_evento = jsonList[i]['id_evento'];
      if(jsonList[i]['id_usuario'].toString() == id){
        final evResponse = await ApiClient().GET('/eventos/$id_evento');

        if(evResponse.statusCode == 200){
          _favoritos.add(EventoModel.fromJson(jsonDecode(evResponse.body)));
        }
      }
    }
  }


  @action
  Future<void> tooggle_favorito(EventoModel e) async {
    final _preff =  await SharedPreferences.getInstance();
    String ? id = _preff.getString('id');

    if (!isFavorite(e)){
      await ApiClient().POST('/usuarios/$id/favoritar', {'id_evento': e.id});
       _favoritos.add(e);
    } else {
       final response = await ApiClient().DELETE('/usuarios/$id/eventos_favoritos/${e.id}');  
      _favoritos.removeWhere((fav) => fav.id == e.id);
    }
  }

  @action
  Future<void> add_evento(EventoModel e, File ? imageFile) async {

    final _preff =  await SharedPreferences.getInstance();
    String ? id = _preff.getString('id');
    var response;

    response = await ApiClient().POST_MULTPART('/eventos/',{
        "id_usuario": id,
        "nome": e.nomeEvento,
        "descricao": e.descricaoEvento,
        "data": e.dataEvento!.toIso8601String(),
        "latitude": e.latitude,
        "longitude": e.longitude
    }, imageFile);


    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      e.setId(data['id'].toString());
      _add(e);
    }
  }

  @action
  Future<void> update_evento(EventoModel e, File ? imageFile) async {

    final _preff =  await SharedPreferences.getInstance();
    String ? id = _preff.getString('id');

    await ApiClient().PUT('/eventos/${e.id}', {
        "id_usuario": id,
        "nome": e.nomeEvento,
        "descricao": e.descricaoEvento,
        "data": e.dataEvento!.toIso8601String(),
        "latitude": e.latitude,
        "longitude": e.longitude
    });
  }
  @action
  Future<void> upsert(EventoModel e, File ? imageFile) async {
    if(e.id != null){
      await update_evento(e, imageFile);
    } else {
      await add_evento(e, imageFile);
    }

    await trazer_eventos();
    await trazer_favoritos();
  }



  Future<void> deletar_evento(EventoModel e) async {

    final _preff =  await SharedPreferences.getInstance();
    String ? id = _preff.getString('id');

    await ApiClient().DELETE('/eventos/${e.id}');
    
    _remove(e);
    
    await trazer_eventos();
    await trazer_favoritos();

  }
  
  @action
  _add(EventoModel e) {
    _eventos.add(e);
    _meus_eventos.add(e);
  }
  
  @action
  _remove(EventoModel e) {
    if (!_existe(e)) {
      _eventos.remove(e);
      _meus_eventos.remove(e);
    }
  }
  
  bool isFavorite(EventoModel e){
    return _favoritos.any((element) => e.id == element.id);
  }

  bool _existe(EventoModel e) {
    return eventos.any((ev) => ev.id == e.id);
  }
}
