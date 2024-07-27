import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/BookingController.dart';
import 'package:my_project/controller/PaymentController.dart';
import 'package:my_project/view/screen/HistoryView.dart';
import 'package:my_project/view/screen/OngoingBookingsPage.dart';

class BookingPage extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My booking'),
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.blue, // Change the line color to blue
            tabs: [
              Tab(text: 'Ongoing booking'),
              Tab(text: 'Booking history'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(
              () => bookingController.slots.isEmpty
                  ? const Center(child: Text('No ongoing bookings'))
                  : OngoingSlotsPage(),
            ),
            paymentController.processedPayments.isEmpty
                ? const Center(child: Text('Booking history'))
                : HistoryView(),
          ],
        ),
      ),
    );
  }
}
