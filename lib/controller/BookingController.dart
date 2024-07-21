// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:my_project/core/data/model/Booking.dart';

class BookingController extends GetxController {
  var bookings = <Booking>[].obs;

  void addBooking(Booking booking) {
    bookings.add(booking);
  }

  @override
  void onInit() {
    super.onInit();
  }

  // void fetchBookings() {
  //   var fetchedBookings = [
  //     Booking(
  //       stationName: 'Ola charging station',
  //       date: '6 Oct, 2022',
  //       time: '10.00AM',
  //       address: 'B 420 Broome station, New york, NY 100013, USA',
  //       imageUrl: 'assets/images/ola_station.png',
  //     ),
  //     Booking(
  //       stationName: 'Hp charging station',
  //       date: '10 Oct, 2022',
  //       time: '8.00AM',
  //       address: 'B 420 Broome station, New york, NY 100013, USA',
  //       imageUrl: 'assets/images/hp_station.png',
  //     ),
  //   ];

  //   bookings.assignAll(fetchedBookings);
  // }
}
