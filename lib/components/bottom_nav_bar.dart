import 'package:apnu_umreth/components/color.dart';
import 'package:apnu_umreth/View/home_page.dart';
import 'package:apnu_umreth/View/locationscreen.dart';
import 'package:apnu_umreth/View/profilescreen.dart';
import 'package:apnu_umreth/View/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late NavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = Get.put(
        NavigationController()); // Initialize NavigationController instance
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            backgroundColor: Colors.white,
            buttonBackgroundColor: AppColors.primaryColor1,
            color: AppColors.primaryColor2,
            animationDuration: const Duration(milliseconds: 300),
            index: _navigationController.selectedIndex
                .value, // Use selectedIndex from NavigationController
            items: const <Widget>[
              ImageIcon(AssetImage('assets/icons/home.png'),
                  size: 26, color: Colors.white),
              ImageIcon(AssetImage('assets/icons/search.png'),
                  size: 26, color: Colors.white),
              ImageIcon(AssetImage('assets/icons/location.png'),
                  size: 26, color: Colors.white),
              ImageIcon(AssetImage('assets/icons/user.png'),
                  size: 26, color: Colors.white),
            ],

            onTap: (index) {
              controller.selectedIndex.value = index;
              setState(() {}); // Trigger a rebuild to update the UI
            },
          )),
      body: Obx(() => _navigationController
          .screens[_navigationController.selectedIndex.value]),
    );
  }
}

// ignore: unused_element
List<Widget> _buildNavigationItems() {
  return [
    _buildNavigationItem(Icons.home, 26, Colors.white),
    _buildNavigationItem(Icons.search, 26, Colors.white),
    _buildNavigationItem(Icons.location_on_outlined, 26, Colors.white),
    _buildNavigationItem(Icons.boy, 26, Colors.white),
    // _buildNavigationItem(Icons.person, 26, Colors.white),
  ];
}

Widget _buildNavigationItem(IconData icon, double size, Color color) {
  return NavigationDestination(
    icon: Icon(icon, size: size, color: color),
    size: size,
    color: color,
  );
}

class NavigationDestination extends StatelessWidget {
  final Icon icon;
  final double size;
  final Color color;

  const NavigationDestination({
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
      ],
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Searchscreen(),
    LocationScreen(),
    ProfileScreen(),
  ];
}
