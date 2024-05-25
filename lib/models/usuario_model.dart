import 'dart:convert';
import 'dart:math';
import 'package:event_app/api/Api.dart';
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

  ControllerUsuarioModel({this.id, this.nome, this.email, this.senha});

  @action
  Future<dynamic> login(String email, String senha) async {
    Map<String, String> data = {
      "email": email,
      "senha": senha
    };

    final response = await ApiClient().POST("/usuarios/login", data);

    if (response.statusCode != 200) throw Error();

    return response.body;
  }

  @action
  Future<dynamic> cadastro(String nome, String email, String senha) async {
    Map<String, String> data = {
      "nome": nome,
      "email": email,
      "senha": senha
    };
    
    final response = await ApiClient().POST("/usuarios/", data);

    if (response.statusCode != 200) throw Error();

    return response.body;
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




