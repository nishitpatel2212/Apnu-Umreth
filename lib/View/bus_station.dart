import 'package:apnu_umreth/Controller/BusStationController.dart';
import 'package:apnu_umreth/components/Scadule_box_screen.dart';
import 'package:apnu_umreth/components/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusStationView extends StatelessWidget {
  // Initialize the controller
  final BusStationController controller = Get.put(BusStationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Bus Schedule',
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding
          child: ListView.builder(
            itemCount: controller.texts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Use MaterialPageRoute for navigation
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainDetailScreen(
                        title: controller.getTitle(index),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  margin: const EdgeInsets.only(
                      bottom: 8.0), // Spacing between boxes
                  child: Center(
                    child: Text(
                      controller.getTitle(index),
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
