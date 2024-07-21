import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/HelpController.dart';

class HelpPage extends StatelessWidget {
  final HelpController controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              const SizedBox(height: 8),
              TextField(
                onChanged: controller.setName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
                style: const TextStyle(
                    color: Colors.black), // Text color set to black
              ),
              const SizedBox(height: 16),
              const Text('Email address'),
              const SizedBox(height: 8),
              TextField(
                onChanged: controller.setEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email address',
                ),
                style: const TextStyle(
                    color: Colors.black), // Text color set to black
              ),
              const SizedBox(height: 16),
              const Text('Message'),
              const SizedBox(height: 8),
              TextField(
                onChanged: controller.setMessage,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write message here',
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 90),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
