// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_eventos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerEventos on ControllerEventosBase, Store {
  late final _$_eventosAtom =
      Atom(name: 'ControllerEventosBase._eventos', context: context);

  @override
  ObservableList<EventoModel> get _eventos {
    _$_eventosAtom.reportRead();
    return super._eventos;
  }

  @override
  set _eventos(ObservableList<EventoModel> value) {
    _$_eventosAtom.reportWrite(value, super._eventos, () {
      super._eventos = value;
    });
  }

  late final _$trazer_eventosAsyncAction =
      AsyncAction('ControllerEventosBase.trazer_eventos', context: context);

  @override
  Future<void> trazer_eventos() {
    return _$trazer_eventosAsyncAction.run(() => super.trazer_eventos());
  }

  late final _$trazer_favoritosAsyncAction =
      AsyncAction('ControllerEventosBase.trazer_favoritos', context: context);

  @override
  Future<void> trazer_favoritos() {
    return _$trazer_favoritosAsyncAction.run(() => super.trazer_favoritos());
  }

  late final _$tooggle_favoritoAsyncAction =
      AsyncAction('ControllerEventosBase.tooggle_favorito', context: context);

  @override
  Future<void> tooggle_favorito(EventoModel e) {
    return _$tooggle_favoritoAsyncAction.run(() => super.tooggle_favorito(e));
  }

  late final _$add_eventoAsyncAction =
      AsyncAction('ControllerEventosBase.add_evento', context: context);

  @override
  Future<void> add_evento(EventoModel e, File? imageFile) {
    return _$add_eventoAsyncAction.run(() => super.add_evento(e, imageFile));
  }

  late final _$update_eventoAsyncAction =
      AsyncAction('ControllerEventosBase.update_evento', context: context);

  @override
  Future<void> update_evento(EventoModel e, File? imageFile) {
    return _$update_eventoAsyncAction
        .run(() => super.update_evento(e, imageFile));
  }

  late final _$upsertAsyncAction =
      AsyncAction('ControllerEventosBase.upsert', context: context);

  @override
  Future<void> upsert(EventoModel e, File? imageFile) {
    return _$upsertAsyncAction.run(() => super.upsert(e, imageFile));
  }

  late final _$ControllerEventosBaseActionController =
      ActionController(name: 'ControllerEventosBase', context: context);

  @override
  dynamic _add(EventoModel e) {
    final _$actionInfo = _$ControllerEventosBaseActionController.startAction(
        name: 'ControllerEventosBase._add');
    try {
      return super._add(e);
    } finally {
      _$ControllerEventosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _remove(EventoModel e) {
    final _$actionInfo = _$ControllerEventosBaseActionController.startAction(
        name: 'ControllerEventosBase._remove');
    try {
      return super._remove(e);
    } finally {
      _$ControllerEventosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
