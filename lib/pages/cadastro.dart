import 'package:flutter/material.dart';


class Cadastro extends StatelessWidget {
  const Cadastro({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Ou use WidgetsApp
      home: Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Text("Cadstro"),
        ),
      ),
    );
  }
}
