import 'package:apnu_umreth/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  void register(BuildContext context) {
    if (password.value == confirmPassword.value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()),
      );
    } else {
      Get.snackbar('Error', 'Passwords do not match');
    }
  }

  void navigateToLogin() {
    Get.toNamed('/login');
  }
}
