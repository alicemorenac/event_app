import 'dart:convert';

import 'package:event_app/auth/auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/models/usuario_model.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoad = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String message = "";

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty){
      setState(() {
        message = "Digite os dados corretamente";
      });
      return;
    }

    setState(() {
      isLoad = true;
    });

    try {
      final data = await Provider.of<UsuarioModel>(
      context,
      listen: false,
    ).login(email, password);

    final Map<String, dynamic> parsedJson = jsonDecode(data);
      await Provider.of<Auth>(context, listen: false).set_user(parsedJson['id'], parsedJson['nome'], parsedJson['email']);
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario ou senha incorretos.')),
      );
    } finally {
       setState(() {
          isLoad = false;
       });
    }
  }

  @override
  Widget build(BuildContext context) {
    final usuarioModel = Provider.of<UsuarioModel>(context);
    final dbUsers = Provider.of<ControllerUsuarios>(context);

    return  Scaffold(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: textField(
                    labelText: "Email",
                    controll: _emailController,
                    errorText: () => "",
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: textField(
                      labelText: "Senha",
                      controll: _passwordController,
                      errorText: () => "",
                      obscureText: true),
                ),
                const SizedBox(height: 20.0),
                if(message.isNotEmpty)
                   Text(
                      '$message',
                      style: const TextStyle(color: Colors.red, fontSize: 10.0),
                    ),

                const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _login(); // Chamar a função de login
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoad)
                      Container(
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      ),
                    if (!isLoad) // Adicionar o texto dentro de outra condição
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    const SizedBox(width: 10), // Adicionar um espaço entre o texto e o indicador de carregamento
                  ],
                ),
              ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    usuarioModel.setNome('');
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
      );
  }
}
