// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/imgaeasset.dart';
import 'package:my_project/view/screen/BookingPage.dart';
import 'package:my_project/view/screen/FAQPage.dart';
import 'package:my_project/view/screen/HelpPage.dart';
import 'package:my_project/view/screen/LanguageScreen.dart';
import 'package:my_project/view/screen/PrivacyPolicyPage.dart';
import 'package:my_project/view/screen/TermsAndConditionsScreen.dart';
import 'package:my_project/view/screen/editprofile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        AppImageAsset.profile), // Replace with actual image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Esther Howard',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+91(1234567890)',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                Get.to(() => Editprofile());
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('My booking'),
              onTap: () {
                Get.to(() => BookingPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap: () {
                Get.to(() => LanguageScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Terms and condition'),
              onTap: () {
                Get.to(() => const TermsAndConditionsScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQs'),
              onTap: () {
                Get.to(() => FAQPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy policy'),
              onTap: () {
                Get.to(() => const PrivacyPolicyPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Get.to(() => HelpPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_sharp),
              title: const Text('Log Out'),
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back(); // Close the dialog
                          Get.offAllNamed('/signin'); // Navigate to SignIn page
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
