// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/detialsController.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';
import 'package:my_project/view/screen/BookingSlotePage.dart';

class ChargingStationDetailPage extends StatelessWidget {
  final ChargingStation station;
  final Detialscontroller controller = Get.find<Detialscontroller>();

  ChargingStationDetailPage({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              SizedBox(
                width: screenWidth,
                child: Image.asset(station.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text(
                station.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(station.address),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  Text(' ${station.hours}',
                      style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 10),
                  const Icon(Icons.electric_car, size: 16),
                  Text(
                    ' ${station.distance} km',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.star, size: 16),
                  Text(
                    ' ${station.rating}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildAmenitiesSection(),
              const SizedBox(height: 10),
              _buildConnectionTypeSection(),
              const SizedBox(height: 10),
              _buildReviewSection(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => SlotBookingPage());
                },
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

  Widget _buildAmenitiesSection() {
    List<String> amenities = ["Cafe", "Store", "Park", "Toilet", "Food"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amenities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: amenities.map((amenity) {
            return Column(
              children: [
                const Icon(Icons.circle),
                Text(amenity),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConnectionTypeSection() {
    List<ConnectionType> connectionTypes = [
      ConnectionType(
          type: "CCS2", power: "150kw", price: "\$0.05/kw", taken: 0, total: 2),
      ConnectionType(
          type: "CCS", power: "120kw", price: "\$0.05/kw", taken: 3, total: 3),
      ConnectionType(
          type: "Mennekers",
          power: "22kw",
          price: "\$0.02/kw",
          taken: 0,
          total: 2),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Connection type',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: connectionTypes.map((type) {
            return Container(
              width: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    type.type,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('${type.power} (${type.price})'),
                  const SizedBox(height: 5),
                  Text(
                    '${type.taken}/${type.total} taken',
                    style: TextStyle(
                      color:
                          type.taken == type.total ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Review',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text('Rating'),
            const SizedBox(width: 10),
            Obx(() {
              return Expanded(
                child: Slider(
                  value: station.rating1.value,
                  onChanged: (newValue) {
                    controller.updateRating(station, newValue);
                  },
                  divisions: 10,
                  max: 5,
                  min: 0,
                ),
              );
            }),
            Obx(() {
              return Text('${controller.rating1.value.toStringAsFixed(1)}');
            }),
          ],
        ),
      ],
    );
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
