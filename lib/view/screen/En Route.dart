import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class EnRoutePage extends StatelessWidget {
  const EnRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 45),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue),
                title: const Text('Pick starting point'),
                subtitle:
                    const Text('B 420 Broome station, New York, NY 10013, USA'),
                onTap: () {
                  // Handle pick starting point action
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue),
                title: const Text('Pick destination point'),
                subtitle: const Text(
                    '4517 Washington Ave, Manchester, Kentucky 39495'),
                onTap: () {
                  // Handle pick destination point action
                },
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle see en route charging point action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'See en route charging point',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
