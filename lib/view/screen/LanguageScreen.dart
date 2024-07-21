// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/localization/changelocal.dart';

class LanguageScreen extends GetView<LocaleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Language'.tr),
      ),
      body: Column(
        children: [
          RadioListTile(
            value: 'English',
            groupValue: Get.locale!.languageCode == 'en' ? 'English' : 'Arabic',
            title: Text('english'.tr),
            onChanged: (value) {
              controller.changeLang("en");
            },
          ),
          RadioListTile(
            value: 'Arabic',
            groupValue: Get.locale!.languageCode == 'ar' ? 'Arabic' : 'English',
            title: Text('arabic'.tr),
            onChanged: (value) {
              controller.changeLang("ar");
            },
          ),
        ],
      ),
    );
  }
}
