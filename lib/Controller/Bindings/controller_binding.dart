import 'package:apnu_umreth/Controller/Auth%20Controller/Signin_controller.dart';
import 'package:apnu_umreth/Controller/Auth%20Controller/login_controller.dart';
import 'package:apnu_umreth/Controller/homescreen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ControllerBinding extends Bindings {
  ControllerBinding._();

  // Static instance
  static final ControllerBinding _instance = ControllerBinding._();

  factory ControllerBinding() {
    return _instance;
  }

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
