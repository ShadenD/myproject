import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/BookingController.dart';
import 'package:my_project/core/data/model/Booking.dart';

class BookingPage extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My booking'),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'Ongoing booking'),
              Tab(text: 'Booking history'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(
              () => bookingController.bookings.isEmpty
                  ? Center(child: Text('No ongoing bookings'))
                  : ListView.builder(
                      itemCount: bookingController.bookings.length,
                      itemBuilder: (context, index) {
                        Booking booking = bookingController.bookings[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.asset(booking.imageUrl),
                            title: Text(booking.stationName),
                            subtitle: Text(
                                '${booking.date} at ${booking.time}\n${booking.address}'),
                            trailing: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Go detail'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Cancel slot'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const Center(child: Text('Booking history')),
          ],
        ),
      ),
    );
  }
}
