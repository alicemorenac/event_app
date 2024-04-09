import 'package:event_app/models/evento_model.dart';
import 'package:mobx/mobx.dart';
part 'controller_eventos.g.dart';

class ControllerEventos = ControllerEventosBase with _$ControllerEventos;

abstract class ControllerEventosBase with Store {
  @observable
  ObservableList<EventoModel> eventos = [
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'Mossoró, RN',
      descricaoEvento: 'Feira de tecnologia e inovação',
      nomeEvento: 'TechExpo',
    ),
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'Parnamirim, RN',
      descricaoEvento: 'Aula aberta sobre inteligência artificial',
      nomeEvento: 'AI Workshop',
    ),
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'Ceará-Mirim, RN',
      descricaoEvento: 'Concurso de culinária regional',
      nomeEvento: 'Festival Gastronômico',
    ),
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'São Gonçalo do Amarante, RN',
      descricaoEvento: 'Exposição de arte contemporânea',
      nomeEvento: 'Arte Viva',
    ),
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'Touros, RN',
      descricaoEvento: 'Palestra sobre preservação ambiental',
      nomeEvento: 'EcoTalk',
    ),
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'Canguaretama, RN',
      descricaoEvento: 'Workshop de empreendedorismo',
      nomeEvento: 'Empreenda Já',
    ),
    EventoModel(
      dataEvento: DateTime.now(),
      localEvento: 'Apodi, RN',
      descricaoEvento: 'Exibição de filmes independentes',
      nomeEvento: 'Cine Indie',
    ),
    EventoModel(
        dataEvento: DateTime.now(),
        localEvento: 'Parazinho, RN',
        descricaoEvento: 'Encontro de programadores',
        nomeEvento: 'Meetup Dev'),
    EventoModel(
        dataEvento: DateTime.now(),
        localEvento: 'Natal, RN',
        descricaoEvento: 'Encontro de mecanicos',
        nomeEvento: 'Parada auto'),
    EventoModel(
        dataEvento: DateTime.now(),
        localEvento: 'João Câmara, RN',
        descricaoEvento: 'Reunião de associados e cooperativas',
        nomeEvento: 'Sou +'),
  ].asObservable();

  @action
  add(EventoModel e) {
    if (!_existe(e)) {
      eventos.add(e);
    }
  }

  bool _existe(EventoModel e) {
    return eventos.any((ev) => ev.id == e.id);
  }
}
