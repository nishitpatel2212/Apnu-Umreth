import 'package:apnu_umreth/Controller/train_controller.dart';
import 'package:apnu_umreth/components/Scadule_box_screen.dart';
import 'package:apnu_umreth/components/color.dart';
import 'package:flutter/material.dart';
import 'package:apnu_umreth/components/common_app_bar.dart';

class RailwayStation extends StatefulWidget {
  @override
  _RailwayStationState createState() => _RailwayStationState();
}

class _RailwayStationState extends State<RailwayStation> {
  final RailwayStationController controller = RailwayStationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Train Schedule',
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: controller.texts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to TrainDetailScreen using MaterialPageRoute
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainDetailScreen(
                        title: controller.texts[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: Text(
                      controller.texts[index],
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
