import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Ou use WidgetsApp
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text("Login"),
        ),
      ),
    );
  }
}
