// controllers/map_controller.dart

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';

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
  var favoriteStations = <ChargingStation>[].obs;

  void toggleFavorite(ChargingStation station) {
    station.isFavorite = !station.isFavorite;
    if (station.isFavorite) {
      favoriteStations.add(station);
    } else {
      favoriteStations.remove(station);
    }
    chargingStations.refresh();
    favoriteStations.refresh();
  }

  void selectStation(ChargingStation station) {
    selectedStation.value = station;
  }

  var chargingStations = <ChargingStation>[
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
    // Add more charging stations here with their respective coordinates
  ].obs;

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
