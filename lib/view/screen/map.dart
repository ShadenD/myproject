// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';
import 'package:my_project/controller/detialsController.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';
import 'package:my_project/view/screen/ChargingStationDetailPage.dart';
import 'package:my_project/view/widget/ChargingStationCard.dart';
import 'package:my_project/view/widget/SearchBar.dart';

class Map1 extends StatelessWidget {
  final MapController controller = Get.put(MapController());
  final Detialscontroller detialscontroller = Get.put(Detialscontroller());

  Map1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar1(),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.chargingStations.length,
                itemBuilder: (context, index) {
                  final station = controller.chargingStations[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        station.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(station.name),
                      subtitle: Text(
                          '${station.address}\n${station.hours}\n${station.distance} km\nRating: ${station.rating}'),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: Icon(
                          station.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: station.isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          controller.toggleFavorite(station);
                        },
                      ),
                      onTap: () {
                        Get.to(
                            () => ChargingStationDetailPage(station: station));
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return controller.selectedStation.value != null
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
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
          controller.selectStation(
            ChargingStation(
              name: "Broome Charging Station",
              address: "420 Broome St, New York, NY 100013",
              hours: "24/7",
              distance: 2.5,
              rating: 4.5,
              latitude: 40.721786,
              longitude: -74.000721,
              imageUrl: 'assets/images/car1.jpeg',
            ),
          );
        },
      ),
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(37.77483, -122.41942),
        infoWindow: const InfoWindow(title: 'Broome Charging Station'),
        onTap: () {
          controller.selectStation(
            ChargingStation(
              name: "Broome Charging Station",
              address: "420 Broome St, New York, NY 100013",
              hours: "24/7",
              distance: 2.5,
              rating: 4.5,
              latitude: 40.721786,
              longitude: -74.000721,
              imageUrl: 'assets/images/car1.jpeg',
            ),
          );
        },
      ),
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(37.77483, -122.41942),
        infoWindow: const InfoWindow(title: 'Broome Charging Station'),
        onTap: () {
          controller.selectStation(
            ChargingStation(
              name: "Broome Charging Station",
              address: "420 Broome St, New York, NY 100013",
              hours: "24/7",
              distance: 2.5,
              rating: 4.5,
              latitude: 40.721786,
              longitude: -74.000721,
              imageUrl: 'assets/images/car1.jpeg',
            ),
          );
        },
      ),
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(37.77483, -122.41942),
        infoWindow: const InfoWindow(title: 'Broome Charging Station'),
        onTap: () {
          controller.selectStation(
            ChargingStation(
              name: "Broome Charging Station",
              address: "420 Broome St, New York, NY 100013",
              hours: "24/7",
              distance: 2.5,
              rating: 4.5,
              latitude: 40.721786,
              longitude: -74.000721,
              imageUrl: 'assets/images/car1.jpeg',
            ),
          );
        },
      ),
      // Add more markers here if needed
    };
  }
}
