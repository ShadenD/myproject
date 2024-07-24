import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/PaymentController.dart';

class HistoryView extends StatelessWidget {
  final PaymentController controller = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.processedPayments.length,
            itemBuilder: (context, index) {
              final payment = controller.processedPayments[index];
              return ListTile(
                title: Text(payment['cardHolderName'] ?? ''),
                subtitle: Text(
                    'Card: ${payment['cardNumber']}\nExpire: ${payment['expireDate']}'),
              );
            },
          )),
    );
  }
}
