import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/FAQController.dart';

class FAQPage extends StatelessWidget {
  final FAQController controller = Get.put(FAQController());

  FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildFAQItem(0, 'How to book charging slot?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(1, 'How can i find location of charging hub?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(2, 'How can i find location of En route?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(3, 'Can I find nearest location?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(4, 'How can i find charging point?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(5, 'How can a payment of booking slot?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(6, 'Can I find nearest location?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(7, 'How can i find charging point?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
          _buildFAQItem(8, 'How can a payment of booking slot?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas amet ut eget eu nibh lorem velit.'),
        ],
      ),
    );
  }

  Widget _buildFAQItem(int index, String question, String answer) {
    return Obx(() {
      bool isExpanded = controller.expandedIndex.value == index;
      return GestureDetector(
        onTap: () {
          controller.toggleExpansion(index);
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          elevation: 0, // Remove elevation to remove shadow
          child: Column(
            children: [
              Container(
                color: Colors.white, // Background color of the tile
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                Container(
                  color: Colors.white, // Background color of the expanded area
                  padding: const EdgeInsets.all(16),
                  child: Text(answer),
                ),
            ],
          ),
        ),
      );
    });
  }
}
