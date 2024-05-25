import 'package:event_app/controllers/controller_comentarios.dart';
import 'package:event_app/models/comentarios_model.dart';
import 'package:event_app/models/usuario_model.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void modalNewComment(BuildContext context) {
  final comentario = ComentarioModel();

  Future<String> _getNome() async {
    final _preff = await SharedPreferences.getInstance();
    String? nome = _preff.getString('nome');
    return nome ?? 'Anonymous';
  }

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      final listaComentarios = Provider.of<ControllerComentarios>(context);
      final usrForm = Provider.of<UsuarioModel>(context);

      return FutureBuilder<String>(
        future: _getNome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading user name'));
          } else {
            comentario.setUsername(snapshot.data!);
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 20),
                      child: Text(
                        'Novo comentario',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: textField(
                          labelText: "Comentario",
                          onChanged: comentario.setContent,
                          value: comentario.content,
                          errorText: () => '',
                        ),
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
          }
        },
      );
    },
  );
}
