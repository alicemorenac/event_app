import 'package:event_app/controllers/controller_comentarios.dart';
import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/controllers/controller_usuario_form.dart';
import 'package:event_app/models/comentarios_model.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/utils/constantes.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void modalNewComment(BuildContext context) {
  double altura = Constantes.alturaDaTela(context);
  final comentario = ComentarioModel();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      final listaComentarios = Provider.of<ControllerComentarios>(context);
      final usrForm = Provider.of<ControllerUsuarioForm>(context);

      comentario.setUsername(usrForm.nome);
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              
              const Center(child: Padding(padding: EdgeInsets.only(top: 5, bottom: 20), child: Text('Novo comentario', style: TextStyle(color: Colors.white),))),
        
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: textField(
                      labelText: "Comentario",
                      onChanged: comentario.setContent,
                      value: comentario.content,
                      errorText: () => ''),
                );
              }),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      listaComentarios.add(comentario);         
                      Navigator.pop(context);
                    },
                    child: const Text('Comentar'),
                  )),
            ],
          ),
        ),
      );
    },
  );
}
