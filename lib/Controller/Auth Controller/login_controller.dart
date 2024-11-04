import 'package:apnu_umreth/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:apnu_umreth/Controller/Bindings/Routes_name.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;

  void login(BuildContext context) {
    // Perform login logic here (e.g., authentication check)
    // If successful, navigate to the home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()),
    );
  }

  void navigateToRegister(BuildContext context) {
    // Navigate to the registration screen
    Navigator.pushNamed(
      context,
      RoutesName.kSigninScreen,
    );
  }
}
