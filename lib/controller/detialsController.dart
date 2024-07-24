import 'package:get/get.dart';
import 'package:my_project/core/data/model/ChargingStation.dart';

class Detialscontroller extends GetxController {
  var selectedStation = Rxn<ChargingStation>();
  var favoriteStations = <ChargingStation>[].obs;
  var rating1 = 0.0.obs;

  void updateRating(double newRating) {
    rating1.value = newRating;
    // Update the rating of the selected station if it exists
    if (selectedStation.value != null) {
      selectedStation.value!.rating = newRating;
      // Update the value to trigger UI updates
      selectedStation.refresh();
    }
  }

  void selectStation(ChargingStation station) {
    selectedStation.value = station;
    rating1.value = station.rating;
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
