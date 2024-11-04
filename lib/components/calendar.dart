import 'package:apnu_umreth/components/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const CustomCalendar({
    Key? key,
    required this.focusedDay,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 420, // Adjust the height as needed
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.grayColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blackColor, width: 2),
      ),
      child: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: AppColors.blueColor,
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false, // Hides days outside the month
          defaultTextStyle:
              const TextStyle(fontSize: 16), // Standard text style
          weekendTextStyle: const TextStyle(
            color: AppColors.redColor,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          leftChevronMargin: EdgeInsets.symmetric(horizontal: 8),
          rightChevronMargin: EdgeInsets.symmetric(horizontal: 8),
        ),
        onDaySelected: onDaySelected,
      ),
    );
  }
}
