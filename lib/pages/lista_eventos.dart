import 'package:event_app/auth/auth.dart';
import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/models/usuario_model.dart';
import 'package:event_app/utils/app_routes.dart';
import 'package:event_app/widgets/card_evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FilterOptions {
  Todos,
  Favoritos,
  MeusEventos,
  Sair,
}

class ListaEventos extends StatefulWidget {
  const ListaEventos({super.key});

  @override
  _ListaEventosState createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  bool _isLoading = true;
  FilterOptions filtro = FilterOptions.Todos;
  String ? nome_usuario = "";

  @override
  void initState() {
    super.initState();
    _fetchEventos();
    _getNome();
  }

  Future<void> _getNome() async {
    final _preff =  await SharedPreferences.getInstance();
    String ? nome = _preff.getString('nome');
    setState(() {
      nome_usuario = nome;
    }); 
  }

  void sair() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Limpa todas as preferências compartilhadas
       Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.LOGIN,
        (Route<dynamic> route) => false, // Remove todas as rotas existentes
      );
  }

  Future<void> _fetchEventos() async {
    final eventosController = Provider.of<ControllerEventos>(context, listen: false);
    
    await eventosController.trazer_eventos();
    await eventosController.trazer_favoritos();
   
    setState(() {
      _isLoading = false; // Altera o estado de carregamento quando os eventos são carregados
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventosController = Provider.of<ControllerEventos>(context);
    final usrForm = Provider.of<UsuarioModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('$nome_usuario', style: const TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false, // Remove o botão de voltar
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Todos,
                child: Text('Todos', style: TextStyle(color: Colors.black)),
              ),
              const PopupMenuItem(
                value: FilterOptions.MeusEventos,
                child: Text('Meus Eventos', style: TextStyle(color: Colors.black)),
              ),
              const PopupMenuItem(
                value: FilterOptions.Favoritos,
                child: Text('Favoritos', style: TextStyle(color: Colors.black)),
              ),
              const PopupMenuItem(
                value: FilterOptions.Sair,
                child: Text('Sair', style: TextStyle(color: Colors.black)),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if(selectedValue == FilterOptions.Sair){
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
                            onPressed: sair,
                            child: const Text('Sair'),
                          ),
                        ],
                      );
                    },
                  );
              } else {
                setState(() {
                  filtro = selectedValue;
                });
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: _isLoading 
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Observer(builder: (_) {
                        var eventos = eventosController.eventos;

                        if(filtro == FilterOptions.Favoritos){
                          eventos = eventosController.favoritos;
                        } else if (filtro == FilterOptions.MeusEventos){
                          eventos = eventosController.meus_eventos;
                        }

                        return eventos.isEmpty
                            ? const Text('Nenhum evento encontrado', style: TextStyle(color: Colors.white),)
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(8),
                                itemCount: eventos.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return cardEvento(
                                    context: context,
                                    evento: eventos[index],
                                    meus_eventos: filtro == FilterOptions.MeusEventos,
                                  );
                                },
                              );
                      }),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
