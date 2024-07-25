import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/BookingController.dart';
import 'package:my_project/controller/PaymentController.dart';
import 'package:my_project/core/data/model/slot.dart';
import 'package:my_project/view/screen/BookingPage.dart';
import 'package:my_project/view/screen/PaymentNow.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatelessWidget {
  final slot slot2;
  final int cardIndex;

  PaymentPage({
    required this.slot2,
    required this.cardIndex,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final timeFormat = DateFormat('HH:mm');

    // Helper function to convert TimeOfDay to DateTime
    DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) {
      final now = DateTime.now();
      return DateTime(
          now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Book slot'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/car1.jpeg', // Replace with your image asset path
                fit: BoxFit.cover,
                height: 200, // Adjust height as needed
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slot2.vehicleType,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(slot2.vehicleModel),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slot2.vehicleModel,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${slot2.vehicleType}'),
                  SizedBox(height: 8),
                  Text('Date: ${dateFormat.format(slot2.date.toLocal())}'),
                  Text(
                      'Slot time: ${timeFormat.format(timeOfDayToDateTime(slot2.time))}'),
                  Text('Connection type: ${slot2.connectionType}'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total pay: \$${slot2.totalCost}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PaymentView(
                      cardIndex: cardIndex,
                    ));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Make payment'),
            ),
          ],
        ),
      ),
    );
  }
}
