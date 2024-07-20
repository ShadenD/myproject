import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';

class NotificationPage extends StatelessWidget {
  final MapController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Obx(() {
        return controller.notifications.isEmpty
            ? Center(
                child: Text(
                  'No notifications',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : ListView.builder(
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  final notification = controller.notifications[index];
                  return Card(
                    child: ListTile(
                      title: Text(notification.message),
                      subtitle: Text(
                          '${notification.timestamp.toLocal().toString().split(' ')[0]} ${notification.timestamp.toLocal().toString().split(' ')[1].substring(0, 8)}'),
                    ),
                  );
                },
              );
      }),
    );
  }
}
