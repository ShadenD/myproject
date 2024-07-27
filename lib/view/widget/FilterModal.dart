import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';

class FilterModal2 extends StatelessWidget {
  final MapController controller = Get.find<MapController>();

  FilterModal2({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Filter',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text('By distance',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: List.generate(8, (index) {
                        int distance = [
                          500,
                          1000,
                          2000,
                          5000,
                          10000,
                          20000,
                          50000,
                          100000
                        ][index];
                        return Obx(() {
                          return ChoiceChip(
                            label: Text('${distance}M'),
                            selected:
                                controller.selectedDistance.value == distance,
                            onSelected: (bool selected) {
                              controller.setSelectedDistance(distance);
                            },
                            selectedColor: Colors.blue,
                            labelStyle: TextStyle(
                              color:
                                  controller.selectedDistance.value == distance
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          );
                        });
                      }),
                    ),
                    SizedBox(height: 20),
                    Text('Connection type',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: List.generate(6, (index) {
                        String type = [
                          'J-1772',
                          'Tesla',
                          'Mennekes',
                          'CCS2',
                          'Chademo',
                          'CCS'
                        ][index];
                        return Obx(() {
                          return ChoiceChip(
                            label: Text(type),
                            selected:
                                controller.selectedConnectionType.value == type,
                            onSelected: (bool selected) {
                              controller.setSelectedConnectionType(type);
                            },
                            selectedColor: Colors.blue,
                            labelStyle: TextStyle(
                              color: controller.selectedConnectionType.value ==
                                      type
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          );
                        });
                      }),
                    ),
                    SizedBox(height: 20),
                    Text('By vehicle type',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: List.generate(3, (index) {
                        String type =
                            ['2 wheeler', '3 wheeler', '4 wheeler'][index];
                        return Obx(() {
                          return ChoiceChip(
                            label: Text(type),
                            selected:
                                controller.selectedVehicleType.value == type,
                            onSelected: (bool selected) {
                              controller.setSelectedVehicleType(type);
                            },
                            selectedColor: Colors.blue,
                            labelStyle: TextStyle(
                              color:
                                  controller.selectedVehicleType.value == type
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          );
                        });
                      }),
                    ),
                    SizedBox(height: 20),
                    Text('Speed',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: List.generate(4, (index) {
                        String speed = [
                          'Standard (3.7 kw)',
                          'Semi fast (3.7 - 20 kw)',
                          'Fast (20 - 73 kw)',
                          'Ultra fast (>43 kw)'
                        ][index];
                        return Obx(() {
                          return ChoiceChip(
                            label: Text(speed),
                            selected: controller.selectedSpeed.value == speed,
                            onSelected: (bool selected) {
                              controller.setSelectedSpeed(speed);
                            },
                            selectedColor: Colors.blue,
                            labelStyle: TextStyle(
                              color: controller.selectedSpeed.value == speed
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          );
                        });
                      }),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Apply the filters and close the bottom sheet
                        controller.filterStations();
                        Navigator.pop(context); // Close the modal
                      },
                      child: Text('Filter'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
