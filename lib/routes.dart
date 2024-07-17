import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_project/core/constant/routes.dart';
import 'package:my_project/core/middleware/mymiddleware.dart';
import 'package:my_project/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:my_project/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:my_project/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:my_project/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:my_project/view/screen/auth/login.dart';
import 'package:my_project/view/screen/auth/signup.dart';
import 'package:my_project/view/screen/auth/success_signup.dart';
import 'package:my_project/view/screen/auth/verifycodesignup.dart';
import 'package:my_project/view/screen/language.dart';
import 'package:my_project/view/screen/main/mainScreen.dart';
import 'package:my_project/view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.mainscreen, page: () => MainScreen()),
];
