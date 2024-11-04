import 'package:apnu_umreth/components/color.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> texts =
      List.generate(10, (index) => 'Rectangle Box ${index + 1}');
  List<String> addresses =
      List.generate(10, (index) => 'Address for Rectangle Box ${index + 1}');
  List<int> likes = List.generate(10, (index) => 0); // To track likes
  List<bool> isSaved =
      List.generate(10, (index) => false); // To track saved state

  void _incrementLikes(int index) {
    setState(() {
      likes[index]++;
    });
  }

  void _toggleSave(int index) {
    setState(() {
      isSaved[index] = !isSaved[index];
    });
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Popular Places',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to SavedScreen and show saved texts
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedScreen(
                    savedTexts: [
                      for (int i = 0; i < texts.length; i++)
                        if (isSaved[i]) texts[i],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: texts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  // Show BottomSheet with address details
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        AddressCard(address: addresses[index]),
                  );
                },
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          texts[index],
                          style: const TextStyle(
                              fontSize: 24, color: Colors.black),
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
                              icon: Icon(Icons.favorite,
                                  color: likes[index] > 0
                                      ? AppColors.redColor
                                      : AppColors.grayColor),
                              onPressed: () => _incrementLikes(index),
                            ),
                            Text('${likes[index]}'),
                            IconButton(
                              icon: Icon(Icons.bookmark,
                                  color: isSaved[index]
                                      ? AppColors.blueColor
                                      : AppColors.grayColor),
                              onPressed: () => _toggleSave(index),
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                // Implement share functionality here
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SavedScreen extends StatelessWidget {
  final List<String> savedTexts;

  const SavedScreen({Key? key, required this.savedTexts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Rectangles'),
      ),
      body: ListView.builder(
        itemCount: savedTexts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(savedTexts[index]),
          );
        },
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String address;

  const AddressCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.redColor, // Customize the color as needed
                size: 24,
              ),
              SizedBox(width: 8.0),
              Text(
                'Place Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            address,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
