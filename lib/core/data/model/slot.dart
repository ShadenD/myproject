import 'package:flutter/material.dart';

class slot {
  final String vehicleType;
  final String vehicleModel;
  final String connectionType;
  final DateTime date;
  final TimeOfDay time;
  final double price;

  slot({
    required this.vehicleType,
    required this.vehicleModel,
    required this.connectionType,
    required this.date,
    required this.time,
    required this.price,
  });
}
