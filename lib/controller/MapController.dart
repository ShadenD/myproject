import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';
import 'package:my_project/core/data/model/NotificationModel.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart'; // Import the badge package

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
  var notifications = <NotificationModel>[].obs;
  var unreadNotificationCount = 0.obs; // Track unread notifications

  @override
  void onInit() {
    super.onInit();
    loadMarkers();
    // Initialize badge count
    FlutterAppBadger.updateBadgeCount(unreadNotificationCount.value);
  }

  void addNotification(String message) {
    notifications.add(NotificationModel(
      message: message,
      timestamp: DateTime.now(),
    ));
    unreadNotificationCount.value = notifications.length;
    FlutterAppBadger.updateBadgeCount(unreadNotificationCount.value);
  }

  void markAllNotificationsAsRead() {
    unreadNotificationCount.value = 0;
    FlutterAppBadger.removeBadge();
  }

  void toggleFavorite(ChargingStation station) {
    station.isFavorite = !station.isFavorite;
    if (station.isFavorite) {
      favoriteStations.add(station);
      addNotification("Added ${station.name} to favorites");
    } else {
      favoriteStations.remove(station);
      addNotification("Removed ${station.name} from favorites");
    }
    chargingStations.refresh();
    favoriteStations.refresh();
  }

  void selectStation(ChargingStation station) {
    selectedStation.value = station;
    addNotification("Selected ${station.name}");
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

  void changeIndex(int index) {
    selectedIndex.value = index;
    print(selectedIndex.value);
  }
}
