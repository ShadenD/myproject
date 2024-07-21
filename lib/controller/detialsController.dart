import 'package:get/get.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';

class Detialscontroller extends GetxController {
  var selectedStation = Rxn<ChargingStation>();
  var favoriteStations = <ChargingStation>[].obs;
  var rating = 0.0.obs;

  void updateRating(double newRating) {
    rating.value = newRating;
  }

  void selectStation(ChargingStation station) {
    selectedStation.value = station;
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
