// news_controller.dart
import 'package:get/get.dart';

class NewsController extends GetxController {
  // Reactive lists
  RxList<String> texts =
      List.generate(10, (index) => 'Rectangle Box ${index + 1}').obs;
  RxList<int> likes = List.generate(10, (index) => 0).obs;
  RxList<bool> isSaved = List.generate(10, (index) => false).obs;

  // Method to increment likes
  void incrementLikes(int index) {
    likes[index]++;
  }

  // Method to toggle saved state
  void toggleSave(int index) {
    isSaved[index] = !isSaved[index];
  }

  // Get saved items based on the isSaved list
  List<String> get savedTexts => texts
      .asMap()
      .entries
      .where((entry) => isSaved[entry.key])
      .map((entry) => entry.value)
      .toList();
}
