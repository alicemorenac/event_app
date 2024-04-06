import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: const Text(
          //   'Cadastro',
          //   style: TextStyle(
          //     color: Colors.orange,
          //     fontSize: 24,
          //     fontWeight: FontWeight.bold,
          //     fontStyle: FontStyle.italic,
          //     fontFamily: 'Roboto',
          //   ),
          // ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: RegistrationForm(),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Nome',
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle:  TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.orange),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.orange),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Senha',
              labelStyle:  TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.orange),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.orange),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement registration functionality
            },
            style: ElevatedButton.styleFrom(
              // primary: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
            ),
            child: const Text(
              'Cadastrar',
              style: TextStyle(
                color: Colors.black, // Altera a cor do texto para preto
              ),
            ),
          ),
        ],
      ),
    );
  }
}