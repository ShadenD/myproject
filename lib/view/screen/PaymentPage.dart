import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/data/model/slot.dart';
import 'package:my_project/view/screen/PaymentNow.dart';

class PaymentPage extends StatelessWidget {
  final slot slot2;

  PaymentPage({required this.slot2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicle Type: ${slot2.vehicleType}"),
            Text("Vehicle Model: ${slot2.vehicleModel}"),
            Text("Connection Type: ${slot2.connectionType}"),
            Text("Date: ${slot2.date.toLocal()}".split(' ')[0]),
            Text("Time: ${slot2.time.format(context)}"),
            Text("Price: \$${slot2.price}"),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PaymentView());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
