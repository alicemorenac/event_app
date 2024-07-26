import 'package:event_app/auth/auth.dart';
import 'package:event_app/controllers/controller_comentarios.dart';
import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/models/usuario_model.dart';
import 'package:event_app/pages/cadastro.dart';
import 'package:event_app/pages/comentarios.dart';
import 'package:event_app/pages/lista_eventos.dart';
import 'package:event_app/pages/splash.dart';
import 'package:event_app/utils/app_routes.dart';
import 'package:event_app/widgets/modal_add_coment.dart';
import 'package:event_app/widgets/modal_add_evento.dart';
import 'package:provider/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import './pages/login.dart';
import 'package:flutter/material.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("4315d502-c70b-4e49-addd-e52f41837762");
// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
  // runApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Auth()),
    ChangeNotifierProvider<EventoModel>(create: (_) => EventoModel()),
    Provider<UsuarioModel>(create: (_) => UsuarioModel()),
    Provider<ControllerUsuarios>(create: (_) => ControllerUsuarios()),
    Provider<ControllerComentarios>(create: (_) => ControllerComentarios()),
    Provider<ControllerEventos>(create: (_) => ControllerEventos()),
  ], child: const Navigator()));
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
    Comentarios(),
  ];

  @override
  Widget build(BuildContext context) {
    // final evento = Provider.of<EventoModel>(context);
    // final listaEventos = Provider.of<ControllerEventos>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(24, 44, 2, 97),
      body: Center(child: body[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(24, 44, 2, 97),
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home, color: Colors.white),
            activeIcon: Icon(Icons.home, color: Colors.purpleAccent),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.comment, color: Colors.white),
            activeIcon: Icon(Icons.comment, color: Colors.purpleAccent),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            onPressed: () {
              if (_currentIndex == 0) {
                modalNewEvento(context, null);
              } else {
                modalNewComment(context);
              }
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
  const Navigator({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, child) {
        return MaterialApp(
          initialRoute: AppRoutes.SPLASH,
          routes: {
            AppRoutes.SPLASH: (context) => const SplashScreen(),
            AppRoutes.LOGIN: (context) => const Login(),
            AppRoutes.HOME: (context) => const Home(),
            AppRoutes.CADASTRO: (context) => const Cadastro(),
          },
        );
      },
    );
  }
}


