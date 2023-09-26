
import 'package:flutter/material.dart';

class Parfum {
  final String id;
  final String title;
  final String perfumer;
  final String description;
  final String gender;
  final String price;
  final String year;

  Parfum({
    required this.id,
    required this.title,
    required this.perfumer,
    required this.description,
    required this.gender,
    required this.price,
    required this.year
  });
}