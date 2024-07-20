// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_project/controller/pickImage.dart';
import 'package:my_project/core/constant/imgaeasset.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/screen/ProfileScreen.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';
import 'package:my_project/view/widget/auth/customtextformauth.dart';

class Editprofile extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: GetBuilder<EditProfileController>(
          init: EditProfileController(),
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: controller.profileImage.value != null
                        ? FileImage(controller.profileImage.value!)
                        : AssetImage(AppImageAsset.profile) as ImageProvider,
                  ),
                  Positioned(
                    bottom: -6,
                    left: 120,
                    child: IconButton(
                      onPressed: () {
                        controller.pickImage(ImageSource.gallery);
                      },
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),

              SizedBox(
                  height:
                      80), // Add some space between the avatar and text fields
              CustonTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 20, "username");
                },
                mycontroller: controller.username,
                hinttext: "23".tr,
                iconData: Icons.person_outline,
                labeltext: "20".tr,
              ),
              SizedBox(height: 20), // Add some space between text fields
              CustonTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "email");
                },
                mycontroller: controller.email,
                hinttext: "12".tr,
                iconData: Icons.email_outlined,
                labeltext: "18".tr,
              ),
              SizedBox(height: 20), // Add some space between text fields

              CustonTextFormAuth(
                isNumber: true,
                valid: (val) {
                  return validInput(val!, 7, 11, "phone");
                },
                mycontroller: controller.phone,
                hinttext: "22".tr,
                iconData: Icons.phone_android_outlined,
                labeltext: "21".tr,
              ),
              SizedBox(height: 20), // Add some space between text fields

              GetBuilder<EditProfileController>(
                builder: (controller) => CustonTextFormAuth(
                  obscureText: controller.isshowpassword,
                  onTapIcon: () {
                    controller.showPassword();
                  },
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 30, "password");
                  },
                  mycontroller: controller.password,
                  hinttext: "13".tr,
                  iconData: Icons.lock_outline,
                  labeltext: "19".tr,
                ),
              ),
              CustomButtomAuth(
                  text: "42".tr,
                  onPressed: () {
                    Get.to(() => ProfileScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
