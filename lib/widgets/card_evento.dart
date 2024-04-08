import 'package:event_app/models/evento_model.dart';
import 'package:event_app/widgets/modal_view_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget cardEvento({BuildContext ? context,  required EventoModel evento}) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.grey[700],
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Text('${evento.nomeEvento}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  const Divider(),
                  Image.asset('assets/evento.png'),
                  const Divider(),
                  const SizedBox(height: 5),
                  Text('${evento.descricaoEvento}',
                      style: const TextStyle(
                        color: Colors.white,
                      )),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
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
                        const Divider(),
                      Observer(builder: (_){
                        return IconButton(
                            onPressed: () {
                              evento.setChekked();
                            },
                            icon: 
                            
                             Icon(Icons.bookmark,
                                color: evento.checked ? Colors.orange: Colors.white ));
                        }),
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
