import 'package:event_app/models/usuario_model.dart';
import 'package:mobx/mobx.dart';
part 'controller_usuarios.g.dart';

class ControllerUsuarios = ControllerUsuariosBase with _$ControllerUsuarios;

abstract class ControllerUsuariosBase with Store {
  @observable
  ObservableList<UsuarioModel> usuarios = [
      UsuarioModel(nome: 'Mádson Neves', email: 'madson.neves@ufrn.edu.br', senha: '12345'),
      UsuarioModel(nome: 'Pedro Cantidio', email: 'cantidio@ufrn.edu.br', senha: '12345'),
    ].asObservable();

  @observable
  String ? mensagem;
  @observable
  String ? mensagemCadstro;

  ControllerUsuariosBase() {
    setMsg(null);
  }

  @action
  add(UsuarioModel u) {
    _findByEmail(u.email) == null ? usuarios.add(u) : null;
  }

  @action
  remove(UsuarioModel u) {
    usuarios.remove(u);
  }

  @action
  setMsg(String ? msg) {
    mensagem = msg;
  }
  @action
  setMsgCadastro(String ? msg) {
    mensagemCadstro = msg;
  }

  @action
  UsuarioModel? login(String ? email, String ? pass) {
    try {
      return usuarios
          .firstWhere((user) => user.email == email && user.senha == pass);
    } catch (e) {
      setMsg('Usuario ou senha incorretos.');
      return null;
    }
  }

  @action
  UsuarioModel ? cadastro(UsuarioModel u){
    if (_findByEmail(u.email) != null){
      setMsgCadastro('Usuario já existe.');
      return null;
    }
    add(u);
    return u;
  }

  UsuarioModel ? _findByEmail(String ? email){
    try {
        return usuarios.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }
}
