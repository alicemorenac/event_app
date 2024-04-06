import 'package:event_app/models/usuario.dart';
import 'package:mobx/mobx.dart';
part 'controller_usuarios.g.dart';

class ControllerUsuarios = ControllerUsuariosBase with _$ControllerUsuarios;

abstract class ControllerUsuariosBase with Store {
  @observable
  List<Usuario> usuarios = [];

  @observable
  String ? mensagem;

  ControllerUsuariosBase() {
    setMsg(null);
    add(Usuario(
      id: '12123',
      nome: 'Madson Neves',
      email: 'madson.neves@ufrn.edu.br',
      senha: '12345',
    ));
  }

  @action
  add(Usuario u) {
    _findByEmail(u.email) == null ? usuarios.add(u) : null;
  }

  @action
  remove(Usuario u) {
    usuarios.remove(u);
  }

  @action
  setMsg(String ? msg) {
    mensagem = msg;
  }

  @action
  Usuario? login(String email, String pass) {
    try {
      return usuarios
          .firstWhere((user) => user.email == email && user.senha == pass);
    } catch (e) {
      setMsg('Usuario ou senha incorretos.');
      return null;
    }
  }

  Usuario ? _findByEmail(String email){
    try {
        return usuarios.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }
}