import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/pharmacy_model.dart';
import '../models/product_model.dart';

class ProductApi{
  void getProducts(List<Product> products) {

    final LatLng pos=const LatLng(46.783843,23.588349);

    // Pharmacy catena = Pharmacy(id: 1, name: 'Catena', position: pos, url: 'https://www.prolex.ro/wp-content/uploads/2019/02/catena-logo.png');
    // products.add(Product(1, "Paracetamol", 12, catena));
    // products.add(Product(2, "Insulina", 12, catena));
    // products.add(Product(3, "Nurofen", 12, catena));
    // products.add(Product(4, "Streptsis", 12, catena));
    // products.add(Product(5, "Codeina", 12, catena));
  }
}