class ChargingStation {
  final int id;
  final String name;
  final String address;
  final String hours;
  final double distance;
  late final double rating;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String connectionTypes; // Changed to a list of ConnectionType
  final String vehicleType;
  final String speed;
  bool isFavorite;

  ChargingStation({
    required this.id,
    required this.name,
    required this.address,
    required this.hours,
    required this.distance,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.connectionTypes,
    required this.vehicleType,
    required this.speed,
    this.isFavorite = false,
  });
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
