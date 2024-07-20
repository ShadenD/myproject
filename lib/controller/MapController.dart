// controllers/map_controller.dart

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var markers = <Marker>{}.obs;
  var isMapCreated = false.obs;
  GoogleMapController? googleMapController;
  var selectedIndex = 0.obs;
  var selectedStation = Rxn<ChargingStation>();
  var selectedDistance = 1.obs;
  var selectedConnectionType = ''.obs;
  var selectedVehicleType = ''.obs;
  var selectedSpeed = ''.obs;

  void setSelectedDistance(int distance) {
    selectedDistance.value = distance;
  }

  void setSelectedConnectionType(String type) {
    selectedConnectionType.value = type;
  }

  void setSelectedVehicleType(String type) {
    selectedVehicleType.value = type;
  }

  void setSelectedSpeed(String speed) {
    selectedSpeed.value = speed;
  }

  void selectStation(ChargingStation station) {
    selectedStation.value = station;
  }

  void clearSelection() {
    selectedStation.value = null;
  }

  @override
  void onInit() {
    super.onInit();
    loadMarkers();
  }

  void loadMarkers() {
    markers.addAll([
      const Marker(
        markerId: MarkerId('charging_station_1'),
        position: LatLng(37.7749, -122.4194),
        infoWindow: InfoWindow(title: 'Charging Station 1'),
      ),
      const Marker(
        markerId: MarkerId('charging_station_2'),
        position: LatLng(37.7849, -122.4094),
        infoWindow: InfoWindow(title: 'Charging Station 2'),
      ),
    ]);
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    isMapCreated.value = true;
  }

  void addMarker(LatLng position, String title) {
    final marker = Marker(
      markerId: MarkerId(title),
      position: position,
      infoWindow: InfoWindow(title: title),
    );
    markers.add(marker);
  }

  changeIndex(int index) {
    selectedIndex.value = index;
    print(selectedIndex.value);
  }
}

class ChargingStation {
  final String name;
  final String address;
  final double distance;
  final double rating;
  final LatLng location;

  ChargingStation({
    required this.name,
    required this.address,
    required this.distance,
    required this.rating,
    required this.location,
  });
}
