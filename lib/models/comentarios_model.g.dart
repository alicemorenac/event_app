// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentarios_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComentarioModel on ComentarioBase, Store {
  late final _$avatartAtom =
      Atom(name: 'ComentarioBase.avatart', context: context);

  @override
  String? get avatart {
    _$avatartAtom.reportRead();
    return super.avatart;
  }

  @override
  set avatart(String? value) {
    _$avatartAtom.reportWrite(value, super.avatart, () {
      super.avatart = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: 'ComentarioBase.userName', context: context);

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$contentAtom =
      Atom(name: 'ComentarioBase.content', context: context);

  @override
  String? get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String? value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$ComentarioBaseActionController =
      ActionController(name: 'ComentarioBase', context: context);

  @override
  void setContent(String content) {
    final _$actionInfo = _$ComentarioBaseActionController.startAction(
        name: 'ComentarioBase.setContent');
    try {
      return super.setContent(content);
    } finally {
      _$ComentarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String userName) {
    final _$actionInfo = _$ComentarioBaseActionController.startAction(
        name: 'ComentarioBase.setUsername');
    try {
      return super.setUsername(userName);
    } finally {
      _$ComentarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
avatart: ${avatart},
userName: ${userName},
content: ${content}
    ''';
  }
}
