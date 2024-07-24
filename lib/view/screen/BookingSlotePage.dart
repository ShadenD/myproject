import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/BookingController.dart';
import 'package:my_project/view/screen/BookingPage.dart';

class SlotBookingPage extends StatelessWidget {
  final BookingController bookingController = Get.put(BookingController());

  void _showVehicleTypePicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              title: const Text('2 wheeler'),
              onTap: () {
                bookingController.updateVehicleType('2 wheeler');
                Get.back();
              },
            ),
            ListTile(
              title: const Text('3 wheeler'),
              onTap: () {
                bookingController.updateVehicleType('3 wheeler');
                Get.back();
              },
            ),
            ListTile(
              title: const Text('4 wheeler'),
              onTap: () {
                bookingController.updateVehicleType('4 wheeler');
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showVehicleModelPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: VehicleModelPicker(),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  void _showConnectionTypePicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.electric_car),
              title: Text('CCS2'),
              subtitle: Text('150kw (\$0.05/kw)'),
              onTap: () {
                bookingController.updateConnectionType('CCS2');
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.electric_car),
              title: Text('CCS'),
              subtitle: Text('120kw (\$0.05/kw)'),
              onTap: () {
                bookingController.updateConnectionType('CCS');
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.electric_car),
              title: Text('Mennekers'),
              subtitle: Text('22kw (\$0.02/kw)'),
              onTap: () {
                bookingController.updateConnectionType('Mennekers');
                Get.back();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate != null) {
        bookingController.updateDate(pickedDate.toString().split(' ')[0]);
      }
    });
  }

  void _showTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      if (pickedTime != null) {
        bookingController.updateTime(pickedTime);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book slot'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vehicle type',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Obx(() => ListTile(
                    title: Text(
                      bookingController.selectedVehicleType.value,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () => _showVehicleTypePicker(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  )),
              const SizedBox(height: 16),
              const Text(
                'Vehicle model',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Obx(() => ListTile(
                    title: Text(
                      bookingController.selectedVehicleModel.value,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () => _showVehicleModelPicker(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  )),
              const SizedBox(height: 16),
              const Text(
                'Connection type',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Obx(() => ListTile(
                    title: Text(
                      bookingController.selectedConnectionType.value,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () => _showConnectionTypePicker(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  )),
              const SizedBox(height: 16),
              const Text(
                'Date',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Obx(() => ListTile(
                    title: Text(
                      bookingController.selectedDate.value,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () => _showDatePicker(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  )),
              const SizedBox(height: 16),
              const Text(
                'Time',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              Obx(() => ListTile(
                    title: Text(
                      bookingController
                          .formattedTime, // Use formattedTime getter here
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_drop_down),
                    onTap: () => _showTimePicker(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  )),
              const SizedBox(height: 16),
              _buildInputTile('Price', 'Set price'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  double price = 50.0; // Replace with actual price input
                  bookingController.addSlot(price);
                  Get.to(() => BookingPage());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ],
    );
  }
}

class VehicleModelPicker extends StatelessWidget {
  final BookingController bookingController = Get.find<BookingController>();

  final List<String> vehicleModels = [
    'Tata Nexon',
    'Honda e',
    'Volvo XC40 Recharge',
    'Kia EV6',
    'BMW i4',
    'MG ZS EV',
    'Porsche Taycan',
    'Jaguar I-Pace'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search vehicle',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                // Update vehicle models list based on search
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vehicleModels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(vehicleModels[index]),
                  onTap: () {
                    bookingController.updateVehicleModel(vehicleModels[index]);
                    Get.back();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
