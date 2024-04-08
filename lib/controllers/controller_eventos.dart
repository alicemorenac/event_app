import 'package:event_app/models/evento_model.dart';
import 'package:mobx/mobx.dart';
part 'controller_eventos.g.dart';

class ControllerEventos = ControllerEventosBase with _$ControllerEventos;

abstract class ControllerEventosBase with Store {
  @observable
  ObservableList<EventoModel> eventos = ObservableList();

  @action
  add(EventoModel e) {
    if(!_existe(e)){
      eventos.add(e);
    }
  }

  bool _existe(EventoModel e) {
    return eventos.any((ev) => ev.id == e.id);
  }
}
