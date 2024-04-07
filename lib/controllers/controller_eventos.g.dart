// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_eventos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerEventos on ControllerEventosBase, Store {
  late final _$eventosAtom =
      Atom(name: 'ControllerEventosBase.eventos', context: context);

  @override
  List<Evento> get eventos {
    _$eventosAtom.reportRead();
    return super.eventos;
  }

  @override
  set eventos(List<Evento> value) {
    _$eventosAtom.reportWrite(value, super.eventos, () {
      super.eventos = value;
    });
  }

  late final _$ControllerEventosBaseActionController =
      ActionController(name: 'ControllerEventosBase', context: context);

  @override
  dynamic add(Evento u) {
    final _$actionInfo = _$ControllerEventosBaseActionController.startAction(
        name: 'ControllerEventosBase.add');
    try {
      return super.add(u);
    } finally {
      _$ControllerEventosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventos: ${eventos}
    ''';
  }
}
