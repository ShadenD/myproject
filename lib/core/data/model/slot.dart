import 'package:flutter/material.dart';

class slot {
  String vehicleType;
  String vehicleModel;
  String connectionType;
  DateTime date;
  TimeOfDay time;
  double price;

  slot({
    required this.vehicleType,
    required this.vehicleModel,
    required this.connectionType,
    required this.date,
    required this.time,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'vehicleType': vehicleType,
      'vehicleModel': vehicleModel,
      'connectionType': connectionType,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
      'price': price,
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
      price: json['price'],
    );
  }
}
