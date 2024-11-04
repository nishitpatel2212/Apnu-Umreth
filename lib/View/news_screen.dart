import 'package:apnu_umreth/Controller/news_controller.dart';
import 'package:apnu_umreth/components/color.dart';
import 'package:apnu_umreth/View/locationscreen.dart';
import 'package:flutter/material.dart';
import 'package:apnu_umreth/components/common_app_bar.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsController controller = NewsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'News',
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to SavedScreen with MaterialPageRoute
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedScreen(
                    savedTexts: controller.savedTexts,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: controller.texts.length,
          itemBuilder: (context, index) {
            return Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.grayColor,
                border: Border.all(color: Colors.black, width: 0.1),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      controller.texts[index],
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: controller.likes[index] > 0 &&
                                    controller.likes[index] < 1
                                ? AppColors.redColor
                                : AppColors.grayColor,
                          ),
                          onPressed: () {
                            setState(() {
                              controller.incrementLikes(index);
                            });
                          },
                        ),
                        Text('${controller.likes[index]}'),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            color: controller.isSaved[index]
                                ? AppColors.blueColor
                                : AppColors.grayColor,
                          ),
                          onPressed: () {
                            setState(() {
                              controller.toggleSave(index);
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            // Implement share functionality here
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
