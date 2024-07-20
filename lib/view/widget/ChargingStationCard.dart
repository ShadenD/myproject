import 'package:flutter/material.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';

class ChargingStationCard extends StatelessWidget {
  final ChargingStation station;

  const ChargingStationCard({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network('https://via.placeholder.com/50',
                  width: 50, height: 50),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(station.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
                ],
              )),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text('Get direction'),
          ),
        ],
      ),
    );
  }
}
