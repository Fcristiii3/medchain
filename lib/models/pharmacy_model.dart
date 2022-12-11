import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Pharmacy {

  final int id;
  final String name;
  final LatLng position;
  final String url;

  Pharmacy({required this.id, required this.name, required this.position, required this.url});
}