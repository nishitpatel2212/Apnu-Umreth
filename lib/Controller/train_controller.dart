// railway_station_controller.dart
import 'package:get/get.dart';

class RailwayStationController extends GetxController {
  // Observable list of text items
  RxList<String> texts =
      List.generate(10, (index) => 'Rectangle Box ${index + 1}').obs;
}
