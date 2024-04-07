import 'package:event_app/controllers/controller_usuario_form.dart';
import 'package:event_app/controllers/controller_usuarios.dart';
import 'package:event_app/models/usuario.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

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
                          Observer(builder: (_) {
                            return textField(
                              labelText: "Nome",
                              onChanged: usrForm.setNome,
                              errorText: usrForm.validateNome,
                            );
                          }),
                          const SizedBox(height: 20),
                          Observer(builder: (_) {
                            return textField(
                              labelText: "Email",
                              onChanged: usrForm.setEmail,
                              value: usrForm.email,
                              errorText: usrForm.validateEmail,
                            );
                          }),
                          const SizedBox(height: 20),
                          Observer(builder: (_) {
                            return textField(
                              labelText: "Senha",
                              onChanged: usrForm.setSenha,
                              value: usrForm.senha,
                              errorText: usrForm.validateSenha,
                              obscureText: true,
                            );
                          }),
                          const SizedBox(height: 20),
                          Observer(builder: (_) {
                            if (dbUsers.mensagemCadstro != null) {
                              return Text(
                                '${dbUsers.mensagemCadstro}',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 10.0),
                              );
                            }
                            return const SizedBox(height: 0);
                          }),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Usuario? u = dbUsers.cadastro(Usuario(
                                  id: usrForm.id,
                                  nome: usrForm.nome,
                                  email: usrForm.email,
                                  senha: usrForm.senha));
                              if (u != null) {
                                dbUsers.setMsgCadastro(null);
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                            ),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                color: Colors
                                    .black, // Altera a cor do texto para preto
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
            )));
  }
}
