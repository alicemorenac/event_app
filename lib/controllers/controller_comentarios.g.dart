// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_comentarios.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerComentarios on ControllerComentariosBase, Store {
  late final _$comentariosAtom =
      Atom(name: 'ControllerComentariosBase.comentarios', context: context);

  @override
  ObservableList<ComentarioModel> get comentarios {
    _$comentariosAtom.reportRead();
    return super.comentarios;
  }

  @override
  set comentarios(ObservableList<ComentarioModel> value) {
    _$comentariosAtom.reportWrite(value, super.comentarios, () {
      super.comentarios = value;
    });
  }

  late final _$ControllerComentariosBaseActionController =
      ActionController(name: 'ControllerComentariosBase', context: context);

  @override
  dynamic add(ComentarioModel e) {
    final _$actionInfo = _$ControllerComentariosBaseActionController
        .startAction(name: 'ControllerComentariosBase.add');
    try {
      return super.add(e);
    } finally {
      _$ControllerComentariosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
comentarios: ${comentarios}
    ''';
  }
}
