import 'package:event_app/models/evento_model.dart';
import 'package:event_app/widgets/modal_view_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        width:
            200, // Defina a largura máxima do texto para quebrar corretamente
        child: Text(
          value!,
          softWrap: true, // Permite que o texto seja quebrado em várias linhas
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}

Widget cardEvento({BuildContext? context, required EventoModel evento}) {
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
                              child: Image.asset('assets/evento.png'),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textLabel(label: 'Local', value: '${evento.localEvento!} - ${evento.formatarData()}'),
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
                                        .orange), // Define a cor da borda como roxa
                                borderRadius: BorderRadius.circular(
                                    8), // Define a borda arredondada
                              ),
                              child: TextButton(
                                onPressed: () {
                                  modalVisualizarEvento(context!, evento);
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
                            // const Divider(),
                            Observer(builder: (_) {
                              return IconButton(
                                  onPressed: () {
                                    evento.setChekked();
                                  },
                                  icon: Icon(Icons.star,
                                      color: evento.checked
                                          ? Colors.orange
                                          : Colors.white));
                            }),
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
