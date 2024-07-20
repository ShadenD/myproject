// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';
import 'package:my_project/view/widget/ChargingStationCard.dart';
import 'package:my_project/view/widget/SearchBar.dart';

class Map1 extends StatelessWidget {
  final MapController controller = Get.put(MapController());

  Map1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.77483, -122.41942), // Centered at San Francisco
              zoom: 12,
            ),
            markers: _createMarkers(),
            onTap: (LatLng position) {
              controller.clearSelection();
            },
          ),
          const Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: SearchBar1(),
          ),
          Obx(() {
            return controller.selectedStation.value != null
                ? Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: ChargingStationCard(
                      station: controller.selectedStation.value!,
                    ),
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(37.77483, -122.41942),
        infoWindow: const InfoWindow(title: 'Broome Charging Station'),
        onTap: () {
          controller.selectStation(ChargingStation(
            name: 'Broome charging station',
            address: '420 Broome St, New York, NY 10013',
            distance: 2.5,
            rating: 4.5,
            location: const LatLng(37.77483, -122.41942),
          ));
        },
      ),
      // Add more markers here if needed
    };
  }
}
