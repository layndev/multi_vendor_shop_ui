// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StoreController = BindInject(
  (i) => StoreController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreController on _StoreControllerBase, Store {
  final _$valueAtom = Atom(name: '_StoreControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_StoreControllerBaseActionController =
      ActionController(name: '_StoreControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_StoreControllerBaseActionController.startAction(
        name: '_StoreControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_StoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
