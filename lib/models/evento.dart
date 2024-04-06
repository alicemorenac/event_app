import 'package:event_app/models/usuario.dart';

class Evento {
  final String nomeEvento;
  final String localEvento;
  final DateTime dataEvento;
  List<Usuario> ? usuariosInteressados;

  Evento({
    required this.nomeEvento,
    required this.localEvento,
    required this.dataEvento,
    this.usuariosInteressados,
  });

  void adicionarUsuarioInteressado(Usuario usuario) {
    if (usuariosInteressados == null) {
      usuariosInteressados = [usuario];
    } else {
      usuariosInteressados!.add(usuario);
    }
  }

  // Remove um usuário da lista de usuários interessados
  void removerUsuarioInteressado(Usuario usuario) {
    usuariosInteressados?.remove(usuario);
  }
}