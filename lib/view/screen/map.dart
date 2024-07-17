import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';
import 'package:my_project/controller/NavigationController%20.dart';

import 'package:my_project/view/screen/ProfileScreen.dart';

class Map1 extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final MapController mapController = Get.put(MapController());
  Map1({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IndexedStack(
        index: navigationController.selectedIndex.value,
        children: [
          Stack(
            children: [
              GoogleMap(
                onMapCreated: mapController.onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 14.0,
                ),
                // ignore: invalid_use_of_protected_member
                markers: mapController.markers.value,
              ),
              Positioned(
                top: 10.0,
                left: 15.0,
                right: 15.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search location',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Center(child: Text('En route')),
          const Center(child: Text('Favourite')),
          ProfileScreen(),
        ],
      );
    });
  }
}
