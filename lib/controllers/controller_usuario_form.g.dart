// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_usuario_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerUsuarioForm on ControllerUsuarioFormBase, Store {
  late final _$idAtom =
      Atom(name: 'ControllerUsuarioFormBase.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: 'ControllerUsuarioFormBase.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ControllerUsuarioFormBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: 'ControllerUsuarioFormBase.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$ControllerUsuarioFormBaseActionController =
      ActionController(name: 'ControllerUsuarioFormBase', context: context);

  @override
  void setId(String id) {
    final _$actionInfo = _$ControllerUsuarioFormBaseActionController
        .startAction(name: 'ControllerUsuarioFormBase.setId');
    try {
      return super.setId(id);
    } finally {
      _$ControllerUsuarioFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String nome) {
    final _$actionInfo = _$ControllerUsuarioFormBaseActionController
        .startAction(name: 'ControllerUsuarioFormBase.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$ControllerUsuarioFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$ControllerUsuarioFormBaseActionController
        .startAction(name: 'ControllerUsuarioFormBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$ControllerUsuarioFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$ControllerUsuarioFormBaseActionController
        .startAction(name: 'ControllerUsuarioFormBase.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$ControllerUsuarioFormBaseActionController.endAction(_$actionInfo);
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
