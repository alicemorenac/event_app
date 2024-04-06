import 'package:event_app/controllers/controller_usuario_form.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/pages/cadastro.dart';
import 'package:provider/provider.dart';

import './pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ControllerUsuarios>(create: (_) => ControllerUsuarios()),
        Provider<ControllerUsuarioForm>(create: (_) => ControllerUsuarioForm())
      ],
      child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(), 
        '/cadastro': (context) =>  const Cadastro(), 
      },
    ));
  }
}