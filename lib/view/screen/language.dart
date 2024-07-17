// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/imgaeasset.dart';
import 'package:my_project/core/constant/routes.dart';
import 'package:my_project/core/localization/changelocal.dart';
import 'package:my_project/view/widget/language/custombuttomlang.dart';

class Language extends GetView<LocaleController> {
  Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 90),
                  child: Image.asset(AppImageAsset.logo)),
              const SizedBox(
                height: 80,
              ),
              Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Arabic",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoute.onBoarding);
                  }),
              CustomButtonLang(
                  textbutton: "English",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.onBoarding);
                  }),
            ],
          )),
    );
  }
}
