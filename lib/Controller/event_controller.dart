// event_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  // Reactive variable for the selected day
  Rx<DateTime> selectedDay = DateTime.now().obs;

  // Method to update selected day
  void updateSelectedDay(DateTime day) {
    selectedDay.value = day;
  }

  // Method to show event dialog
  void showEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            content: SizedBox(
              width: 300,
              height: 400,
              child: Column(
                children: [
                  Text(
                    'Event on ${selectedDay.value.toLocal()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your text here',
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
