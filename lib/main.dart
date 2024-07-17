// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/localization/changelocal.dart';
import 'package:my_project/core/localization/translation.dart';
import 'package:my_project/routes.dart';
import 'package:my_project/services/services.dart';
// import 'package:my_project/view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      // home: Language(),
      // routes: routes,
      getPages: routes,
    );
  }
}
