import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/view/screen/BookingPage.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => BookingPage());
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.blue, size: 100),
            SizedBox(height: 20),
            Text('Successful!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Date: 12 Dec 222'),
            Text('Vehicle: Volvo XC40 recharge'),
            Text('Slot time: 6.00AM'),
            Text('Price: \$0.05/kw'),
            Text(
                'Broome station\nB 420 Broome station,\nNew York, NY 10013, USA',
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
