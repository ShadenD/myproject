// ignore_for_file: avoid_print

import 'package:get/get.dart';

class HelpController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var message = ''.obs;

  void setName(String value) {
    name.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setMessage(String value) {
    message.value = value;
  }

  void submit() {
    // Handle form submission
    print('Name: ${name.value}');
    print('Email: ${email.value}');
    print('Message: ${message.value}');
  }
}
