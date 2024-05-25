import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void modalNewEvento(BuildContext context, EventoModel? eventoModel) {
  // Inicialize os valores do evento fora da árvore de widgets
  final EventoModel evento = eventoModel != null
      ? EventoModel(
          id: eventoModel.id,
          nomeEvento: eventoModel.nomeEvento,
          descricaoEvento: eventoModel.descricaoEvento,
          localEvento: eventoModel.localEvento,
          dataEvento: eventoModel.dataEvento ?? DateTime.now(),
        )
      : EventoModel();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      final listaEventos = Provider.of<ControllerEventos>(context, listen: false);

      return ChangeNotifierProvider.value(
        value: evento,
        child: SingleChildScrollView(
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
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/evento.png'),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 20),
                    child: Text('Novo evento', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Consumer<EventoModel>(builder: (context, meuModel, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: textField(
                      labelText: "Nome do Evento",
                      onChanged: meuModel.setNome,
                      value: meuModel.nomeEvento,
                      errorText: () => '',
                    ),
                  );
                }),
                Consumer<EventoModel>(builder: (context, meuModel, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                    child: textField(
                      labelText: "Descrição do evento",
                      onChanged: meuModel.setDescricao,
                      value: meuModel.descricaoEvento,
                      errorText: () => '',
                    ),
                  );
                }),
                Consumer<EventoModel>(builder: (context, meuModel, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: textField(
                      labelText: "Local do Evento",
                      onChanged: meuModel.setLocal,
                      value: meuModel.localEvento,
                      errorText: () => '',
                    ),
                  );
                }),
                Consumer<EventoModel>(builder: (context, meuModel, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: meuModel.dataEvento ?? DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          meuModel.setData(pickedDate);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.orange, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Data do Evento ${meuModel.formatarData()}',
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      listaEventos.upsert(evento);
                      Navigator.pop(context);
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
