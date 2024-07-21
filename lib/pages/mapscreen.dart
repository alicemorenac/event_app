import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final Function(LatLng) onLocationPicked;
  final LatLng ? initialLocation;

  const MapScreen({super.key, required this.onLocationPicked, this.initialLocation});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

 GoogleMapController? _controller;
 LatLng? _pickedLocation;

  @override
  void initState() {
    super.initState();
    _pickedLocation = widget.initialLocation ?? const LatLng(37.77483, -122.41942); // Valor padrão
  }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Pick Location'),
      // ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:  LatLng(_pickedLocation!.latitude, _pickedLocation!.longitude),
          zoom: 14,
        ),
        onMapCreated: (controller) {
          _controller = controller;
        },
        onTap:  (location) {
          setState(() {
            _pickedLocation = location;
          });
          widget.onLocationPicked(location);
        },
        markers: _pickedLocation == null
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('picked-location'),
                  position: _pickedLocation!,
                ),
              },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          if (widget.initialLocation != null) {
            Navigator.pop(context, _pickedLocation);
          }
        },
      ),
    );
  }
}