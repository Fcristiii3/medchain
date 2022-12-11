import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationApi {
  final LatLng position;
  LocationApi({required this.position});
  Future<void> getAddressFromLatLng(Placemark place) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      place = placemarks[0];
    });
  }
}
