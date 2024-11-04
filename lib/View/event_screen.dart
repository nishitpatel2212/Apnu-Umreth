import 'package:apnu_umreth/Controller/event_controller.dart';
import 'package:apnu_umreth/components/color.dart';
import 'package:flutter/material.dart';
import 'package:apnu_umreth/components/calendar.dart';
import 'package:apnu_umreth/components/common_app_bar.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  DateTime selectedDay = DateTime.now();
  final EventController controller = EventController();

  void updateSelectedDay(DateTime day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Events'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Horizontally scrollable boxes
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300,
                        height: 170,
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            'Box ${index + 1}',
                            style: const TextStyle(
                              fontSize: 24,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              CustomCalendar(
                focusedDay: selectedDay,
                onDaySelected: (selectedDay, focusedDay) {
                  updateSelectedDay(selectedDay);
                  controller.showEventDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
