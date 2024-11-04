// controller/home_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Index for bottom navigation
  var selectedIndex = 0.obs;

  // Navigation function
  void navigateToScreen(Widget screen) {
    Get.to(() => screen);
  }

  // Handle index change
  void updateIndex(int newIndex) {
    selectedIndex.value = newIndex;
  }
}
