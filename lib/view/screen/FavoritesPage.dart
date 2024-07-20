import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';
import 'package:my_project/view/screen/ChargingStationDetailPage.dart';

class FavoritePage extends StatelessWidget {
  final MapController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Stations'),
      ),
      body: Obx(() {
        return controller.favoriteStations.isEmpty
            ? Center(
                child: Text(
                  'Favorites are empty',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : ListView.builder(
                itemCount: controller.favoriteStations.length,
                itemBuilder: (context, index) {
                  final station = controller.favoriteStations[index];
                  return Dismissible(
                    key: Key(station.name),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      controller.toggleFavorite(station);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("${station.name} removed from favorites"),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Card(
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
                        trailing: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onTap: () {
                          Get.to(() =>
                              ChargingStationDetailPage(station: station));
                        },
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
