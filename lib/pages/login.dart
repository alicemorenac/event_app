import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/models/usuario.dart';
import 'package:event_app/controllers/controller_usuario_form.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final usrForm = Provider.of<ControllerUsuarioForm>(context);
    final dbUsers = Provider.of<ControllerUsuarios>(context);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Entre',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/evento.png'),
                ),
                const SizedBox(height: 20.0),
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: textField(
                        labelText: "Email",
                        onChanged: usrForm.setEmail,
                        errorText: usrForm.validateEmail),
                  );
                }),
                const SizedBox(height: 20.0),
                Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: textField(
                        labelText: "Senha",
                        onChanged: usrForm.setSenha,
                        errorText: usrForm.validateSenha,
                        obscureText: true),
                  );
                }),
                const SizedBox(height: 20.0),
                  Observer(builder: (_) {
                    if (dbUsers.mensagem != null){
                      return Text('${dbUsers.mensagem}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10.0
                        ),
                      );
                    }
                    return const SizedBox(height: 0);
                }),
                 
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                   Usuario ? u = dbUsers.login(usrForm.email, usrForm.senha);

                   if (u != null){
                    dbUsers.setMsg(null);
                    // Navigator.of(context).pushReplacementNamed('/home'); //criar essa tela
                   }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    usrForm.setNome('');
                    Navigator.of(context).pushNamed('/cadastro');
                  },
                  child: const Text(
                    'Criar uma conta',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}