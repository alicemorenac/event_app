import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/controllers/controller_usuario_form.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/pages/cadastro.dart';
import 'package:event_app/pages/lista_eventos.dart';
import 'package:provider/provider.dart';

import './pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Navigator());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  int _currentIndex = 0;

  // Adicione as páginas aqui
  List<Widget> body = const [
    ListaEventos(),
    ListaEventos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: body[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home, color: Colors.white),
            activeIcon: Icon(Icons.home, color: Colors.purpleAccent),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.star, color: Colors.white),
            activeIcon: Icon(Icons.star, color: Colors.purpleAccent),
          )
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton.large(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  // titleBox(String s) {}
}

class Navigator extends StatelessWidget {
  const Navigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ControllerUsuarios>(create: (_) => ControllerUsuarios()),
          Provider<ControllerEventos>(create: (_) => ControllerEventos()),
          Provider<ControllerUsuarioForm>(
              create: (_) => ControllerUsuarioForm())
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const Login(),
            '/home': (context) => const Home(),
            '/cadastro': (context) => const Cadastro(),
          },
        ));
  }
}
