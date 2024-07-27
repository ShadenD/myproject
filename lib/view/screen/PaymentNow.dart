import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/BookingController.dart';
import 'package:my_project/controller/PaymentController.dart';
import 'package:my_project/view/screen/BookingPage.dart';

class PaymentView extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());
  final int cardIndex;

  PaymentView({super.key, required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  'assets/images/credit.jpg', // Replace with your card image asset
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                        text: controller.cardNumber.value),
                    onChanged: controller.updateCardNumber,
                  )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: const InputDecoration(
                      labelText: 'Expire Date',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                        text: controller.expireDate.value),
                    onChanged: controller.updateExpireDate,
                  )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    controller:
                        TextEditingController(text: controller.cvv.value),
                    onChanged: controller.updateCvv,
                  )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name on Card',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                        text: controller.cardHolderName.value),
                    onChanged: controller.updateCardHolderName,
                  )),
              const SizedBox(height: 20),
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.saveCard.value,
                        onChanged: controller.toggleSaveCard,
                      ),
                      const Text('Save this card'),
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
                  Get.snackbar('Payment', 'Processing payment...');
                  Get.find<BookingController>().moveCardToHistory(cardIndex);

                  Get.to(() => BookingPage());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
