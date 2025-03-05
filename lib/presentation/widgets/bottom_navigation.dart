import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/utils/navigations.dart';
import 'package:myapp/presentation/screens/home_screen.dart';
import 'package:myapp/presentation/screens/profile_screen.dart';

// ignore: use_key_in_widget_constructors
class BottomNavScreen extends StatelessWidget {
  final BottomNavigationUtils controller = Get.put(BottomNavigationUtils());

  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text('Search')),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
