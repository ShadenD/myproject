import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/detialsController.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';

class ChargingStationDetailPage extends StatelessWidget {
  final ChargingStation station;
  final Detialscontroller controller = Get.find<Detialscontroller>();

  ChargingStationDetailPage({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(station.name),
        actions: [
          Obx(() {
            bool isFavorite = controller.favoriteStations.contains(station);
            return IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                controller.toggleFavorite(station);
              },
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(station.imageUrl, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(station.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Text(station.address),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const Text(' 24/7h', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 10),
                  const Icon(Icons.electric_car, size: 16),
                  Text(' ${station.distance} km',
                      style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 10),
                  const Icon(Icons.star, size: 16),
                  Text(' ${station.rating}',
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
              // Add other sections like Amenities, Connection type, Reviews, etc.
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Book slot'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Get direction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
