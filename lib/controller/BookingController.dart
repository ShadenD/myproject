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
  var selectedBattery = 0.0.obs;
  var selectedPricePerKw = 0.0.obs;
  var selectedTotalCost = 0.0.obs;
  var price2 = 0.0;
  var chargingAmount = 0.0.obs;
  var slots = <slot>[].obs;
  var history = <slot>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSlots();
  }

  String get formattedChargingAmount => chargingAmount.value.toStringAsFixed(2);

  String get formattedTime =>
      '${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')}';

  void setChargingAmount(double amount) {
    chargingAmount.value = amount;
  }

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

  void addSlot(double price1) {
    try {
      DateTime parsedDate = DateTime.parse(selectedDate.value);
      selectedTotalCost.value = price1 * chargingAmount.value;
      final slot1 = slot(
        vehicleType: selectedVehicleType.value,
        vehicleModel: selectedVehicleModel.value,
        connectionType: selectedConnectionType.value,
        date: parsedDate,
        time: selectedTime.value,
        price: price2,
        totalCost: selectedTotalCost.value,
        battery: selectedBattery.value,
        imageUrl: 'assets/images/car1.jpeg',
        chargingAmount: chargingAmount.value,
      );
      print(
          "Adding Slot: ${slot1.vehicleType}, ${slot1.vehicleModel}, ${slot1.connectionType}, ${slot1.date}, ${slot1.time.format(Get.context!)}, ${slot1.price}");
      slots.add(slot1);
      saveSlots();
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

    List<String> historyList =
        history.map((slot) => jsonEncode(slot.toJson())).toList();
    await prefs.setStringList('history', historyList); // Save history list
  }

  void loadSlots() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> slotList = prefs.getStringList('slots') ?? [];
    List<String> historyList = prefs.getStringList('history') ?? [];

    try {
      slots.value = slotList
          .map((jsonString) => slot.fromJson(jsonDecode(jsonString)))
          .toList();
      history.value = historyList
          .map((jsonString) => slot.fromJson(jsonDecode(jsonString)))
          .toList();
    } catch (e) {
      print('Error parsing slots: $e');
    }
  }

  void cancelSlot(int index) {
    slots.removeAt(index);
    saveSlots();
  }

  void moveCardToHistory(int index) {
    if (index >= 0 && index < slots.length) {
      final slotToMove = slots[index];
      slots.removeAt(index);
      history.add(slotToMove);
      saveSlots();
    } else {
      print('Index out of range');
    }
  }
}
