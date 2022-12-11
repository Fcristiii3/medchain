import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medchain/api/location_api.dart';
import 'package:medchain/components/map_component.dart';

import '../models/product_model.dart';


class PharmacyDetails extends StatefulWidget {
  const PharmacyDetails({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<PharmacyDetails> createState() => _PharmacyDetailsState();
}

class _PharmacyDetailsState extends State<PharmacyDetails> {
  List<Product> products = [];
  int nrItems = 0;
  String address = "";

  Future<void> getPlace(LatLng position) async {
  final coordinates = new Coordinates(position.latitude, position.longitude);
  var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = address.first;
  print(first);
  }

  convertToAddress(double lat, double long) async {
    String apiKey = "AIzaSyBShIuAwooFMeK4jZ2--APZzpCjgyKgo34";
    Dio dio = Dio();  //initilize dio package
    String apiurl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apiKey";

    Response response = await dio.get(apiurl); //send get request to API URL

    if(response.statusCode == 200){ //if connection is successful
      Map data = response.data; //get response data
      if(data["status"] == "OK"){ //if status is "OK" returned from REST API
        if(data["results"].length > 0){ //if there is atleast one address
          Map firstresult = data["results"][0]; //select the first address

          address = firstresult["formatted_address"]; //get the address

          //you can use the JSON data to get address in your own format

          setState(() {
            //refresh UI
          });
        }
      }else{
        print(data["error_message"]);
      }
    }else{
      print("error while fetching geoconding data");
    }
  }

  @override
  void initState() {
    convertToAddress(widget.product.positionX!, widget.product.positionX!);
    // TODO: implement
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: MapComponent(pos: LatLng(widget.product.positionX!, widget.product.positionY!))),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Text(
                        widget.product.name!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${widget.product.price} RON',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F9866)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        color: Colors.white,
                        width: 312,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              "Adresa",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Strada Nicolaie Titulescu, nr.34",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF676768)),
                            ),
                            Text(
                              "Cluj-Napoca, Cluj",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF676768)),
                            ),
                            Text(
                              "400618",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF676768)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: 312,
                      height: 75,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Program",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "L-V: 08:00 - 22:00",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF676768)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDFE0E3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                //color: Colors.white,
                height: 48,
                width: 48,
                child: const Icon(Icons.remove, color: Color(0xFF31B77F)),
              ),
                onTap: () async {
                  //getPlace(widget.product.pharmacy.position);
                    setState(() {
                      nrItems-=1;
                    });
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDFE0E3)),
                  borderRadius: BorderRadius.circular(8),
                ),

                //color: Colors.white,
                height: 48,
                width: 48,
                child: Center(
                    child: Text('$nrItems',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))),
              ),
              GestureDetector(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDFE0E3)),
                  borderRadius: BorderRadius.circular(8),
                ),

                //color: Colors.white,
                height: 48,
                width: 48,
                child: const Icon(Icons.add, color: Color(0xFF31B77F)),
              ),
                onTap: () {
                  setState(() {
                    nrItems+=1;
                  });
                },
              ),
              GestureDetector(
                  child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF31B77F),
                  borderRadius: BorderRadius.circular(8),
                ),

                //color: Colors.white,
                height: 48,
                width: 139,
                child: const Center(
                    child: Text("Adauga in cos",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white))),
              ),
              onTap: () {

              }
              ),
            ],
          ),
          const SizedBox(height: 29),
        ],
      )
    );
  }
}
