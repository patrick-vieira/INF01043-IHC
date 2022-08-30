import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.shop,
    required this.address,
    required this.lastDate,
  });

  final int id;
  final String name;
  final String type;
  final double price;
  final String shop;
  final String address;
  final DateTime lastDate;
}
