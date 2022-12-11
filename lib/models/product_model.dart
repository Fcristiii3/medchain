import 'package:flutter/material.dart';

class Product {
  int? pharmacyId;
  String? name;
  String? schedule;
  double? positionX;
  double? positionY;
  String? drugName;
  int? price;

  Product(
      {this.pharmacyId,
        this.name,
        this.schedule,
        this.positionX,
        this.positionY,
        this.drugName,
        this.price});

  Product.fromJson(Map<String, dynamic> json) {
    pharmacyId = json['pharmacyId'];
    name = json['name'];
    positionX = json['positionX'];
    positionY = json['positionY'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacyId'] = this.pharmacyId;
    data['name'] = this.name;
    data['schedule'] = this.schedule;
    data['positionX'] = this.positionX;
    data['positionY'] = this.positionY;
    data['drugName'] = this.drugName;
    data['price'] = this.price;
    return data;
  }
}