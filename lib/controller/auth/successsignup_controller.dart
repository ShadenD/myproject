import 'package:get/get.dart';
import 'package:my_project/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offNamed(AppRoute.login);
  }
}