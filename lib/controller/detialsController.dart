import 'package:get/get.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';

class Detialscontroller extends GetxController {
  var selectedStation = Rxn<ChargingStation>();
  var favoriteStations = <ChargingStation>[].obs;
  var rating1 = 0.0.obs;

  void updateRating(ChargingStation station, double newRating) {
    station.rating1.value = newRating;
  }

  void selectStation(ChargingStation station) {
    selectedStation.value = station;
    rating1.value = station.rating1.value;
  }

  void clearSelection() {
    selectedStation.value = null;
  }

  void toggleFavorite(ChargingStation station) {
    if (favoriteStations.contains(station)) {
      favoriteStations.remove(station);
    } else {
      favoriteStations.add(station);
    }
  }
}
