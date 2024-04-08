import 'package:event_app/models/evento_model.dart';
import 'package:mobx/mobx.dart';
part 'controller_eventos.g.dart';

class ControllerEventos = ControllerEventosBase with _$ControllerEventos;

abstract class ControllerEventosBase with Store {
  @observable
  ObservableList<EventoModel> eventos = [
    EventoModel(dataEvento: DateTime.now(), localEvento: 'Parazinho, RN', descricaoEvento: 'Encontro de programadores', nomeEvento: 'Meetup Dev'),
    EventoModel(dataEvento: DateTime.now(), localEvento: 'Natal, RN', descricaoEvento: 'Encontro de mecanicos', nomeEvento: 'Parada auto'),
    EventoModel(dataEvento: DateTime.now(), localEvento: 'João Câmara, RN', descricaoEvento: 'Reunião de associados e cooperativas', nomeEvento: 'Sou +'),
  ].asObservable();

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
