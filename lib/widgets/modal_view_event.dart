import 'package:event_app/models/evento_model.dart';
import 'package:flutter/material.dart';

void modalVisualizarEvento(BuildContext context, EventoModel evento) {

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${evento.formatarData()}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 5),
                  child: Text('${evento.nomeEvento}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 20)),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text('${evento.descricaoEvento}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16)),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Text('${evento.localEvento}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16)),
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/qr-code.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

