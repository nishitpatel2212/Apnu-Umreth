// view/home_screen.dart
import 'package:apnu_umreth/Controller/homescreen_controller.dart';
import 'package:apnu_umreth/View/bus_station.dart';
import 'package:apnu_umreth/View/event_screen.dart';
import 'package:apnu_umreth/View/news_screen.dart';
import 'package:apnu_umreth/View/train_station.dart';
import 'package:apnu_umreth/components/color.dart';
import 'package:apnu_umreth/View/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access current theme
    final containerColor = theme.colorScheme.surface;
    final textColor = theme.colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor1,
                AppColors.primaryColor2,
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/user.png',
            height: 24.0,
            width: 24.0,
          ),
          onPressed: () {
            controller.navigateToScreen(ProfileScreen());
          },
        ),
        title: const Text(
          "Hello Umreth",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCustomContainer(
                    context,
                    EventScreen(),
                    'assets/icons/event.png',
                    'Events',
                    containerColor,
                    textColor,
                    const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  _buildCustomContainer(
                    context,
                    NewsScreen(),
                    'assets/icons/world-news.png',
                    'Umreth News',
                    containerColor,
                    textColor,
                    const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  _buildCustomContainer(
                    context,
                    BusStationView(),
                    'assets/icons/bus-stop.png',
                    'Bus Schedule',
                    containerColor,
                    textColor,
                    const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  _buildCustomContainer(
                    context,
                    RailwayStation(),
                    'assets/icons/train-station.png',
                    'Train Schedule',
                    containerColor,
                    textColor,
                    const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildHorizontalContainer(
                      context,
                      EventScreen(),
                      'assets/images/news1.png',
                      'Container 1',
                      containerColor,
                      textColor,
                    ),
                    _buildHorizontalContainer(
                      context,
                      EventScreen(),
                      'assets/images/news2.png',
                      'Container 2',
                      containerColor,
                      textColor,
                    ),
                    _buildHorizontalContainer(
                      context,
                      EventScreen(),
                      'assets/images/news1.png',
                      'Container 3',
                      containerColor,
                      textColor,
                    ),
                    _buildHorizontalContainer(
                      context,
                      EventScreen(),
                      'assets/images/news2.png',
                      'Container 4',
                      containerColor,
                      textColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Container Builder
  Widget _buildCustomContainer(
      BuildContext context,
      Widget screen,
      String iconPath,
      String label,
      Color backgroundColor,
      Color textColor,
      BorderRadius borderRadius) {
    return GestureDetector(
      onTap: () => controller.navigateToScreen(screen),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Stack(
          children: [
            // Light black overlay
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1), // Light black overlay
                borderRadius: borderRadius,
              ),
            ),
            // Icon and label
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(iconPath, height: 40, width: 40),
                  const SizedBox(height: 10),
                  Text(label, style: TextStyle(fontSize: 18, color: textColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Horizontal Container Builder
  Widget _buildHorizontalContainer(BuildContext context, Widget screen,
      String iconPath, String label, Color backgroundColor, Color textColor) {
    return GestureDetector(
      onTap: () => controller.navigateToScreen(screen),
      child: Container(
        width: 300,
        height: 170,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            // Light black overlay
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1), // Light black overlay
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            // Icon and label
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(iconPath, height: 40, width: 40),
                  const SizedBox(height: 10),
                  Text(label, style: TextStyle(fontSize: 18, color: textColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
