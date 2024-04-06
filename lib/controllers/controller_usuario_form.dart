import 'dart:math';

import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/models/usuario.dart';
import 'package:mobx/mobx.dart';
part 'controller_usuario_form.g.dart';

class ControllerUsuarioForm = ControllerUsuarioFormBase with _$ControllerUsuarioForm;

const MESSSAGE = 'Campo obrigatório.';
const EMPTY = '';

abstract class ControllerUsuarioFormBase with Store {
  final dbUsers = ControllerUsuarios();
  
  @observable
  String id = '';
  @observable
  String nome = '';
  @observable
  String email = '';
  @observable
  String senha = '';

  ControllerUsuarioFormBase() {
    int randomNumber = Random().nextInt(1000000);
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String uniqueString = '$randomNumber$timestamp';

    setId(uniqueString);
  }


  @action
  void setId(String id){
    this.id = id;
  }
  @action
  void setNome(String nome){
    this.nome = nome;
  }

  @action 
  void setEmail(String email){
    this.email = email;
  }

  @action
  void setSenha(String senha){
    this.senha = senha;
  }

  String validateNome(){
    if (nome.isEmpty || nome == ''){
      return MESSSAGE;
    }

    return EMPTY;
  }


  String validateEmail(){
    if (email.isEmpty || email == ''){
      return MESSSAGE;
    }

    return EMPTY;
  }
  String validateSenha(){
    if (senha.isEmpty || senha == ''){
      return MESSSAGE;
    }

    return EMPTY;
  }
}


