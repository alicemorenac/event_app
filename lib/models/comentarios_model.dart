import 'package:mobx/mobx.dart';
part 'comentarios_model.g.dart';

class ComentarioModel = ComentarioBase with _$ComentarioModel;

abstract class ComentarioBase with Store {
  @observable
  String? avatart = 'null';
  @observable
  String? userName = '';
  @observable
  String? content = '';

  @action
  void setContent(String content){
    this.content = content;
  }
  
  @action
  void setUsername(String userName){
    this.userName = userName;
  }
}
