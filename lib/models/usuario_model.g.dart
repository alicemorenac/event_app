// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsuarioModel on ControllerUsuarioModel, Store {
  late final _$idAtom =
      Atom(name: 'ControllerUsuarioModel.id', context: context);

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: 'ControllerUsuarioModel.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ControllerUsuarioModel.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: 'ControllerUsuarioModel.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$ControllerUsuarioModelActionController =
      ActionController(name: 'ControllerUsuarioModel', context: context);

  @override
  void setId(String id) {
    final _$actionInfo = _$ControllerUsuarioModelActionController.startAction(
        name: 'ControllerUsuarioModel.setId');
    try {
      return super.setId(id);
    } finally {
      _$ControllerUsuarioModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String nome) {
    final _$actionInfo = _$ControllerUsuarioModelActionController.startAction(
        name: 'ControllerUsuarioModel.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$ControllerUsuarioModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$ControllerUsuarioModelActionController.startAction(
        name: 'ControllerUsuarioModel.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$ControllerUsuarioModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$ControllerUsuarioModelActionController.startAction(
        name: 'ControllerUsuarioModel.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$ControllerUsuarioModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
nome: ${nome},
email: ${email},
senha: ${senha}
    ''';
  }
}
