import 'package:event_app/models/evento.dart';
import 'package:event_app/models/usuario.dart';
import 'package:mobx/mobx.dart';
part 'controller_eventos.g.dart';

class ControllerEventos = ControllerEventosBase with _$ControllerEventos;

abstract class ControllerEventosBase with Store {
  @observable
  List<Evento> eventos = [];

  ControllerEventosBase() {
    add(Evento(nomeEvento: 'Escolar', descricaoEvento: 'Aula de Git', localEvento: 'Natal - RN', dataEvento: DateTime.now()));
    add(Evento(nomeEvento: 'Festival', descricaoEvento: 'Festival Mada', localEvento: 'Natal - RN', dataEvento: DateTime.now()));
    add(Evento(nomeEvento: 'Reggae', descricaoEvento: 'Show do bob Marley', localEvento: 'Natal - RN', dataEvento: DateTime.now()));
    add(Evento(nomeEvento: 'Piseiro', descricaoEvento: 'Festa do piseiro', localEvento: 'Natal - RN', dataEvento: DateTime.now()));
  }

  @action
  add(Evento u) {
    eventos.add(u);
  }

}
