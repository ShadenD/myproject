class ChargingStation {
  final String name;
  final String address;
  final String hours;
  final double distance;
  final double rating;
  final double latitude;
  final double longitude;
  final String imageUrl;
  bool isFavorite;

  ChargingStation({
    required this.name,
    required this.address,
    required this.hours,
    required this.distance,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
