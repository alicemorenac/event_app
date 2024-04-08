// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventoModel on ModelEventoBase, Store {
  late final _$idAtom = Atom(name: 'ModelEventoBase.id', context: context);

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

  late final _$nomeEventoAtom =
      Atom(name: 'ModelEventoBase.nomeEvento', context: context);

  @override
  String? get nomeEvento {
    _$nomeEventoAtom.reportRead();
    return super.nomeEvento;
  }

  @override
  set nomeEvento(String? value) {
    _$nomeEventoAtom.reportWrite(value, super.nomeEvento, () {
      super.nomeEvento = value;
    });
  }

  late final _$descricaoEventoAtom =
      Atom(name: 'ModelEventoBase.descricaoEvento', context: context);

  @override
  String? get descricaoEvento {
    _$descricaoEventoAtom.reportRead();
    return super.descricaoEvento;
  }

  @override
  set descricaoEvento(String? value) {
    _$descricaoEventoAtom.reportWrite(value, super.descricaoEvento, () {
      super.descricaoEvento = value;
    });
  }

  late final _$localEventoAtom =
      Atom(name: 'ModelEventoBase.localEvento', context: context);

  @override
  String? get localEvento {
    _$localEventoAtom.reportRead();
    return super.localEvento;
  }

  @override
  set localEvento(String? value) {
    _$localEventoAtom.reportWrite(value, super.localEvento, () {
      super.localEvento = value;
    });
  }

  late final _$dataEventoAtom =
      Atom(name: 'ModelEventoBase.dataEvento', context: context);

  @override
  DateTime? get dataEvento {
    _$dataEventoAtom.reportRead();
    return super.dataEvento;
  }

  @override
  set dataEvento(DateTime? value) {
    _$dataEventoAtom.reportWrite(value, super.dataEvento, () {
      super.dataEvento = value;
    });
  }

  late final _$checkedAtom =
      Atom(name: 'ModelEventoBase.checked', context: context);

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  late final _$ModelEventoBaseActionController =
      ActionController(name: 'ModelEventoBase', context: context);

  @override
  dynamic setId(String? id) {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.setId');
    try {
      return super.setId(id);
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String nomeEvento) {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.setNome');
    try {
      return super.setNome(nomeEvento);
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(String descricaoEvento) {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.setDescricao');
    try {
      return super.setDescricao(descricaoEvento);
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLocal(String localEvento) {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.setLocal');
    try {
      return super.setLocal(localEvento);
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChekked() {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.setChekked');
    try {
      return super.setChekked();
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setData(DateTime? dataEvento) {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.setData');
    try {
      return super.setData(dataEvento);
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$ModelEventoBaseActionController.startAction(
        name: 'ModelEventoBase.reset');
    try {
      return super.reset();
    } finally {
      _$ModelEventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
nomeEvento: ${nomeEvento},
descricaoEvento: ${descricaoEvento},
localEvento: ${localEvento},
dataEvento: ${dataEvento},
checked: ${checked}
    ''';
  }
}
