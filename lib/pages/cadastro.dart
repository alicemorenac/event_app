import 'dart:convert';

import 'package:event_app/auth/auth.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/models/usuario_model.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool isLoad = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String message = "";

  Future<void> _cadastrar() async {
    String nome = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty || nome.isEmpty) {
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
      ).cadastro(nome, email, password);

      final Map<String, dynamic> parsedJson = jsonDecode(data);
      await Provider.of<Auth>(context, listen: false)
          .set_user(parsedJson['id'], parsedJson['nome'], parsedJson['email']);
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possivel cadastrar o usuário')),
      );
    } finally {
      setState(() {
        isLoad = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final usrForm = Provider.of<UsuarioModel>(context);
    final dbUsers = Provider.of<ControllerUsuarios>(context);
    return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Cadastre-se',
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
                          const SizedBox(height: 20),
                          textField(
                            labelText: "Nome",
                            controll: _nameController,
                            errorText: () => "",
                          ),
                          const SizedBox(height: 20),
                          textField(
                            labelText: "Email",
                            controll: _emailController,
                            errorText: () => "",
                          ),
                          const SizedBox(height: 20),
                          textField(
                            labelText: "Senha",
                            controll: _passwordController,
                            errorText: () => "",
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          if (message.isNotEmpty)
                            Text(
                              '${message}',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 10.0),
                            ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _cadastrar(); // Chamar a função de login
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (isLoad)
                                  Container(
                                    child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.black),
                                    ),
                                  ),
                                if (!isLoad) // Adicionar o texto dentro de outra condição
                                  const Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                const SizedBox(
                                    width:
                                        10), // Adicionar um espaço entre o texto e o indicador de carregamento
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
            ));
  }
}

