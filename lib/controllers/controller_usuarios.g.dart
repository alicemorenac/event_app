// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_usuarios.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerUsuarios on ControllerUsuariosBase, Store {
  late final _$usuariosAtom =
      Atom(name: 'ControllerUsuariosBase.usuarios', context: context);

  @override
  ObservableList<UsuarioModel> get usuarios {
    _$usuariosAtom.reportRead();
    return super.usuarios;
  }

  @override
  set usuarios(ObservableList<UsuarioModel> value) {
    _$usuariosAtom.reportWrite(value, super.usuarios, () {
      super.usuarios = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: 'ControllerUsuariosBase.mensagem', context: context);

  @override
  String? get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(String? value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$mensagemCadstroAtom =
      Atom(name: 'ControllerUsuariosBase.mensagemCadstro', context: context);

  @override
  String? get mensagemCadstro {
    _$mensagemCadstroAtom.reportRead();
    return super.mensagemCadstro;
  }

  @override
  set mensagemCadstro(String? value) {
    _$mensagemCadstroAtom.reportWrite(value, super.mensagemCadstro, () {
      super.mensagemCadstro = value;
    });
  }

  late final _$ControllerUsuariosBaseActionController =
      ActionController(name: 'ControllerUsuariosBase', context: context);

  @override
  dynamic add(UsuarioModel u) {
    final _$actionInfo = _$ControllerUsuariosBaseActionController.startAction(
        name: 'ControllerUsuariosBase.add');
    try {
      return super.add(u);
    } finally {
      _$ControllerUsuariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic remove(UsuarioModel u) {
    final _$actionInfo = _$ControllerUsuariosBaseActionController.startAction(
        name: 'ControllerUsuariosBase.remove');
    try {
      return super.remove(u);
    } finally {
      _$ControllerUsuariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMsg(String? msg) {
    final _$actionInfo = _$ControllerUsuariosBaseActionController.startAction(
        name: 'ControllerUsuariosBase.setMsg');
    try {
      return super.setMsg(msg);
    } finally {
      _$ControllerUsuariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMsgCadastro(String? msg) {
    final _$actionInfo = _$ControllerUsuariosBaseActionController.startAction(
        name: 'ControllerUsuariosBase.setMsgCadastro');
    try {
      return super.setMsgCadastro(msg);
    } finally {
      _$ControllerUsuariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  UsuarioModel? login(String? email, String? pass) {
    final _$actionInfo = _$ControllerUsuariosBaseActionController.startAction(
        name: 'ControllerUsuariosBase.login');
    try {
      return super.login(email, pass);
    } finally {
      _$ControllerUsuariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  UsuarioModel? cadastro(UsuarioModel u) {
    final _$actionInfo = _$ControllerUsuariosBaseActionController.startAction(
        name: 'ControllerUsuariosBase.cadastro');
    try {
      return super.cadastro(u);
    } finally {
      _$ControllerUsuariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarios: ${usuarios},
mensagem: ${mensagem},
mensagemCadstro: ${mensagemCadstro}
    ''';
  }
}
