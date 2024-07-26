import 'dart:io';

import 'package:event_app/controllers/controller_eventos.dart';
import 'package:event_app/models/evento_model.dart';
import 'package:event_app/pages/mapscreen.dart';
import 'package:event_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ModalNewEvento extends StatefulWidget {
  final EventoModel? eventoModel;

  const ModalNewEvento({Key? key, this.eventoModel}) : super(key: key);

  @override
  _ModalNewEventoState createState() => _ModalNewEventoState();
}

class _ModalNewEventoState extends State<ModalNewEvento> {
  final imagePicker = ImagePicker();
  XFile? xfile;
  File? file;
  late LatLng _latLng = LatLng(
      widget.eventoModel != null && widget.eventoModel!.latitude != null
          ? double.parse(widget.eventoModel!.latitude.toString())
          : -5.801411,
      widget.eventoModel != null && widget.eventoModel!.longitude != null
          ? double.parse(widget.eventoModel!.longitude.toString())
          : -35.3046081);

  late EventoModel evento;
  GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
    evento = widget.eventoModel != null
        ? EventoModel(
            id: widget.eventoModel!.id,
            nomeEvento: widget.eventoModel!.nomeEvento,
            descricaoEvento: widget.eventoModel!.descricaoEvento,
            longitude: widget.eventoModel!.longitude,
            latitude: widget.eventoModel!.latitude,
            dataEvento: widget.eventoModel!.dataEvento ?? DateTime.now(),
          )
        : EventoModel();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller != null) {
        _controller!.animateCamera(
          CameraUpdate.newLatLng(_latLng),
        );
      }
    });
  }

  pick(ImageSource src) async {
    final pickedFile = await imagePicker.pickImage(source: src);
    setState(() {
      xfile = pickedFile;
      file = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  onLocationPicked(LatLng latLng) {
    setState(() {
      _latLng = latLng;
      if (latLng != null) {
        _controller!.animateCamera(
          CameraUpdate.newLatLng(latLng!),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final listaEventos = Provider.of<ControllerEventos>(context, listen: false);

    return ChangeNotifierProvider.value(
      value: evento,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(10),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: file == null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black,
                          backgroundImage: widget.eventoModel != null &&
                                  widget.eventoModel!.foto != null &&
                                  widget.eventoModel!.foto!.isNotEmpty
                              ? NetworkImage(widget.eventoModel!.foto!)
                                  as ImageProvider<Object>
                              : const AssetImage('assets/evento.png')
                                  as ImageProvider<Object>,
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black,
                          backgroundImage: FileImage(file!),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => pick(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Galeria'),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => pick(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Câmera'),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 20),
                    child: Text('Novo evento',
                        style: TextStyle(color: Colors.white)),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: textField(
                      labelText: "Descrição do evento",
                      onChanged: meuModel.setDescricao,
                      value: meuModel.descricaoEvento,
                      errorText: () => '',
                    ),
                  );
                }),

                // Consumer<EventoModel>(builder: (context, meuModel, child) {
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    height: 150,
                    width: 1500,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _latLng,
                        zoom: 14.0,
                      ),
                      // zoomControlsEnabled: false,
                      // scrollGesturesEnabled: false,
                      onTap: (argument) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapScreen(
                                  onLocationPicked: onLocationPicked,
                                  initialLocation: _latLng)),
                        );
                      },
                      onMapCreated: (controller) {
                        _controller = controller;
                      },
                      // tiltGesturesEnabled: false,
                      // rotateGesturesEnabled: false,
                      // myLocationButtonEnabled: false,
                      markers: {
                        Marker(
                          markerId: const MarkerId('marker'),
                          position: _latLng,
                        ),
                      },
                    ),
                  ),
                ),
                // }),
                Consumer<EventoModel>(builder: (context, meuModel, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
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
                      evento.setLatitude(_latLng.latitude.toString());
                      evento.setLongitude(_latLng.longitude.toString());

                      listaEventos.upsert(evento, file);
                      Navigator.pop(context);
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void modalNewEvento(BuildContext context, EventoModel? eventoModel) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ModalNewEvento(eventoModel: eventoModel);
      });
}
