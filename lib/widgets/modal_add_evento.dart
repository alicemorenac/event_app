import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/utils/constantes.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void modalNewEvento(BuildContext context) {
  double altura = Constantes.alturaDaTela(context);
  final evento = EventoModel();
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      final listaEventos = Provider.of<ControllerEventos>(context);
      // final evento = Provider.of<EventoModel>(context);
      evento.reset();
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 75,
                    height: 75,
                    child: Image.asset('assets/evento.png'),
                  )),
              
              const Center(child: Padding(padding: EdgeInsets.only(top: 5, bottom: 20), child: Text('Novo evento', style: TextStyle(color: Colors.white),))),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: textField(
                      labelText: "Nome do Evento",
                      onChanged: evento.setNome,
                      value: evento.nomeEvento,
                      errorText: () => ''),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10),
                  child: textField(
                      labelText: "Descrição do evento",
                      onChanged: evento.setDescricao,
                      value: evento.descricaoEvento,
                      errorText: () => ''),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: textField(
                      labelText: "Local do Evento",
                      onChanged: evento.setLocal,
                      value: evento.localEvento,
                      errorText: () => ''),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: ElevatedButton(
                    onPressed:  () async {
                     evento.setData(await showDatePicker(
                            context: context,
                            initialDate: evento.dataEvento,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100)));                        
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.orange, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Data do Evento ${evento.formatarData()}',
                      style: const TextStyle(
                          color: Colors
                              .orange),
                    ),
                  ),
                );
              }),
              // const SizedBox(height: 20),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      evento.setId(null);
                      listaEventos.add(evento);
                      Navigator.pop(context);
                    },
                    child: const Text('Cadastrar'),
                  )),
            ],
          ),
        ),
      );
    },
  );
}
