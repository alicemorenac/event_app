import 'dart:math';
import 'package:mobx/mobx.dart';
part 'usuario_model.g.dart';

class UsuarioModel = ControllerUsuarioModel with _$UsuarioModel;

const MESSSAGE = 'Campo obrigatório.';
const EMPTY = '';

abstract class ControllerUsuarioModel with Store {
  
  @observable
  String ? id = '';
  @observable
  String ? nome = '';
  @observable
  String ? email = '';
  @observable
  String ? senha = '';

  ControllerUsuarioModel({this.nome, this.email, this.senha}) {
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
    if (nome!.isEmpty || nome == ''){
      return MESSSAGE;
    }

    return EMPTY;
  }


  String validateEmail(){
    if (email == ''){
      return MESSSAGE;
    }

    return EMPTY;
  }
  String validateSenha(){
    if (senha == ''){
      return MESSSAGE;
    }

    return EMPTY;
  }
}


