import 'dart:convert';
import 'package:flutter/material.dart';

class slot {
  String vehicleType;
  String vehicleModel;
  String connectionType;
  DateTime date;
  TimeOfDay time;
  double price;
  String imageUrl;
  double chargingAmount;
  double totalCost;
  double battery;

  slot({
    required this.vehicleType,
    required this.vehicleModel,
    required this.connectionType,
    required this.date,
    required this.time,
    required this.price,
    required this.totalCost,
    required this.imageUrl,
    required this.battery,
    required this.chargingAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      'vehicleType': vehicleType,
      'vehicleModel': vehicleModel,
      'connectionType': connectionType,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
      'price': price,
      'totalCost': totalCost,
      'battery': battery,
      'imageUrl': imageUrl,
      'chargingAmount': chargingAmount,
    };
  }

  static slot fromJson(Map<String, dynamic> json) {
    return slot(
      vehicleType: json['vehicleType'],
      vehicleModel: json['vehicleModel'],
      connectionType: json['connectionType'],
      date: DateTime.parse(json['date']),
      time: TimeOfDay(
        hour: int.parse(json['time'].split(':')[0]),
        minute: int.parse(json['time'].split(':')[1]),
      ),
      battery: (json['battery'] ?? 0.0).toDouble(),
      price: (json['price'] ?? 0.0).toDouble(),
      totalCost: (json['totalCost'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      chargingAmount: (json['chargingAmount'] ?? 0.0).toDouble(),
    );
  }
}
