import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_project/controller/BookingController.dart';
import 'package:my_project/core/data/model/slot.dart';
import 'package:my_project/view/screen/PaymentPage.dart';

class HistoryView extends StatelessWidget {
  final BookingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.slots.length,
        itemBuilder: (context, index) {
          final slot = controller.slots[index];
          return SlotCard(
            slot1: slot,
            onCancel: () => controller.cancelSlot(index),
            index: index,
          );
        },
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  final slot slot1;
  final int index; // Add index as a parameter

  final VoidCallback onCancel;

  SlotCard({
    required this.slot1,
    required this.onCancel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicle Type: ${slot1.vehicleType}"),
            Text("Vehicle Model: ${slot1.vehicleModel}"),
            Text("Connection Type: ${slot1.connectionType}"),
            Text(
                "Date: ${DateFormat('yyyy-MM-dd').format(slot1.date)}"), // Format the date
            Text("Time: ${slot1.time.format(context)}"),
            Text("Price: \$${slot1.price}"),
            Text("Total Cost: \$${slot1.totalCost}"), // Display total cost
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => PaymentPage(
                          slot2: slot1,
                          cardIndex: index,
                        ));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Make Payment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Cancel Slot'),
                          content: Text(
                              'Are you sure you want to cancel your slot?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                onCancel();
                                Navigator.of(context).pop();
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Cancel Slot'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
