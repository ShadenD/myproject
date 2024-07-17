import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/LoginController1.dart';
import 'package:my_project/controller/auth/login_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/routes.dart';
import 'package:my_project/core/functions/alertexitapp.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';
import 'package:my_project/view/widget/auth/customtextbodyauth.dart';
import 'package:my_project/view/widget/auth/customtextformauth.dart';
import 'package:my_project/view/widget/auth/customtexttitleauth.dart';
import 'package:my_project/view/widget/auth/logoauth.dart';
import 'package:my_project/view/widget/auth/textsignup.dart';
import 'package:my_project/view/widget/social_buttons.dart';

class Login extends StatelessWidget {
  LoginControllerImp controller = Get.put(LoginControllerImp());
  LoginController1 controller1 = Get.put(LoginController1());

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "15".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: Column(
              children: [
                WillPopScope(
                  onWillPop: alertExitApp,
                  child: Column(
                    children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "11".tr),
                      const SizedBox(height: 15),
                      CustonTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustonTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "13".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "19".tr,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      CustomButtomAuth(
                        text: "15".tr,
                        onPressed: () {
                          controller.login();
                          Get.offNamed(AppRoute.mainscreen);
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or Login using'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      text: 'Facebook',
                      color: Colors.blue,
                      icon: Icons.facebook,
                      onPressed: () {
                        controller1.loginWithFacebook();
                      },
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      text: 'Google',
                      color: Colors.red,
                      icon: Icons.g_mobiledata,
                      onPressed: controller1.loginWithGoogle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
