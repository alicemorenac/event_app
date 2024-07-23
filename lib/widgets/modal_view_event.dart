import 'package:event_app/models/evento_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void modalVisualizarEvento(BuildContext context, EventoModel evento) {
  GoogleMapController? _controller;
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
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child:      Padding(
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
                        target: LatLng(double.parse(evento.latitude!), double.parse(evento.longitude!)),
                        zoom: 14.0,
                      ),
                      zoomControlsEnabled: false,
                      scrollGesturesEnabled: false,
                      // onTap: (argument){
                      //    Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MapScreen(onLocationPicked: onLocationPicked, initialLocation: _latLng)),
                      // );
                      // } ,
                      onMapCreated: (controller) {
                        _controller = controller;
                        LatLng ll = LatLng(double.parse(evento.latitude!), double.parse(evento.longitude!));
                        _controller!.animateCamera(
                          CameraUpdate.newLatLng(ll),
                        );
                      },
                                    tiltGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                      myLocationButtonEnabled: false,
                      markers: {
                        Marker(
                          markerId: const MarkerId('marker'),
                          position: LatLng(double.parse(evento.latitude!), double.parse(evento.longitude!)),
                        ),
                      },
                    ),
                  ),
                ),
              )),
            
              
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
