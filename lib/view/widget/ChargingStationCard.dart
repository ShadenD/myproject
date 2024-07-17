// widgets/charging_station_card.dart

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChargingStationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network('https://example.com/charging_station_image.jpg'),
          const SizedBox(height: 8.0),
          const Text(
            'Broome charging station',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          const Text('420 Broome charging station, New York, NY 100013'),
          const SizedBox(height: 4.0),
          const Text('Open 24/7h'),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('2.5 km'),
              const Text('4.5 ⭐'),
              ElevatedButton(
                onPressed: () {
                  // Handle get direction
                },
                child: const Text('Get direction'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
