import 'package:event_app/models/comentarios_model.dart';
import 'package:mobx/mobx.dart';
part 'controller_comentarios.g.dart';

class ControllerComentarios = ControllerComentariosBase with _$ControllerComentarios;

abstract class ControllerComentariosBase with Store {
  @observable
  ObservableList<ComentarioModel> comentarios = ObservableList();

  @action
  add(ComentarioModel e) {
    comentarios.add(e);
  }
}