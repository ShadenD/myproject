import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/PaymentController.dart';

class PaymentView extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  'assets/images/credit.jpg', // Replace with your card image asset
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                        text: controller.cardNumber.value),
                    onChanged: controller.updateCardNumber,
                  )),
              SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: InputDecoration(
                      labelText: 'Expire Date',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                        text: controller.expireDate.value),
                    onChanged: controller.updateExpireDate,
                  )),
              SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    controller:
                        TextEditingController(text: controller.cvv.value),
                    onChanged: controller.updateCvv,
                  )),
              SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: InputDecoration(
                      labelText: 'Name on Card',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                        text: controller.cardHolderName.value),
                    onChanged: controller.updateCardHolderName,
                  )),
              SizedBox(height: 20),
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.saveCard.value,
                        onChanged: controller.toggleSaveCard,
                      ),
                      Text('Save this card'),
                    ],
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle payment logic
                  Get.snackbar('Payment', 'Processing payment...');

                  // Add payment to history and remove from ongoing
                  var cardDetails = {
                    'cardNumber': controller.cardNumber.value,
                    'expireDate': controller.expireDate.value,
                    'cvv': controller.cvv.value,
                    'cardHolderName': controller.cardHolderName.value,
                  };
                  controller.addProcessedPayment(cardDetails);
                  controller
                      .removeOngoingCard(0); // Assuming one card at a time
                  Future.delayed(Duration(seconds: 1), () {
                    Get.find<PaymentController>().moveToHistory();
                  });
                },
                child: Text('Payment'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
