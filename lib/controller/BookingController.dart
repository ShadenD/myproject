// ignore_for_file: avoid_types_as_parameter_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_project/core/data/model/slot.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingController extends GetxController {
  var selectedVehicleType = ''.obs;
  var selectedVehicleModel = ''.obs;
  var selectedConnectionType = ''.obs;
  var selectedDate = ''.obs;
  var selectedTime = TimeOfDay.now().obs;

  var slots = <slot>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSlots();
  }

  String get formattedTime =>
      '${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')}';

  void updateVehicleType(String type) {
    selectedVehicleType.value = type;
  }

  void updateVehicleModel(String model) {
    selectedVehicleModel.value = model;
  }

  void updateConnectionType(String type) {
    selectedConnectionType.value = type;
  }

  void updateDate(String date) {
    selectedDate.value = date;
  }

  void updateTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  void addSlot(double price) {
    try {
      DateTime parsedDate = DateTime.parse(selectedDate.value);
      final slot1 = slot(
        vehicleType: selectedVehicleType.value,
        vehicleModel: selectedVehicleModel.value,
        connectionType: selectedConnectionType.value,
        date: parsedDate,
        time: selectedTime.value,
        price: price,
      );
      print(
          "Adding Slot: ${slot1.vehicleType}, ${slot1.vehicleModel}, ${slot1.connectionType}, ${slot1.date}, ${slot1.time.format(Get.context!)}, ${slot1.price}");
      slots.add(slot1);
      saveSlots(); // Save slots to local storage
      print("Current Slots Length: ${slots.length}");
    } catch (e) {
      print("Error adding slot: $e");
    }
  }

  void saveSlots() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> slotList =
        slots.map((slot) => jsonEncode(slot.toJson())).toList();
    await prefs.setStringList('slots', slotList);
  }

  void loadSlots() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> slotList = prefs.getStringList('slots') ?? [];

    // Convert the JSON strings into Slot objects
    slots.value = slotList
        .map((jsonString) => slot.fromJson(jsonDecode(jsonString)))
        .toList();
  }

  void cancelSlot(int index) {
    slots.removeAt(index);
    saveSlots();
  }
}
