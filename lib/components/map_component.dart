
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medchain/api/location_api.dart';
import 'package:url_launcher/url_launcher.dart';

class MapComponent extends StatefulWidget {
  const MapComponent({super.key, required this.pos});

  final LatLng pos;

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  late GoogleMapController mapController;


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.bottomLeft,
      children:[
        GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.pos,
          zoom: 17.0,
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(bottom: 7, left: 7),
          child: FloatingActionButton.extended(
            backgroundColor: Color(0xFF31B77F),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  icon: Icon(Icons.map),
                  label: Text('Deschide hartă'),
              onPressed: () {
                _launchURLBrowser(widget.pos);
              }
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top:40, left: 7),
            child: IconButton(
              icon: Icon(Icons.arrow_back_outlined,size: 30,color: Color(0xFF666666)),
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
          ),
        ),
      ]
    );
  }
}

_launchURLBrowser(LatLng position) async {
  String url = 'https://www.google.com/maps/search/?api=1&query=${position.latitude}%2C${position.latitude}';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}