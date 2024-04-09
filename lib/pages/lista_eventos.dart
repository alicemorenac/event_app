import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/models/usuario_model.dart';
import 'package:event_app/widgets/card_evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListaEventos extends StatelessWidget {
  const ListaEventos({super.key});
  @override
  Widget build(BuildContext context) {
    final eventosController = Provider.of<ControllerEventos>(context);
    final usrForm = Provider.of<UsuarioModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${usrForm.nome}',
            style: const TextStyle(
              color: Colors.white,
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
               showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sair'),
                      content: const Text('Tem certeza que deseja fazer sair da aplicação?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false); // Cancela o logout
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/',
                              (Route<dynamic> route) => false, // Remove todas as rotas existentes
                            );
                          },
                          child: const Text('Sair'),
                        ),
                      ],
                    );
                  },
                );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Observer(builder: (_) {
                    return ListView.builder(
                      shrinkWrap:
                          true, // Certifica-se de que a lista não expanda infinitamente
                      physics:
                          const NeverScrollableScrollPhysics(), // Impede a rolagem da lista
                      padding: const EdgeInsets.all(8),
                      itemCount: eventosController.eventos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return cardEvento(
                          context: context,
                            evento: eventosController.eventos[index]);
                      },
                    );
                  }),
                  const SizedBox(height: 40),
                ]),
          ),
        ),
      ),
    );
  }
}
