import 'dart:math';
import 'package:mobx/mobx.dart';
part 'evento_model.g.dart';

class EventoModel = ModelEventoBase with _$EventoModel;

abstract class ModelEventoBase with Store {
  @observable
  String? id = '';
  @observable
  String? nomeEvento = '';
  @observable
  String? descricaoEvento = '';
  @observable
  String? localEvento = '';
  @observable
  DateTime? dataEvento = DateTime.now();
  
  @observable
  bool checked = false;

  ModelEventoBase(
      {this.dataEvento,
      this.descricaoEvento,
      this.localEvento,
      this.nomeEvento}) {
    setData(dataEvento);
  }

  @action
  setId(String ? id) {
    if (id == null){
      int randomNumber = Random().nextInt(1000000);
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      id = '$randomNumber$timestamp';
    }

    this.id = id;
  }

  @action
  setNome(String nomeEvento) {
    this.nomeEvento = nomeEvento;
  }

  @action
  setDescricao(String descricaoEvento) {
    this.descricaoEvento = descricaoEvento;
  }

  @action
  setLocal(String localEvento) {
    this.localEvento = localEvento;
  }

  @action
  setChekked(){
    checked = !checked;
  }

  @action
  setData(DateTime? dataEvento) {
    if (dataEvento != null) {
      this.dataEvento = dataEvento;
    } else {
      this.dataEvento = DateTime.now();
    }
  }

  @action
  reset(){
    setId('');
    setNome('');
    setDescricao('');
    setLocal('');
    setData(DateTime.now());
  }

  String ? formatarData() {
    int dia = dataEvento!.day;
    int mes = dataEvento!.month;
    int ano = dataEvento!.year;

    return '${_doisDigitos(dia)}/${_doisDigitos(mes)}/$ano';
  }

  String _doisDigitos(int numero) {
    return numero < 10 ? '0$numero' : '$numero';
  }
}
