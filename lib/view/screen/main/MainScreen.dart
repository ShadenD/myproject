// main_screen.dart

// ignore_for_file: use_key_in_widget_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/MapController.dart';
import 'package:my_project/controller/NavigationController%20.dart';
import 'package:my_project/core/constant/imgaeasset.dart';
import 'package:my_project/view/screen/En%20Route.dart';
import 'package:my_project/view/screen/ProfileScreen.dart';
import 'package:my_project/view/screen/map.dart';

class MainScreen extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final MapController mapController = Get.put(MapController());
  static final List<Widget> _widgetOptions = <Widget>[
    Map1(),
    const EnRoutePage(),
    const Center(child: Text('Favourite')),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: mapController.selectedIndex.value == 3
            ? null
            : AppBar(
                toolbarHeight: mapController.selectedIndex == 1 ? 300 : null,
                elevation: 0,
                centerTitle: mapController.selectedIndex == 1 ? true : false,
                flexibleSpace: mapController.selectedIndex == 1
                    ? Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppImageAsset.en,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : null,
                backgroundColor: mapController.selectedIndex.value == 0
                    ? Colors.transparent
                    : null,
                leading: mapController.selectedIndex.value == 0
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppImageAsset.profile),
                        ),
                      )
                    : null,
                title: mapController.selectedIndex.value == 0
                    ? const Text('Find your nearest charging point')
                    : mapController.selectedIndex.value == 1
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 250),
                            child: const Text(
                              'En Route Charging Point',
                              style: TextStyle(
                                color: Colors.black,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          )
                        : mapController.selectedIndex.value == 2
                            ? const Text('Favourite')
                            : const Text('Flutter Demo'),
                actions: mapController.selectedIndex.value == 0
                    ? [
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            // Handle filter action
                          },
                        ),
                      ]
                    : null,
              ),
        body: Obx(() => _widgetOptions[mapController.selectedIndex.value]),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.social_distance),
                label: 'En route',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: mapController.selectedIndex.value,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              mapController.changeIndex(index);
            },
          );
        }),
      ),
    );
  }
}
