import 'package:get/get.dart';

class ChargingStation {
  final int id;
  final String name;
  final String address;
  final String hours;
  final double distance;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String connectionTypes; // Changed to a list of ConnectionType
  final String vehicleType;
  final String speed;
  bool isFavorite;
  final double rating;

  var rating1 = 0.0.obs;

  ChargingStation({
    required this.id,
    required this.name,
    required this.address,
    required this.hours,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.imageUrl,
    required this.connectionTypes,
    required this.vehicleType,
    required this.speed,
    this.isFavorite = false,
  }) {
    rating1.value = rating;
  }
}

class ConnectionType {
  final String type;
  final String power;
  final String price;
  final int taken;
  final int total;

  ConnectionType({
    required this.type,
    required this.power,
    required this.price,
    required this.taken,
    required this.total,
  });
}
