import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/widgets/modal_add_evento.dart';
import 'package:event_app/widgets/modal_view_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

Column textLabel({
  String? label,
  String? value,
  CrossAxisAlignment cross = CrossAxisAlignment.start,
  MainAxisAlignment main = MainAxisAlignment.start,
}) {
  return Column(
    mainAxisAlignment: main,
    crossAxisAlignment: cross,
    children: [
      Text(
        label!,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
        ),
      ),
      SizedBox(
        width: 200,
        child: Text(
          value!,
          softWrap: true,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}

Widget cardEvento({required BuildContext context, required EventoModel evento, bool meus_eventos = false}) {
  final eventos = Provider.of<ControllerEventos>(context);


  void _deletar(EventoModel _evento) async {
    Navigator.of(context).pop(false); 
    await eventos.deletar_evento(_evento);
  }

  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Card(
            color: const Color.fromARGB(59, 59, 2, 152),
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: evento.foto != null ? Image.network(evento.foto!) : Image.asset('assets/evento.png'),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textLabel(label: 'Data', value: '${evento.formatarData()}'),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textLabel(
                          label: 'Nome do evento', value: evento.nomeEvento!),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textLabel(
                          label: 'Descricao', value: evento.descricaoEvento!),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors
                                        .orange),
                                borderRadius: BorderRadius.circular(
                                    8),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  modalVisualizarEvento(context, evento);
                                },
                                child: const Text(
                                  'VER EVENTO',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),

                            if(meus_eventos)
                             Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      modalNewEvento(context, evento);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8), // Espaçamento entre os botões
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Exluir'),
                                            content: const Text('Tem certeza que deseja excluir o evento?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(false); // Cancela o logout
                                                },
                                                child: const Text('Cancelar'),
                                              ),
                                              TextButton(
                                                onPressed:() { _deletar(evento);},
                                                child: const Text('Exluir'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),

                            if(!meus_eventos)
                              Observer(builder: (_) {
                                return IconButton(
                                    onPressed: () {
                                      eventos.tooggle_favorito(evento);
                                    },
                                    icon: Icon(Icons.star, color: eventos.isFavorite(evento) ? Colors.orange: Colors.white));
                              }),
                            // const Divider(),
                          ])),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
