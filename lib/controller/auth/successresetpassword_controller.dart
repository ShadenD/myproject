import 'package:get/get.dart';
import 'package:my_project/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offNamed(AppRoute.login);
  }
}
