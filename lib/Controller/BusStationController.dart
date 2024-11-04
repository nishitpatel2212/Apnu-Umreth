import 'package:get/get.dart';

class BusStationController extends GetxController {
  // Reactive list of texts for the schedule boxes
  RxList<String> texts =
      List.generate(10, (index) => 'Rectangle Box ${index + 1}').obs;

  // Method to get the title based on index
  String getTitle(int index) {
    return texts[index];
  }
}
