import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  late SharedPreferences _preff;
  bool _isInitialized = false;
  bool _isAuthenticated = false;

  Map<String, String> auth = {};

  Auth() {
    _start();
  }

  Future<void> _start() async {
    await _start_preffs();
    await _read_user();
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> _read_user() async {
    final id = _preff.getString('id');
    final nome = _preff.getString('nome');
    final email = _preff.getString('email');

    if (id != null && nome != null && email != null) {
      auth = {
        "id": id,
        "nome": nome,
        "email": email,
      };
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  Future<bool> isAuth() async {
    await _ensureInitialized();
    return _isAuthenticated;
  }

  Future<void> _ensureInitialized() async {
    while (!_isInitialized) {
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  Future<void> set_user(int id, String nome, String email) async {
    await _preff.setString('id', id.toString());
    await _preff.setString('nome', nome);
    await _preff.setString('email', email);
    await _read_user();
  }

  Future<void> _start_preffs() async {
    _preff = await SharedPreferences.getInstance();
  }

  Future<String?> getId() async {
    return _preff.getString('id');
  }
  Future<String?> getNome() async {
    return _preff.getString('nome');
  }
}
